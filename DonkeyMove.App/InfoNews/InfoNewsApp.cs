using donkeymove.App.Interface;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    public class InfoNewsApp : BaseStringApp<InfoNews, donkeymoveDBContext>
    {
        public InfoNewsApp(IUnitWork<donkeymoveDBContext> unitWork, 
            IRepository<InfoNews, donkeymoveDBContext> repository, 
            IAuth auth) : base(unitWork, repository, auth)
        {
        }
    }
}
