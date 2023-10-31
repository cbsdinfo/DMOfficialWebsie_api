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
using Infrastructure.Extensions;
using System.DirectoryServices.ActiveDirectory;

namespace donkeymove.App
{
    public class CategoryTypeApp : BaseStringApp<CategoryType, donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;

        /// <summary>
        /// 加載列表
        /// </summary>
        public async Task<TableData> Load(QueryCategoryTypeListReq request)
        {
            var result = new TableData();
            var objs = UnitWork.Find<CategoryType>(null);
            if (!string.IsNullOrEmpty(request.key))
            {
                objs = objs.Where(u => u.Id.Contains(request.key) || u.Name.Contains(request.key));
            }

            result.data = await objs.OrderBy(u => u.Name)
                .Skip((request.page - 1) * request.limit)
                .Take(request.limit).ToListAsync();
            result.count = await objs.CountAsync();
            return result;
        }

        public string Add(AddOrUpdateCategoryTypeReq req)
        {
            var obj = req.MapTo<CategoryType>();
            if (obj.KeyIsNull()) obj.GenerateDefaultKeyVal();
            //todo:補充或調整自己需要的字段
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(AddOrUpdateCategoryTypeReq obj)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<CategoryType>(u => u.Id == obj.Id, u => new CategoryType
            {
                Name = obj.Name,                
                //todo:補充或調整自己需要的字段
                UpdateUserId = user.Id,
                UpdateTime = DateTime.Now
            });

        }

        public new void Delete(string[] ids)
        {
            UnitWork.ExecuteWithTransaction(() =>
            {
                UnitWork.Delete<CategoryType>(u => ids.Contains(u.Id));
                UnitWork.Delete<Category>(u => ids.Contains(u.TypeId));
                UnitWork.Save();
            });

        }

        public List<CategoryType> GetList(AddOrUpdateCategoryTypeReq obj)
        {
            var result = UnitWork.Find<CategoryType>(null);

            if (!obj.Id.IsNullOrEmpty())
                result = result.Where(c => c.Id == obj.Id);

            if (!obj.Id.IsNullOrEmpty())
                result = result.Where(c => c.Name == obj.Name);

            return result.ToList();
        }

        public CategoryTypeApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<CategoryType, donkeymoveDBContext> repository,
            RevelanceManagerApp app, IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;
        }
    }
}