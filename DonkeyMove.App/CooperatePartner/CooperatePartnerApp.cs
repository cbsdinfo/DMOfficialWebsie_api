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
using Infrastructure.Extensions;
using Infrastructure;

namespace donkeymove.App
{
    public class CooperatePartnerApp : BaseStringApp<CooperatePartner, donkeymoveDBContext>
    {
        private FileApp _fileApp;

        public CooperatePartnerApp(IUnitWork<donkeymoveDBContext> unitWork, 
            IRepository<CooperatePartner, donkeymoveDBContext> repository, 
            FileApp fileApp, IAuth auth) : base(unitWork, repository, auth)
        {
            _fileApp = fileApp;
        }


        public CooperatePartnerResp GetById(string id)
        {
            var result = UnitWork.Find<CooperatePartner>(u => u.Id == id).Select(x => new CooperatePartnerResp
            {
                Id = x.Id,
                Name = x.Name,
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
                Status = x.Status,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).FirstOrDefault();
            return result;
        }

        public string Add(AddCooperatePartnerReq request)
        {
            if (!request.Image.IsNullOrEmpty())
            {
                var file = _fileApp.Get(request.Image);
                if (file == null)
                {
                    throw new Exception("查無此 Image (Files.Id)。");
                }
            }

            var obj = request.MapTo<CooperatePartner>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateCooperatePartnerReq request)
        {
            if (!request.Image.IsNullOrEmpty())
            {
                var file = _fileApp.Get(request.Image);
                if (file == null)
                {
                    throw new Exception("查無此 Image (Files.Id)。");
                }
            }

            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<CooperatePartner>(u => u.Id == request.Id, u => new CooperatePartner
            {
                Image = request.Image,
                Status = request.Status,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
            });
        }

        public List<CooperatePartnerListResp> GetList(QueryCooperatePartnerReq obj)
        {
            var result = UnitWork.Find<CooperatePartner>(null);

            if (!obj.Name.IsNullOrEmpty())
            {
                result = result.Where(s => s.Name.IndexOf(obj.Name) != -1);
            }

            if (!obj.Status.IsNullOrEmpty())
            {
                result = result.Where(s => s.Status == obj.Status);
            }

            return result.Select(x => new CooperatePartnerListResp
            {
                Id = x.Id,
                Name = x.Name,
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
                Status = x.Status,
                UpdateTime = x.UpdateTime,
                UpdateUserId = x.UpdateUserId,
                CreateTime = x.CreateTime,
                CreateUserId = x.CreateUserId
            }).ToList();
        }
    }
}
