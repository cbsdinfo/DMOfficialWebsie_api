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
using Infrastructure.Test;

namespace donkeymove.App
{
    public class CategoryApp : BaseStringApp<Category,donkeymoveDBContext>
    {
        /// <summary>
        /// 加載列表
        /// </summary>
        public async Task<TableData> Load(QueryCategoryListReq request)
        {
            var loginContext = _auth.GetCurrentUser();
            if (loginContext == null)
            {
                throw new CommonException("登錄已過期", Define.INVALID_TOKEN);
            }
            
            var columnFields = loginContext.GetTableColumns("Category");
            if (columnFields == null || columnFields.Count == 0)
            {
                throw new Exception("請在代碼生成界面配置Category表的字段屬性");
            }
            
            var result = new TableData();
            var objs = UnitWork.Find<Category>(null);
            if (!string.IsNullOrEmpty(request.TypeId))
            {
                objs = objs.Where(u => u.TypeId == request.TypeId);
            }
            
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Id.Contains(request.key) || u.Name.Contains(request.key));
            }

            var propertyStr = string.Join(',', columnFields.Select(u =>u.ColumnName));
            result.columnFields = columnFields;
            result.data = objs.OrderBy(u => u.DtCode)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).Select($"new ({propertyStr})");
            result.count = await objs.CountAsync();
            return result;
        }

        public string Add(AddOrUpdateCategoryReq req)
        {
            var obj = req.MapTo<Category>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }
        
        public void Update(AddOrUpdateCategoryReq obj)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<Category>(u => u.Id == obj.Id, u => new Category
            {
                Enable = obj.Enable,
                DtValue = obj.DtValue,
                DtCode = obj.DtCode,
                TypeId = obj.TypeId,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id
               //todo:要修改的字段賦值
            });

        }

        /// <summary>
        /// 加載一個分類類型里面的所有值，即字典的所有值
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public List<Category> LoadByTypeId(string typeId)
        {
            return Repository.Find(u => u.TypeId == typeId).ToList();
        }

        public CategoryApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<Category,donkeymoveDBContext> repository,IAuth auth) : base(unitWork, repository, auth)
        {
        }
    }
}