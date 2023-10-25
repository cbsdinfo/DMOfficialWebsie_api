using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using System.Text;
using System.Threading.Tasks;
using Infrastructure;
using Infrastructure.Extensions;
using Infrastructure.Helpers;
using Infrastructure.Utilities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyModel;
using Microsoft.Extensions.Options;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Core;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    public class BuilderTableApp : BaseStringApp<BuilderTable, donkeymoveDBContext>
    {
        private BuilderTableColumnApp _builderTableColumnApp;
        private CategoryApp _categoryApp;
        private DbExtension _dbExtension;
        private string _webProject = string.Empty;
        private string _startName = "";

        private Dictionary<string, Type> PrimitiveTypes = new Dictionary<string, Type>()
        {
            {"int", typeof(int)}
            ,{"long", typeof(long)}
            ,{"string", typeof(string)}
            ,{"bool", typeof(bool)}
            ,{"byte", typeof(byte)}
            ,{"float", typeof(float)}
            ,{"char", typeof(char)}
            ,{"decimal", typeof(decimal)}
            ,{"double", typeof(double)}
            ,{"DateTime", typeof(DateTime)}
        };

        public BuilderTableApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<BuilderTable, donkeymoveDBContext> repository,
                    RevelanceManagerApp app, IAuth auth, DbExtension dbExtension, BuilderTableColumnApp builderTableColumnApp,
      CategoryApp categoryApp) : base(unitWork, repository, auth)
        {
            _dbExtension = dbExtension;
            _builderTableColumnApp = builderTableColumnApp;

            _categoryApp = categoryApp;
        }

        private string StratName
        {
            get
            {
                if (_startName == "")
                {
                    _startName = WebProject.Substring(0, _webProject.IndexOf('.'));
                }

                return _startName;
            }
        }

        private string WebProject
        {
            get
            {
                if (!string.IsNullOrEmpty(_webProject))
                    return _webProject;
                _webProject = ProjectPath.GetLastIndexOfDirectoryName(".WebApi") ??
                             ProjectPath.GetLastIndexOfDirectoryName("Api") ??
                             ProjectPath.GetLastIndexOfDirectoryName(".Mvc");
                if (string.IsNullOrEmpty(_webProject))
                {
                    throw new Exception("未獲取到以.WebApi結尾的項目名稱,無法創建頁面");
                }

                return _webProject;
            }
        }

        /// <summary>
        /// 載入列表
        /// </summary>
        public async Task<TableResp<BuilderTable>> Load(QueryBuilderTableListReq request)
        {
            var loginContext = _auth.GetCurrentUser();
            if (loginContext == null)
            {
                throw new CommonException("登入已過期", Define.INVALID_TOKEN);
            }

            var result = new TableResp<BuilderTable>();
            var objs = UnitWork.Find<BuilderTable>(null);
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Id.Contains(request.key));
            }

            result.data = await objs.OrderBy(u => u.Id)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        public string Add(AddOrUpdateBuilderTableReq req)
        {
            if (string.IsNullOrEmpty(req.TableName))
            {
                throw new Exception("英文表名不能為空");
            }

            if (string.IsNullOrEmpty(req.ModuleName))
            {
                throw new Exception("模塊名稱不能為空");
            }

            if (string.IsNullOrEmpty(req.Namespace))
            {
                throw new Exception("命名空間不能為空");
            }

            var obj = AddTableAndColumns(req.MapTo<BuilderTable>());

            UnitWork.Save();
            return obj.Id;
        }

        public void Update(AddOrUpdateBuilderTableReq obj)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<BuilderTable>(u => u.Id == obj.Id, u => new BuilderTable
            {
                TableName = obj.TableName,
                Comment = obj.Comment,
                ClassName = obj.ClassName,
                Namespace = obj.Namespace,
                ModuleCode = obj.ModuleCode,
                ModuleName = obj.ModuleName,
                Folder = obj.Folder,
                Options = obj.Options,
                TypeId = obj.TypeId,
                TypeName = obj.TypeName,
                IsDynamicHeader = obj.IsDynamicHeader,
                ForeignKey = obj.ForeignKey,
                ParentTableId = obj.ParentTableId,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
                UpdateUserName = user.Name
            });
        }

        /// <summary>
        /// 刪除頭和欄位明細
        /// </summary>
        /// <param name="ids"></param>
        public void DelTableAndcolumns(string[] ids)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                UnitWork.Delete<BuilderTable>(u => ids.Contains(u.Id));
                UnitWork.Delete<BuilderTableColumn>(u => ids.Contains(u.TableId));
                UnitWork.Save();
            });
        }

        /// <summary>
        /// 生成實體Model
        /// </summary>
        /// <returns></returns>
        public void CreateEntity(CreateEntityReq req)
        {
            var sysTableInfo = Repository.FirstOrDefault(u => u.Id == req.Id);
            var tableColumns = _builderTableColumnApp.Find(req.Id);
            if (sysTableInfo == null
                || tableColumns == null
                || tableColumns.Count == 0)
                throw new Exception("未能找到正確的模版信息");

            CheckExistsModule(sysTableInfo.ClassName);

            CreateEntityModel(tableColumns, sysTableInfo);
        }

        /// <summary>
        /// 創建業務邏輯層
        /// </summary>
        /// <returns></returns>
        public void CreateBusiness(CreateBusiReq req)
        {
            var sysTableInfo = Repository.FirstOrDefault(u => u.Id == req.Id);
            var mainColumns = _builderTableColumnApp.Find(req.Id);
            if (sysTableInfo == null
                || mainColumns == null
                || mainColumns.Count == 0)
                throw new Exception("未能找到正確的模版信息");

            //生成應用層
            GenerateApp(sysTableInfo, mainColumns);

            //生成應用層的請求參數
            GenerateAppReq(sysTableInfo, mainColumns);

            //生成應用層的回應參數
            GenerateAppResp(sysTableInfo, mainColumns);
            //生成WebApI接口
            GenerateWebApi(sysTableInfo, mainColumns);
            //生成單元測試
            GenerateAppTest(sysTableInfo, mainColumns);
        }

        /// <summary>
        /// 校驗模塊是否已經存在
        /// </summary>
        /// <param name="moduleName"></param>
        /// <param name="moduleCode"></param>
        /// <exception cref="Exception"></exception>
        public void CheckExistsModule(string moduleCode)
        {
            //如果是第一次創建model，此處反射獲取到的是已經緩存過的文件，必須重新運行項目否則新增的文件無法做判斷文件是否創建，需要重新做反射實際文件，待修改...
            var compilationLibrary = DependencyContext
                .Default
                .CompileLibraries
                .Where(x => !x.Serviceable && x.Type == "project");
            foreach (var compilation in compilationLibrary)
            {
                var types = AssemblyLoadContext.Default
                    .LoadFromAssemblyName(new AssemblyName(compilation.Name))
                    .GetTypes().Where(x => x.GetTypeInfo().BaseType != null
                                           && x.BaseType == typeof(StringEntity));
                foreach (var entity in types)
                {
                    if (entity.Name == moduleCode)
                        throw new Exception($"實際表名【{moduleCode}】已創建實體，不能創建實體");

                    if (entity.Name != moduleCode)
                    {
                        var tableAttr = entity.GetCustomAttribute<TableAttribute>();
                        if (tableAttr != null && tableAttr.Name == moduleCode)
                        {
                            throw new Exception(
                                $"實際表名【{moduleCode}】已被創建建實體,不能創建");
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 創建vue界面
        /// </summary>
        /// <param name="req"></param>
        /// <exception cref="Exception"></exception>
        public void CreateVue(CreateVueReq req)
        {
            if (string.IsNullOrEmpty(req.VueProjRootPath))
            {
                throw new Exception("請提供vue項目的根目錄,如：C:\\donkeymove.Pro\\Client");
            }
            var sysTableInfo = Repository.FirstOrDefault(u => u.Id == req.Id);

            if (!string.IsNullOrEmpty(sysTableInfo.ParentTableId))
            {
                return;
                // throw new Exception("子表不能直接生成vue，請使用該表對應的父表生成vue或刪除該表的父表");
            }

            var tableColumns = _builderTableColumnApp.Find(req.Id);
            if (sysTableInfo == null
                || tableColumns == null
                || tableColumns.Count == 0)
                throw new Exception("未能找到正確的模版信息");

            string domainContent = string.Empty;

            //查找是否存在子表額情況
            var subTable = Repository.FirstOrDefault(u => u.ParentTableId == req.Id);

            if (subTable == null)  //如果子表不存在，則用單模版生成
            {
                if (sysTableInfo.IsDynamicHeader)
                {
                    domainContent = FileHelper.ReadFile(@"Template\\SingleTable\\BuildVueWithDynamicHeader.html");
                }
                else
                {
                    domainContent = FileHelper.ReadFile(@"Template\\SingleTable\\BuildVue.html");
                }

                domainContent = domainContent.Replace("{ClassName}", sysTableInfo.ClassName)
                     .Replace("{TableName}", sysTableInfo.ClassName.ToCamelCase())
                     .Replace("{HeaderList}", BuilderDynamicHeader(tableColumns).ToString())
                     .Replace("{EditColumn}", BuilderHeader(tableColumns).ToString())
                     .Replace("{RulesColumn}", BuilderColumnRules(tableColumns).ToString())
                     .Replace("{ColumnTable}", BuilderColumnList(tableColumns).ToString())
                     .Replace("{FileMethods}", BuilderFileMethods(tableColumns).ToString())
                     .Replace("{ColumnTemp}", BuilderColumnTemp(tableColumns).ToString())

                     ;
            }
            else //如果存在子表，則使用主從表生成
            {
                var subTableColumns = _builderTableColumnApp.Find(subTable.Id);
                if (subTableColumns.Count == 0)
                    throw new Exception($"未找到子表{subTable.ClassName}的欄位定義");

                if (sysTableInfo.IsDynamicHeader)
                {
                    domainContent = FileHelper.ReadFile(@"Template\\MultiTable\\BuildVueWithDynamicHeader.html");
                }
                else
                {
                    domainContent = FileHelper.ReadFile(@"Template\\MultiTable\\BuildVue.html");
                }

                domainContent = domainContent.Replace("{ParentTableId}", subTable.ForeignKey.ToCamelCase())
                    .Replace("{FirstTableName}", sysTableInfo.ClassName.ToCamelCase())
                    .Replace("{SecondTableName}", subTable.ClassName.ToCamelCase())
                    .Replace("{FirstHeaderList}", BuilderDynamicHeader(tableColumns).ToString())
                    .Replace("{SecondHeaderList}", BuilderDynamicHeader(subTableColumns).ToString());
            }

            FileHelper.WriteFile(Path.Combine(req.VueProjRootPath, $"src/views/{sysTableInfo.ClassName.ToLower()}s/"),
                $"index.vue",
                domainContent);
        }

        /// <summary>
        /// 創建vue接口
        /// </summary>
        /// <param name="req"></param>
        /// <exception cref="Exception"></exception>
        public void CreateVueApi(CreateVueReq req)
        {
            if (string.IsNullOrEmpty(req.VueProjRootPath))
            {
                throw new Exception("請提供vue項目的根目錄,如：C:\\donkeymove.Pro\\Client");
            }
            var sysTableInfo = Repository.FirstOrDefault(u => u.Id == req.Id);
            var tableColumns = _builderTableColumnApp.Find(req.Id);
            if (sysTableInfo == null
                || tableColumns == null
                || tableColumns.Count == 0)
                throw new Exception("未能找到正確的模版信息");

            var domainContent = FileHelper.ReadFile(@"Template\\BuildVueApi.html");

            domainContent = domainContent.Replace("{TableName}", sysTableInfo.ClassName.ToCamelCase());

            FileHelper.WriteFile(Path.Combine(req.VueProjRootPath, $"src/api/"), $"{sysTableInfo.ClassName.ToCamelCase()}s.js",
                domainContent);
        }

        /// <summary>
        /// 載入所有的主表（parentId為空的）
        /// </summary>
        /// <returns></returns>
        public async Task<TableData> AllMain()
        {
            var result = new TableData();
            var objs = UnitWork.Find<BuilderTable>(u => string.IsNullOrEmpty(u.ParentTableId)).Select(u => new
            {
                Id = u.Id,
                Name = u.TableName
            });

            result.data = await objs.OrderBy(u => u.Id).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        /// <summary>
        /// 添加表結構及欄位結構記錄
        /// </summary>
        private BuilderTable AddTableAndColumns(BuilderTable obj)
        {
            if (string.IsNullOrEmpty(obj.ClassName)) obj.ClassName = obj.TableName;
            if (string.IsNullOrEmpty(obj.ModuleCode)) obj.ModuleCode = obj.TableName;

            //todo:補充或調整自己需要的欄位
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.CreateUserName = user.Name;
            UnitWork.Add(obj);

            var columns = _dbExtension.GetDbTableStructure(obj.TableName);
            if (!columns.Any())
            {
                throw new Exception($"未能找到{obj.TableName}表結構定義");
            }
            int i = 0;
            foreach (var column in columns)
            {
                var builderColumn = new BuilderTableColumn
                {
                    ColumnName = column.ColumnName,
                    Comment = column.Comment,
                    ColumnType = column.ColumnType,
                    EntityType = column.EntityType,
                    EntityName = column.ColumnName,
                    EditType = _builderTableColumnApp.GetEditType(column),
                    IsKey = column.IsKey == 1,
                    IsRequired = column.IsNull != 1,
                    IsEdit = true,
                    IsInsert = true,
                    IsList = true,
                    MaxLength = column.MaxLength,
                    TableName = obj.TableName,
                    TableId = obj.Id,
                    Sort = i,
                    CreateUserId = user.Id,
                    CreateUserName = user.Name,
                    CreateTime = DateTime.Now
                };
                i++;
                UnitWork.Add(builderColumn);
            }

            return obj;
        }

        /// <summary>
        /// 創建應用層
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <exception cref="Exception"></exception>
        private void GenerateApp(BuilderTable sysTableInfo, List<BuilderTableColumn> sysColumns)
        {
            StringBuilder attributeBuilder = new StringBuilder();
            StringBuilder selectBuilder = new StringBuilder();

            string appRootPath = ProjectPath.GetProjectDirectoryInfo()
                .GetDirectories().FirstOrDefault(x => x.Name.ToLower().EndsWith(".app"))?.FullName;
            if (string.IsNullOrEmpty(appRootPath))
            {
                throw new Exception("未找到donkeymove.app類庫,請確認是否存在");
            }

            CheckExistsModule(sysTableInfo.ModuleCode);

            string domainContent = string.Empty;
            if (sysTableInfo.IsDynamicHeader)   //使用動態頭部的模版
            {
                domainContent = FileHelper.ReadFile(@"Template\\SingleTable\\BuildAppWithDynamicHeader.html");
            }
            else
            {
                domainContent = FileHelper.ReadFile(@"Template\\SingleTable\\BuildApp.html");
            }
            domainContent = domainContent
            .Replace("{TableName}", sysTableInfo.TableName)
            .Replace("{ModuleCode}", sysTableInfo.ModuleCode)
            .Replace("{ModuleName}", sysTableInfo.ModuleName)
            .Replace("{ClassName}", sysTableInfo.ClassName)
            .Replace("{StartName}", StratName);

            if (!string.IsNullOrEmpty(sysTableInfo.ForeignKey))
            {   //替換外鍵模版
                var foreignTemplate = $"objs = objs.Where(u => u.{sysTableInfo.ForeignKey} == request.{sysTableInfo.ForeignKey});";
                domainContent = domainContent
                    .Replace("{ForeignKeyTemplate}", foreignTemplate);
            }
            else
            {
                domainContent = domainContent
                    .Replace("{ForeignKeyTemplate}", "");
            }
            foreach (BuilderTableColumn column in sysColumns)
            {
                var ignor = new List<string>() { "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                if (column.IsKey) continue;
                attributeBuilder.Append(column.EntityName + "=obj." + column.EntityName + ",\r\n");
            }
            domainContent = domainContent.Replace("{Attributes}", attributeBuilder.ToString());

            foreach (BuilderTableColumn column in sysColumns)
            {
                selectBuilder.Append(column.EntityName + "=x." + column.EntityName + ",\r\n");
            }
            domainContent = domainContent.Replace("{Selects}", selectBuilder.ToString());

            var primarykey = sysColumns.FirstOrDefault(u => u.IsKey);
            if (primarykey == null)
            {
                throw new Exception($"未能找到表{sysTableInfo.TableName}的主鍵欄位");
            }
            if (primarykey.ColumnType == "decimal" || primarykey.ColumnType == "numeric") //是否為數字
            {
                if (primarykey.IsIncrement) //是否自增
                {
                    domainContent = domainContent.Replace("{BaseAppName}", "BaseIntAutoGenApp");
                }
                else //普通的雪花算法生成id
                {
                    domainContent = domainContent.Replace("{BaseAppName}", "BaseLongApp");
                }
            }
            else
            {
                domainContent = domainContent.Replace("{BaseAppName}", "BaseStringApp");
            }
            FileHelper.WriteFile($"{appRootPath}\\{sysTableInfo.ModuleCode}", $"{sysTableInfo.ModuleCode}.cs", domainContent);
        }

        /// <summary>
        /// 創建應用層測試
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <exception cref="Exception"></exception>
        private void GenerateAppTest(BuilderTable sysTableInfo, List<BuilderTableColumn> sysColumns)
        {
            StringBuilder addObjBuilder = new StringBuilder();
            StringBuilder updateObjBuilder = new StringBuilder();
            string appRootPath = ProjectPath.GetProjectDirectoryInfo()
                .GetDirectories().FirstOrDefault(x => x.Name.ToLower().EndsWith(".app"))?.FullName;
            if (string.IsNullOrEmpty(appRootPath))
            {
                throw new Exception("未找到donkeymove.app類庫,請確認是否存在");
            }

            //CheckExistsModule(sysTableInfo.ModuleCode);

            string domainContent = string.Empty;
            domainContent = FileHelper.ReadFile(@"Template\\SingleTable\\BuildAppTest.html");
            domainContent = domainContent
            .Replace("{TableName}", sysTableInfo.TableName)
            .Replace("{ModuleCode}", sysTableInfo.ModuleCode)
            .Replace("{ModuleName}", sysTableInfo.ModuleName)
            .Replace("{ClassName}", sysTableInfo.ClassName);

            foreach (BuilderTableColumn column in sysColumns)
            {
                var ignor = new List<string>() { "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                if (column.ColumnName == "Id")
                {
                    addObjBuilder.Append("Id=\"00000\",\r\n");
                    updateObjBuilder.Append("Id=\"00000\",\r\n");
                    continue;
                }
                switch (column.EditType)
                {
                    case "date":
                    case "datetime":
                        addObjBuilder.Append(column.EntityName + "=DateTime.Now,\r\n");
                        updateObjBuilder.Append(column.EntityName + "=DateTime.Now,\r\n");
                        break;

                    case "text":
                    case "textarea":
                    case "select":
                    case "selectDynamic":
                    case "phone":
                    case "img":
                    case "file":
                    case "mail":
                    case "checkbox":
                        addObjBuilder.Append(column.EntityName + "=\"" + column.Comment + "\",\r\n");
                        updateObjBuilder.Append(column.EntityName + "=\"更新" + column.Comment + "\",\r\n");
                        break;

                    case "switch":
                        addObjBuilder.Append(column.EntityName + "=false,\r\n");
                        updateObjBuilder.Append(column.EntityName + "=true,\r\n");
                        break;

                    case "number":
                    case "decimal":
                        addObjBuilder.Append(column.EntityName + "=1,\r\n");
                        updateObjBuilder.Append(column.EntityName + "=2,\r\n");
                        break;

                    default:
                        addObjBuilder.Append(column.EntityName + "=\"" + column.Comment + "\",\r\n");
                        updateObjBuilder.Append(column.EntityName + "=\"更新" + column.Comment + "\",\r\n");
                        break;
                }
                // addObjBuilder.Append(column.EntityName + "=obj." + column.EntityName + ",\r\n");
            }
            domainContent = domainContent.Replace("{AddObj}", addObjBuilder.ToString());
            domainContent = domainContent.Replace("{UpdateObj}", updateObjBuilder.ToString());
            var primarykey = sysColumns.FirstOrDefault(u => u.IsKey);
            if (primarykey == null)
            {
                throw new Exception($"未能找到表{sysTableInfo.TableName}的主鍵欄位");
            }
            if (primarykey.ColumnType == "decimal" || primarykey.ColumnType == "numeric") //是否為數字
            {
                if (primarykey.IsIncrement) //是否自增
                {
                    domainContent = domainContent.Replace("{BaseAppName}", "BaseIntAutoGenApp");
                }
                else //普通的雪花算法生成id
                {
                    domainContent = domainContent.Replace("{BaseAppName}", "BaseLongApp");
                }
            }
            else
            {
                domainContent = domainContent.Replace("{BaseAppName}", "BaseStringApp");
            }
            FileHelper.WriteFile($"{appRootPath}\\Test", $"Test{sysTableInfo.ModuleCode}.cs", domainContent);
        }

        /// <summary>
        /// 生成APP層的請求參數
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <param name="tableColumns"></param>
        private void GenerateAppReq(BuilderTable sysTableInfo, List<BuilderTableColumn> tableColumns)
        {
            string appRootPath = ProjectPath.GetProjectDirectoryInfo()
                .GetDirectories().FirstOrDefault(x => x.Name.ToLower().EndsWith(".app"))?.FullName;
            if (string.IsNullOrEmpty(appRootPath))
            {
                throw new Exception("未找到donkeymove.app類庫,請確認是否存在");
            }
            string domainContent;
            domainContent = FileHelper.ReadFile(@"Template\\BuildQueryReq.html")
                .Replace("{TableName}", sysTableInfo.TableName)
                .Replace("{ModuleCode}", sysTableInfo.ModuleCode)
                .Replace("{ModuleName}", sysTableInfo.ModuleName)
                .Replace("{ClassName}", sysTableInfo.ClassName)
                .Replace("{StartName}", StratName);

            if (!string.IsNullOrEmpty(sysTableInfo.ForeignKey))
            {   //替換外鍵模版
                var foreignTemplate = $" public string {sysTableInfo.ForeignKey} {{ get; set; }}";
                domainContent = domainContent
                    .Replace("{ForeignKeyTemplate}", foreignTemplate);
            }
            else
            {
                domainContent = domainContent
                    .Replace("{ForeignKeyTemplate}", "");
            }

            FileHelper.WriteFile(Path.Combine(appRootPath, $"{sysTableInfo.ModuleCode}\\Request"), $"Query{sysTableInfo.ClassName}ListReq.cs",
                domainContent);

            domainContent = FileHelper.ReadFile(@"Template\\BuildUpdateReq.html");

            StringBuilder attributeBuilder = new StringBuilder();
            var sysColumn = tableColumns.OrderBy(c => c.Sort).ToList();
            foreach (BuilderTableColumn column in sysColumn)
            {
                var ignor = new List<string>() { "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                attributeBuilder.Append("/// <summary>");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("///" + column.Comment + "");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("/// </summary>");
                attributeBuilder.Append("\r\n");

                string entityType = column.EntityType;
                if (!column.IsRequired && column.EntityType != "string")
                {
                    entityType = entityType + "?";
                }
                if (column.IsRequired && !column.IsKey)
                {
                    attributeBuilder.Append("[Required(ErrorMessage=\"" + column.Comment + "請勿空白\")]");
                    attributeBuilder.Append("\r\n");
                }
                if (column.MaxLength.HasValue && column.MaxLength.Value != 0 && column.EntityType == "string" && !column.IsKey)
                {
                    attributeBuilder.Append("[MaxLength(" + column.MaxLength.Value + ",ErrorMessage=\"" + column.Comment + "請勿大於" + column.MaxLength.Value + "字\")]");
                    attributeBuilder.Append("\r\n");
                }
                attributeBuilder.Append("       public " + entityType + " " + column.EntityName + " { get; set; }");
                attributeBuilder.Append("\r\n\r\n       ");
            }

            domainContent = domainContent.Replace("{ClassName}", sysTableInfo.ClassName)
                .Replace("{AttributeList}", attributeBuilder.ToString());

            var tableAttr = new StringBuilder();
            tableAttr.Append("/// <summary>");
            tableAttr.Append("\r\n");
            tableAttr.Append("       ///" + sysTableInfo.Comment + "");
            tableAttr.Append("\r\n");
            tableAttr.Append("       /// </summary>");
            tableAttr.Append("\r\n");
            domainContent = domainContent.Replace("{AttributeManager}", tableAttr.ToString());

            FileHelper.WriteFile(Path.Combine(appRootPath, $"{sysTableInfo.ModuleCode}\\Request"), $"AddOrUpdate{sysTableInfo.ClassName}Req.cs",
                domainContent);
        }
        private void GenerateAppResp(BuilderTable sysTableInfo, List<BuilderTableColumn> tableColumns)
        {
            string appRootPath = ProjectPath.GetProjectDirectoryInfo()
                .GetDirectories().FirstOrDefault(x => x.Name.ToLower().EndsWith(".app"))?.FullName;
            if (string.IsNullOrEmpty(appRootPath))
            {
                throw new Exception("未找到donkeymove.app類庫,請確認是否存在");
            }

            string domainContent = FileHelper.ReadFile(@"Template\\BuildQueryReq.html");

            StringBuilder attributeBuilder = new StringBuilder();
            var sysColumn = tableColumns.OrderBy(c => c.Sort).ToList();
            foreach (BuilderTableColumn column in sysColumn)
            {
                attributeBuilder.Append("/// <summary>");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("///" + column.Comment + "");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("/// </summary>");
                attributeBuilder.Append("\r\n");
                string entityType = column.EntityType;
                if (!column.IsRequired)
                {
                    entityType = entityType + "?";
                }
               
                if (column.MaxLength.HasValue && column.MaxLength.Value >0 && column.EntityType == "string" && !column.IsKey)
                {
                    attributeBuilder.Append("[MaxLength(" + column.MaxLength.Value + ",ErrorMessage=\"" + column.Comment + "請勿大於" + column.MaxLength.Value + "字\")]");
                    attributeBuilder.Append("\r\n");
                }
                attributeBuilder.Append("public " + entityType + " " + column.EntityName + " { get; set; }");
                attributeBuilder.Append("\r\n\r\n       ");
            }

            domainContent = domainContent.Replace("{ClassName}", sysTableInfo.ClassName)
                .Replace("{AttributeList}", attributeBuilder.ToString());

            var tableAttr = new StringBuilder();
            tableAttr.Append("/// <summary>");
            tableAttr.Append("\r\n");
            tableAttr.Append("       ///" + sysTableInfo.Comment + "");
            tableAttr.Append("\r\n");
            tableAttr.Append("       /// </summary>");
            tableAttr.Append("\r\n");
            domainContent = domainContent.Replace("{AttributeManager}", tableAttr.ToString());

            FileHelper.WriteFile(Path.Combine(appRootPath, $"{sysTableInfo.ModuleCode}\\Response"), $"{sysTableInfo.ClassName}Resp.cs",
                domainContent);
        }

        /// <summary>
        /// 創建WebAPI接口
        /// </summary>
        /// <param name="sysTableInfo"></param>
        /// <exception cref="Exception"></exception>
        private void GenerateWebApi(BuilderTable sysTableInfo, List<BuilderTableColumn> sysColumns)
        {
            string domainContent;
            string apiPath = ProjectPath.GetProjectDirectoryInfo()
                .GetDirectories().FirstOrDefault(x => x.Name.ToLower().EndsWith(".webapi"))?.FullName;
            if (string.IsNullOrEmpty(apiPath))
            {
                throw new Exception("未找到webapi類庫,請確認是存在weiapi類庫命名以.webapi結尾");
            }

            var controllerName = sysTableInfo.ClassName + "sController";
            CheckExistsModule(controllerName); //單元測試下無效，因為沒有執行webapi項目
            var controllerPath = apiPath + $"\\Controllers\\";
            domainContent = FileHelper.ReadFile(@"Template\\BuildControllerApi.html")
                .Replace("{TableName}", sysTableInfo.TableName)
                .Replace("{ModuleCode}", sysTableInfo.ModuleCode)
                .Replace("{ModuleName}", sysTableInfo.ModuleName)
                .Replace("{ClassName}", sysTableInfo.ClassName)
                .Replace("{StartName}", StratName);

            var primarykey = sysColumns.FirstOrDefault(u => u.IsKey);
            if (primarykey == null)
            {
                throw new Exception($"未能找到表{sysTableInfo.TableName}的主鍵欄位");
            }
            if (primarykey.ColumnType == "decimal" || primarykey.ColumnType == "numeric") //是否為數字
            {
                if (primarykey.IsIncrement) //是否自增
                {
                    domainContent = domainContent.Replace("{KeyTypeName}", "int");
                }
                else //普通的雪花算法生成id
                {
                    domainContent = domainContent.Replace("{KeyTypeName}", "decimal");
                }
            }
            else
            {
                domainContent = domainContent.Replace("{KeyTypeName}", "string");
            }
            FileHelper.WriteFile(controllerPath, controllerName + ".cs", domainContent);
        }

        /// <summary>
        /// 創建實體
        /// </summary>
        /// <param name="tableColumns"></param>
        /// <param name="sysTableInfo"></param>
        private void CreateEntityModel(List<BuilderTableColumn> sysColumns, BuilderTable tableInfo)
        {
            string template = "BuildEntity.html";
            string domainContent = FileHelper.ReadFile("Template\\" + template);

            StringBuilder attributeBuilder = new StringBuilder();
            StringBuilder constructionBuilder = new StringBuilder();   //生成構造函數初始化值
            sysColumns = sysColumns.OrderBy(c => c.Sort).ToList();
            foreach (BuilderTableColumn column in sysColumns)
            {
                if (column.IsKey) continue;

                attributeBuilder.Append("/// <summary>");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("       ///" + column.Comment + "");
                attributeBuilder.Append("\r\n");
                attributeBuilder.Append("       /// </summary>");
                attributeBuilder.Append("\r\n");

                attributeBuilder.Append("       [Description(\"" + column.Comment + "\")]");
                attributeBuilder.Append("\r\n");

                string entityType = column.EntityType;
                if (!column.IsRequired && column.EntityType != "string")
                {
                    entityType = entityType + "?";
                }
                if (column.IsRequired)
                {
                    attributeBuilder.Append("[Required(ErrorMessage=\"" + column.Comment + "請勿空白\")]");
                    attributeBuilder.Append("\r\n");
                }
                if (column.MaxLength.HasValue && column.MaxLength.Value != 0 && column.EntityType == "string")
                {
                    attributeBuilder.Append("[MaxLength(" + column.MaxLength.Value + ",ErrorMessage=\"" + column.Comment + "請勿大於" + column.MaxLength.Value + "字\")]");
                    attributeBuilder.Append("\r\n");
                }
                attributeBuilder.Append("       public " + entityType + " " + column.EntityName + " { get; set; }");
                attributeBuilder.Append("\r\n\r\n       ");

                constructionBuilder.Append("       this." + column.EntityName
                                                   + "=" + (GetDefault(column.EntityType) ?? "\"\"")
                                                   + ";\r\n");
            }

            //獲取的是本地開發代碼所在目錄，不是發布後的目錄
            string mapPath =
                ProjectPath.GetProjectDirectoryInfo()?.FullName; //new DirectoryInfo(("~/").MapPath()).Parent.FullName;
            if (string.IsNullOrEmpty(mapPath))
            {
                throw new Exception("未找到生成的目錄!");
            }

            var primarykey = sysColumns.FirstOrDefault(u => u.IsKey);
            if (primarykey == null)
            {
                throw new Exception($"未能找到表{tableInfo.TableName}的主鍵欄位");
            }
            if (primarykey.ColumnType == "decimal" || primarykey.ColumnType == "numeric") //是否為數字
            {
                if (primarykey.IsIncrement) //是否自增
                {
                    domainContent = domainContent.Replace("{BaseEntityName}", "IntAutoGenEntity");
                }
                else //普通的雪花算法生成id
                {
                    domainContent = domainContent.Replace("{BaseEntityName}", "LongEntity");
                }
            }
            else
            {
                domainContent = domainContent.Replace("{BaseEntityName}", "StringEntity");
            }

            domainContent = domainContent.Replace("{ClassName}", tableInfo.ClassName)
                .Replace("{AttributeList}", attributeBuilder.ToString())
                .Replace("{Construction}", constructionBuilder.ToString());

            var tableAttr = new StringBuilder();

            tableAttr.Append("/// <summary>");
            tableAttr.Append("\r\n");
            tableAttr.Append("       ///" + tableInfo.Comment + "");
            tableAttr.Append("\r\n");
            tableAttr.Append("       /// </summary>");
            tableAttr.Append("\r\n");
            tableAttr.Append("       [Table(\"" + tableInfo.TableName + "\")]");
            domainContent = domainContent.Replace("{AttributeManager}", tableAttr.ToString());

            FileHelper.WriteFile(
                mapPath +
                $"\\donkeymove.Repository\\Domain\\", tableInfo.ClassName + ".cs",
                domainContent);

            string openAuthDBContextPath = mapPath + "\\donkeymove.Repository\\donkeymoveDBContext.cs";
            FileHelper.RegxAddContentByParenthesis(openAuthDBContextPath, "public virtual DbSet<" + tableInfo.ClassName + "> " + tableInfo.TableName + "s { get; set; }");
        }

        private string? GetDefault(string type)
        {
            Type t = PrimitiveTypes[type];
            if (t == null)
            {
                return null;
            }

            if (t.IsValueType)
            {
                if (type == "DateTime")
                {
                    return "DateTime.Now";
                }
                if (type == "bool")
                {
                    return "false";
                }
                return Activator.CreateInstance(t).ToString();
            }

            return null;
        }

        /// <summary>
        /// 創建vue動態表頭
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderDynamicHeader(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder headerListBuilder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            //string[] eidtTye = new string[] { "select", "selectList", "checkbox" };
            //if (syscolums.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DataSource)))
            //{
            //    throw new Exception($"編輯類型為[{string.Join(',', eidtTye)}]時必須選擇數據源");
            //}

            foreach (BuilderTableColumn column in syscolums)
            {
                headerListBuilder.Append(
                    $" new ColumnDefine('{column.ColumnName.ToCamelCase()}', '{column.Comment}', {column.IsEdit.ToString().ToLower()}, {column.IsList.ToString().ToLower()}, '{column.EditType}', '{column.DataSource}', '{column.EntityType}', '{column.ColumnType}', '{column.EntityName}'),");
                headerListBuilder.Append("\r\n     ");
            }

            return headerListBuilder;
        }

        /// <summary>
        /// 創建vue動態表頭
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderHeader(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder headerListBuilder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            //string[] eidtTye = new string[] { "select", "selectList", "checkbox" };
            //if (syscolums.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DataSource)))
            //{
            //    throw new Exception($"編輯類型為[{string.Join(',', eidtTye)}]時必須選擇數據源");
            //}

            foreach (BuilderTableColumn column in syscolums)
            {
                var ignor = new List<string>() { "Id", "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                switch (column.EditType)
                {
                    case "text":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input type=\"text\" v-model=\"temp.{column.ColumnName.ToCamelCase()}\" size=\"small\" placeholder=\"請輸入{column.Comment}\" ></el-input>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "textarea":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append("<el-input type=\"textarea\"  :autosize=\"{ minRows: 3 }\"" + $" v-model=\"temp.{column.ColumnName.ToCamelCase()}\"  placeholder=\"請輸入{column.Comment}\" ></el-input>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "switch":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-switch  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" active-text=\"是\" inactive-text=\"否\" ></el-switch>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "select":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-select  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請選擇{column.Comment}\"  ><el-option label=\"請選擇\" value=\"請選擇\"></el-option></el-select>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "selectDynamic":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-select  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請選擇{column.Comment}\"  ><el-option label=\"請選擇\" value=\"請選擇\"></el-option></el-select>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "date":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-date-picker type=\"date\"  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請選擇{column.Comment}\"  ></el-date-picker>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "datetime":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-date-picker type=\"datetime\"  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請選擇{column.Comment}\"  ></el-date-picker>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "checkbox":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-checkbox-group  v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請選擇{column.Comment}\"  ><el-checkbox label=\"請選擇\" value=\"請選擇\"></el-checkbox></el-checkbox-group>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "mail":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input type=\"mail\"   v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請輸入{column.Comment}\" size=\"small\"  ></el-input>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "number":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input-number   v-model=\"temp.{column.ColumnName.ToCamelCase()}\" placeholder=\"請輸入{column.Comment}\" size=\"small\"  ></el-input-number>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "decimal":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input-number   v-model=\"temp.{column.ColumnName.ToCamelCase()}\" :step=\"0.1\"  :precision=\"1\" placeholder=\"請輸入{column.Comment}\" size=\"small\"  ></el-input-number>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "phone":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input type=\"tel\" v-model=\"temp.{column.ColumnName.ToCamelCase()}\" size=\"small\" placeholder=\"請輸入{column.Comment}\" ></el-input>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "img":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-upload class=\"upload-demo\"" + "\r\n");
                        headerListBuilder.Append(":action=\"`${baseUrl}/files/upload`\"" + "\r\n");
                        headerListBuilder.Append(":headers=\"{'Authorization': `Bearer ${$store.getters.token}`}\"" + "\r\n");
                        headerListBuilder.Append(":on-success=\"(response, file, fileList) => handleUploadSuccess(response, file, fileList, '" + column.ColumnName.ToCamelCase() + "')\"" + "\r\n");
                        headerListBuilder.Append(":on-remove=\"(file, fileList) => handleUploadRemove( file, fileList, '" + column.ColumnName.ToCamelCase() + "')\"" + "\r\n");
                        headerListBuilder.Append(":on-exceed=\"handleUploadExceed\"" + "\r\n");
                        headerListBuilder.Append(":multiple=\"true\"" + "\r\n");
                        headerListBuilder.Append("list-type=\"picture\"" + "\r\n");
                        headerListBuilder.Append(":limit=\"1\">" + "\r\n");
                        headerListBuilder.Append("<el-button size=\"small\" type=\"primary\">點擊上傳</el-button>" + "\r\n");
                        headerListBuilder.Append("</el-upload>" + "\r\n");
                        headerListBuilder.Append($" 上傳圖片" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;

                    case "file":
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-upload class=\"upload-demo\"" + "\r\n");
                        headerListBuilder.Append(":action=\"`${baseUrl}/files/upload`\"" + "\r\n");
                        headerListBuilder.Append(":headers=\"{'Authorization': `Bearer ${$store.getters.token}`}\"" + "\r\n");
                        headerListBuilder.Append(":on-success=\"(response, file, fileList) => handleUploadSuccess(response, file, fileList, '" + column.ColumnName.ToCamelCase() + "')\"" + "\r\n");
                        headerListBuilder.Append(":on-remove=\"(file, fileList) => handleUploadRemove( file, fileList, '" + column.ColumnName.ToCamelCase() + "')\"" + "\r\n");
                        headerListBuilder.Append(":on-exceed=\"handleUploadExceed\"" + "\r\n");
                        headerListBuilder.Append(":multiple=\"true\"" + "\r\n");
                        headerListBuilder.Append("list-type=\"text\"" + "\r\n");
                        headerListBuilder.Append(":limit=\"1\">" + "\r\n");
                        headerListBuilder.Append("<el-button size=\"small\" type=\"primary\">點擊上傳</el-button>" + "\r\n");
                        headerListBuilder.Append("</el-upload>" + "\r\n");
                        headerListBuilder.Append($" 上傳檔案" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");

                        break;

                    default:
                        headerListBuilder.Append($"<el-col :span='24'>" + "\r\n");
                        headerListBuilder.Append($"<el-form-item label='{column.Comment}' prop='{column.ColumnName.ToCamelCase()}'>" + "\r\n");
                        headerListBuilder.Append($"<el-input type=\"text\" v-model=\"temp.{column.ColumnName.ToCamelCase()}\" size=\"small\" placeholder=\"請輸入{column.Comment}\" ></el-input>" + "\r\n");
                        headerListBuilder.Append($"</el-form-item>" + "\r\n");
                        headerListBuilder.Append($"</el-col>" + "\r\n");
                        break;
                }
            }

            return headerListBuilder;
        }

        /// <summary>
        /// 創建vue動態表頭
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderColumnTemp(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder headerListBuilder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            //string[] eidtTye = new string[] { "select", "selectList", "checkbox" };
            //if (syscolums.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DataSource)))
            //{
            //    throw new Exception($"編輯類型為[{string.Join(',', eidtTye)}]時必須選擇數據源");
            //}
            if (syscolums.Any(x => x.EditType == "img" || x.EditType == "file"))
            {
                headerListBuilder.Append($"baseUrl: process.env.VUE_APP_BASE_API," + "\r\n");
            }
            foreach (BuilderTableColumn column in syscolums)
            {
                var ignor = new List<string>() { "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }

                switch (column.EditType)
                {
                    case "text":
                    case "textarea":
                    case "select":
                    case "date":
                    case "datetime":
                    case "selectDynamic":
                    case "phone":
                    case "img":
                    case "file":
                    case "mail":

                        headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:\"\"," + "\r\n");
                        break;

                    case "switch":
                        headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:false," + "\r\n");
                        break;

                    case "checkbox":
                        headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:[]," + "\r\n");
                        break;

                    case "number":
                    case "decimal":
                        headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:0," + "\r\n");
                        break;

                    default:
                        headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:\"\"," + "\r\n");
                        break;
                }
            }

            return headerListBuilder;
        }

        /// <summary>
        /// 創建vue檔案上傳方法
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderFileMethods(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder builder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            if (syscolums.Any(x => x.EditType == "img" || x.EditType == "file"))
            {
                builder.Append(" handleUploadSuccess(response, file, fileList, key) {" + "\r\n");
                builder.Append("  console.log(fileList, key);" + "\r\n");
                builder.Append("  this.temp[key] = fileList?.map(i => i.response?.result[0]?.filePath).join()" + "\r\n");
                builder.Append("  },                                                                                  " + "\r\n");
                builder.Append(" handleUploadRemove(file, fileList, key) {" + "\r\n");
                builder.Append("   this.temp[key] = fileList?.map(i => i.response?.result[0]?.filePath).join()" + "\r\n");
                builder.Append("  }," + "\r\n");
                builder.Append(" handleUploadExceed() {" + "\r\n");
                builder.Append("   this.$message({" + "\r\n");
                builder.Append("     message: '文件超出個數限制'," + "\r\n");
                builder.Append("     type: 'error'" + "\r\n");
                builder.Append("   });" + "\r\n");
                builder.Append(" }," + "\r\n");
            }
            return builder;
        }

        /// <summary>
        /// 創建vue動態表頭
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderColumnRules(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder headerListBuilder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            //string[] eidtTye = new string[] { "select", "selectList", "checkbox" };
            //if (syscolums.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DataSource)))
            //{
            //    throw new Exception($"編輯類型為[{string.Join(',', eidtTye)}]時必須選擇數據源");
            //}

            foreach (BuilderTableColumn column in syscolums)
            {
                var ignor = new List<string>() { "Id", "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                if (column.IsRequired)
                {
                    headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:" + @"[{required: true, message: '必填欄位', trigger: 'blur' }]," + "\r\n");
                }
                switch (column.EditType)
                {
                    case "phone":// phone: [{ validator: checkPhone, trigger: "blur" }],
                                 // headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:" + @"[{validator: checkPhone, trigger: 'blur' }]," + "\r\n");
                        break;

                    case "mail":
                        // headerListBuilder.Append($"{column.ColumnName.ToCamelCase()}:" + @"[{validator: checkEmail, trigger: 'blur' }]," + "\r\n");
                        break;
                }
            }
            return headerListBuilder;
        }

        /// <summary>
        /// 創建vue動態表頭
        /// </summary>
        /// <returns></returns>
        private StringBuilder BuilderColumnList(List<BuilderTableColumn> tableColumns)
        {
            StringBuilder headerListBuilder = new StringBuilder(); //臨時類的默認值屬性
            var syscolums = tableColumns.OrderByDescending(c => c.Sort).ToList();

            //string[] eidtTye = new string[] { "select", "selectList", "checkbox" };
            //if (syscolums.Exists(x => eidtTye.Contains(x.EditType) && string.IsNullOrEmpty(x.DataSource)))
            //{
            //    throw new Exception($"編輯類型為[{string.Join(',', eidtTye)}]時必須選擇數據源");
            //}

            foreach (BuilderTableColumn column in syscolums)
            {
                var ignor = new List<string>() { "Id", "CreateUserId", "CreateDate", "CreateUserName", "ModifyUserId", "ModifyDate", "ModifyUserName" };
                if (ignor.Contains(column.ColumnName)) { continue; }
                switch (column.EditType)
                {
                    case "text":
                    case "textarea":
                    case "select":
                    case "date":
                    case "datetime":
                    case "selectDynamic":
                    case "phone":
                    case "img":
                    case "file":
                    case "mail":
                    case "checkbox":
                    case "number":
                    case "decimal":

                        headerListBuilder.Append($"<el-table-column min-width=\"50px\" label=\"{column.Comment}\" prop=\"{column.ColumnName.ToCamelCase()}\"></el-table-column>" + "\r\n");
                        break;

                    case "switch":
                        headerListBuilder.Append($"<el-table-column min-width=\"50px\" label=\"是否可用\"><template slot-scope=\"scope\"><span>" + "{{" + $"scope.row.{column.ColumnName.ToCamelCase()} === 1 ? \"是\" : \"否\"" + "}}" + $"</span></template></el-table-column>" + "\r\n");
                        break;

                    default:
                        headerListBuilder.Append($"<el-table-column min-width=\"50px\" label=\"{column.Comment}\" prop=\"{column.ColumnName.ToCamelCase()}\"></el-table-column>" + "\r\n");

                        break;
                }
            }

            return headerListBuilder;
        }
    }
}