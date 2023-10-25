using Infrastructure;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App
{
    /// <summary>
    ///  加載用戶所有可訪問的資源/機構/模塊
    /// </summary>
    public class AuthContextFactory
    {
        private readonly IUnitWork<donkeymoveDBContext> _unitWork;
        private SystemAuthStrategy _systemAuth;
        private NormalAuthStrategy _normalAuthStrategy;

        public AuthContextFactory(SystemAuthStrategy sysStrategy
            , NormalAuthStrategy normalAuthStrategy
            , IUnitWork<donkeymoveDBContext> unitWork)
        {
            _systemAuth = sysStrategy;
            _normalAuthStrategy = normalAuthStrategy;
            _unitWork = unitWork;
        }

        public AuthStrategyContext GetAuthStrategyContext(string userId)
        {
            if (string.IsNullOrEmpty(userId)) return null;

            IAuthStrategy service = null;
            if (userId == "0000")
            {
                service = _systemAuth;
            }
            else
            {
                service = _normalAuthStrategy;
                service.User = _unitWork.FirstOrDefault<User>(u => u.Account == userId);
            }

            return new AuthStrategyContext(service);
        }
    }
}