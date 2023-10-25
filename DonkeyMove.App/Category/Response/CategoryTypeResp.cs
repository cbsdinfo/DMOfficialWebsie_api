using donkeymove.Repository.Domain;

namespace donkeymove.App.Response
{
    public class CategoryTypeResp : CategoryType
    {
        public string ParentId { get; set; }
        
    }
}