using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;
using System.Collections.Generic;
using System.Linq;
using System;
using Infrastructure.Extensions;
using Infrastructure;
using Infrastructure.Const;

namespace donkeymove.App
{
    public class InfoNewsApp : BaseStringApp<InfoNews, donkeymoveDBContext>
    {
        public InfoNewsApp(IUnitWork<donkeymoveDBContext> unitWork,
            IRepository<InfoNews, donkeymoveDBContext> repository,
            IAuth auth) : base(unitWork, repository, auth)
        {
        }

        public InfoNewsResp GetById(string id)
        {
            var infoNewsResult = UnitWork.Find<InfoNews>(u => u.Id == id);
            var category = UnitWork.Find<Category>(c => c.TypeId == CategoryTypeIdExtensions.GetStringValue(CategoryTypeId.InfoNewsType));
            
            var result = infoNewsResult
                .Join(category,
                infoNewsResult => infoNewsResult.ClInfoNewsType,
                category => category.DtCode,
                (infoNewsResult, category) => new InfoNewsResp
                {
                    Id = infoNewsResult.Id,
                    Title = infoNewsResult.Title,
                    ClInfoNewsType = infoNewsResult.ClInfoNewsType,
                    InfoNewsTypeName = category.Name,
                    ReleaseTime = infoNewsResult.ReleaseTime,
                    Image = infoNewsResult.Image,
                    ImageDetail = (from f in UnitWork.Find<UploadFile>(null)
                                   where infoNewsResult.Image == f.Id
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
                    Content = infoNewsResult.Content,
                    Link = infoNewsResult.Link,
                    PhotoAuthor = infoNewsResult.PhotoAuthor,
                    PhotoAuthorDetail = (from f in UnitWork.Find<UploadFile>(null)
                                   where infoNewsResult.PhotoAuthor == f.Id
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
                    AboutAuthor = infoNewsResult.AboutAuthor,
                    Status = infoNewsResult.Status,
                    UpdateTime = infoNewsResult.UpdateTime,
                    UpdateUserId = infoNewsResult.UpdateUserId,
                    CreateTime = infoNewsResult.CreateTime,
                    CreateUserId = infoNewsResult.CreateUserId
                }).FirstOrDefault();

            return result;
        }

        public string Add(AddInfoNewsReq request)
        {
            var obj = request.MapTo<InfoNews>();
            obj.CreateTime = DateTime.Now;
            var user = _auth.GetCurrentUser().User;
            obj.CreateUserId = user.Id;
            obj.UpdateUserId = user.Id;
            Repository.Add(obj);
            return obj.Id;
        }

        public void Update(UpdateInfoNewsReq request)
        {
            var user = _auth.GetCurrentUser().User;
            UnitWork.Update<InfoNews>(u => u.Id == request.Id, u => new InfoNews
            {
                Title = request.Title,
                ClInfoNewsType = request.ClInfoNewsType,
                ReleaseTime = request.ReleaseTime,
                Image = request.Image,
                Content = request.Content,
                Link = request.Link,
                PhotoAuthor = request.PhotoAuthor,
                AboutAuthor = request.AboutAuthor,
                Status = request.Status,
                UpdateTime = DateTime.Now,
                UpdateUserId = user.Id,
            });
        }

        public List<InfoNewsListResp> GetList(QueryInfoNewsReq obj)
        {
            var infoNewsResult = UnitWork.Find<InfoNews>(null);

            if (!obj.ClInfoNewsType.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.ClInfoNewsType.IndexOf(obj.ClInfoNewsType) != -1);
            }

            if (!obj.ReleaseTimeLb.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.ReleaseTime.Date >= obj.ReleaseTimeLb.Date);
            }

            if (!obj.ReleaseTimeUb.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.ReleaseTime.Date <= obj.ReleaseTimeUb.Date);
            }

            if (!obj.Title.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.Title.IndexOf(obj.Title) != -1);
            }
            if (!obj.Content.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.Content.IndexOf(obj.Content) != -1);
            }
            if (!obj.Link.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.Link.IndexOf(obj.Link) != -1);
            }
                        
            if (!obj.AboutAuthor.IsNullOrEmpty())
            {
                infoNewsResult = infoNewsResult.Where(s => s.AboutAuthor.IndexOf(obj.AboutAuthor) != -1);
            }

            if (obj.Status != null)
            {
                infoNewsResult = infoNewsResult.Where(s => s.Status.Equals(obj.Status));
            }

            infoNewsResult = infoNewsResult.OrderByDescending(s => s.CreateTime);

            var category = UnitWork.Find<Category>(c => c.TypeId == CategoryTypeIdExtensions.GetStringValue(CategoryTypeId.InfoNewsType));

            var result = infoNewsResult
                .Join(category,
                infoNewsResult => infoNewsResult.ClInfoNewsType,
                category => category.DtCode,
                (infoNewsResult, category) => new InfoNewsListResp
                {
                    Id = infoNewsResult.Id,
                    Title = infoNewsResult.Title,
                    ClInfoNewsType = infoNewsResult.ClInfoNewsType,
                    InfoNewsTypeName = category.Name,
                    ReleaseTime = infoNewsResult.ReleaseTime,
                    Image = infoNewsResult.Image,
                    ImageDetail = (from f in UnitWork.Find<UploadFile>(null)
                                   where infoNewsResult.Image == f.Id
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
                    Content = infoNewsResult.Content,
                    Link = infoNewsResult.Link,
                    PhotoAuthor = infoNewsResult.PhotoAuthor,
                    PhotoAuthorDetail = (from f in UnitWork.Find<UploadFile>(null)
                                         where infoNewsResult.PhotoAuthor == f.Id
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
                    AboutAuthor = infoNewsResult.AboutAuthor,
                    Status = infoNewsResult.Status,
                    UpdateTime = infoNewsResult.UpdateTime,
                    UpdateUserId = infoNewsResult.UpdateUserId,
                    CreateTime = infoNewsResult.CreateTime,
                    CreateUserId = infoNewsResult.CreateUserId
                }).ToList();

            return result;
        }
    }
}
