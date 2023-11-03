using donkeymove.Repository.Domain;
using donkeymove.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using donkeymove.Repository.Interface;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using Infrastructure;
using Infrastructure.Extensions;

namespace donkeymove.App
{
    public class KeyVisualApp : BaseStringApp<KeyVisual, donkeymoveDBContext>
    {
        public KeyVisualApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<KeyVisual, donkeymoveDBContext> repository, IAuth auth) : base(unitWork, repository, auth)
        {
        }


        public KeyVisualResp GetById(string id)
        {
            var result = UnitWork.Find<KeyVisual>(u => u.Id == id).Select(x => new KeyVisualResp
            {
                Id = x.Id,
                UnitName = x.UnitName,
                Image = x.Image,
                ImageDetail = (from f in UnitWork.Find<UploadFile>(null)
                               where x.Image == f.Id
                               select new UploadFileResp
                               {
                                   Id = f.Id,
                                   FileName = f.FileName,
                                   FilePath = f.FilePath,
                                   Description = f.Description,
                                   FileType = f.FileType,
                                   FileSize = f.FileSize,
                                   Extension = f.Extension,
                                   Enable = f.Enable,
                                   SortCode = f.SortCode,
                                   DeleteMark = f.DeleteMark,
                                   CreateUserId = f.CreateUserId,
                                   CreateUserName = f.CreateUserName,
                                   CreateTime = f.CreateTime,
                                   Thumbnail = f.Thumbnail,
                                   BelongApp = f.BelongApp,
                                   BelongAppId = f.BelongAppId
                               }).FirstOrDefault(),
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).FirstOrDefault();
            return result;
        }

        public string Add(AddKeyVisualReq keyVisual)
        {
            var obj = keyVisual.MapTo<KeyVisual>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateKeyVisualReq keyVisual)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<KeyVisual>(u => u.Id == keyVisual.Id, u => new KeyVisual
            {
                Image = keyVisual.Image,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
            });
        }

        public List<KeyVisualListResp> GetList(QueryKeyVisualReq obj)
        {
            var result = UnitWork.Find<KeyVisual>(null);

            if (!obj.UnitName.IsNullOrEmpty())
            {
                result = result.Where(s => s.UnitName.IndexOf(obj.UnitName) != -1);
            }
                        
            return result.Select(x => new KeyVisualListResp
            {
                Id = x.Id,
                UnitName = x.UnitName,
                Image = x.Image,
                ImageDetail = (from f in UnitWork.Find<UploadFile>(null)
                               where x.Image == f.Id
                               select new UploadFileResp
                               {
                                   Id = f.Id,
                                   FileName = f.FileName,
                                   FilePath = f.FilePath,
                                   Description = f.Description,
                                   FileType = f.FileType,
                                   FileSize = f.FileSize,
                                   Extension = f.Extension,
                                   Enable = f.Enable,
                                   SortCode = f.SortCode,
                                   DeleteMark = f.DeleteMark,
                                   CreateUserId = f.CreateUserId,
                                   CreateUserName = f.CreateUserName,
                                   CreateTime = f.CreateTime,
                                   Thumbnail = f.Thumbnail,
                                   BelongApp = f.BelongApp,
                                   BelongAppId = f.BelongAppId
                               }).FirstOrDefault(),
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).ToList();
        }
    }
}
