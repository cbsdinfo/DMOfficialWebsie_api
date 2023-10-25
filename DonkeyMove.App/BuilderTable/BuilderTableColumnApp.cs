using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using donkeymove.Repository.QueryObj;

namespace donkeymove.App
{
    public class BuilderTableColumnApp : BaseStringApp<BuilderTableColumn, donkeymoveDBContext>
    {
        private DbExtension _dbExtension;

        public BuilderTableColumnApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<BuilderTableColumn, donkeymoveDBContext> repository,
            IAuth auth, DbExtension dbExtension) : base(unitWork, repository, auth)
        {
            _dbExtension = dbExtension;
        }

        /// <summary>
        /// 載入列表
        /// </summary>
        public async Task<TableResp<BuilderTableColumn>> Load(QueryBuilderTableColumnListReq request)
        {
            if (string.IsNullOrEmpty(request.BuilderTableId))
            {
                throw new Exception($"缺少必要的參數BuilderTableId");
            }
            var result = new TableResp<BuilderTableColumn>();
            var objs = UnitWork.Find<BuilderTableColumn>(u => u.TableId == request.BuilderTableId);
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.ColumnName.Contains(request.key));
            }

            result.data = await objs.OrderBy(u => u.ColumnName)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        public void Update(AddOrUpdateBuilderTableColumnReq obj)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<BuilderTableColumn>(u => u.Id == obj.Id, u => new BuilderTableColumn
            {
                TableId = obj.TableId,
                TableName = obj.TableName,
                ColumnName = obj.ColumnName,
                Comment = obj.Comment,
                ColumnType = obj.ColumnType,
                EntityType = obj.EntityType,
                EntityName = obj.EntityName,
                IsKey = obj.IsKey,
                IsIncrement = obj.IsIncrement,
                IsRequired = obj.IsRequired,
                IsInsert = obj.IsInsert,
                IsEdit = obj.IsEdit,
                IsList = obj.IsList,
                IsQuery = obj.IsQuery,
                QueryType = obj.QueryType,
                HtmlType = obj.HtmlType,
                EditType = obj.EditType,
                Sort = obj.Sort,
                CreateTime = obj.CreateTime,
                CreateUserId = obj.CreateUserId,
                EditRow = obj.EditRow,
                EditCol = obj.EditCol,
                CreateUserName = obj.CreateUserName,
                MaxLength = obj.MaxLength,
                DataSource = obj.DataSource,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
                UpdateUserName = user.Name
                //todo:補充或調整自己需要的欄位
            });
        }

        /// <summary>
        /// 同步數據結構
        /// <para>讀取數據庫結構與當前結構的差異，如果數據庫有新增的欄位，則自動加入</para>
        /// </summary>
        public void Sync(SyncStructureReq req)
        {
            var columns = _dbExtension.GetDbTableStructure(req.TableName);
            if (!columns.Any())
            {
                throw new Exception($"未能找到{req.TableName}表結構定義");
            }

            var exists = Find(req.Id).Select(u => u.ColumnName);

            foreach (var column in columns)
            {
                if (exists.Contains(column.ColumnName)) continue;
                var builderColumn = new BuilderTableColumn
                {
                    ColumnName = column.ColumnName,
                    Comment = column.Comment,
                    ColumnType = column.ColumnType,
                    EntityType = column.EntityType,
                    EntityName = column.ColumnName,
                    EditType = GetEditType(column),
                    IsKey = column.IsKey == 1,
                    IsRequired = column.IsNull != 1,
                    IsEdit = true,
                    IsInsert = true,
                    IsList = true,
                    MaxLength = column.MaxLength,
                    TableName = req.TableName,
                    TableId = req.Id,
                    CreateTime = DateTime.Now
                };
                UnitWork.Add(builderColumn);
            }
            UnitWork.Save();
        }

        public List<BuilderTableColumn> Find(string tableId)
        {
            return Repository.Find(u => u.TableId == tableId).ToList();
        }

        public string GetEditType(SysTableColumn sysTableColumn)
        {
            switch (sysTableColumn.EntityType)
            {
                case "string":
                    if (sysTableColumn.ColumnName.Contains("Id") && sysTableColumn.ColumnName != "Id") { return "select"; }
                    else if (sysTableColumn.MaxLength > 1 && sysTableColumn.MaxLength < 2000) { return "text"; }
                    else if (sysTableColumn.ColumnName.ToLower().Contains("photo") || sysTableColumn.ColumnName.ToLower().Contains("pic") || sysTableColumn.ColumnName.ToLower().Contains("img")) { return "img"; }
                    else if (sysTableColumn.ColumnName.ToLower().Contains("file")) { return "file"; }
                    else { return "textarea"; }
                case "bool":
                    return "switch";

                case "DateTime":
                    return "date";

                case "int":
                    return "number";

                case "decimal":
                    return "decimal";

                default:
                    return "";
            }
        }
    }
}