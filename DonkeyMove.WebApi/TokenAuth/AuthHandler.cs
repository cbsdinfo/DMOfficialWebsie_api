using Microsoft.AspNetCore.Authentication;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Linq;
using System.Text.Encodings.Web;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Infrastructure;
using System;
using Infrastructure.Cache;
using Infrastructure.Helpers;
using donkeymove.App.SSO;

namespace donkeymove.WebApi
{
    public class AuthHandler : AuthenticationHandler<TokenAuthOption>
    {
        private ICacheContext _cacheContext;
        private LoginParse _loginParse;

        public AuthHandler(IOptionsMonitor<TokenAuthOption> options, ICacheContext cacheContext,
                                   ILoggerFactory logger, LoginParse loginParse,
                                   UrlEncoder encoder,
                                   ISystemClock clock
                                )
            : base(options, logger, encoder, clock)
        {
            _loginParse = loginParse;
            _cacheContext = cacheContext;
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            // have header "api key"?
            if (!Request.Headers.TryGetValue(Define.TOKEN_NAME, out var values))
            {
                return AuthenticateResult.NoResult();
            }

            // "api key" value is empty?
            var apiKey = values.FirstOrDefault();
            if (apiKey == null || string.IsNullOrWhiteSpace(apiKey))
            {
                return AuthenticateResult.NoResult();
            }

            if (_cacheContext.Get<UserAuthSession>(apiKey) == null)
            {
                return AuthenticateResult.NoResult();
            }
            var user = new UserAuthSession();
            user = _cacheContext.Get<UserAuthSession>(apiKey);
            if (user == null)
            {
                return AuthenticateResult.NoResult();
            }
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Account),
                new Claim(ClaimTypes.GivenName, user.Name),
                new Claim(ClaimTypes.Sid, user.Id),
            };

            var claimsIdentity = new ClaimsIdentity(claims, TokenAuthOption.Scheme);
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            var authenticationTicket = new AuthenticationTicket(claimsPrincipal, TokenAuthOption.Scheme);

            return AuthenticateResult.Success(authenticationTicket);
        }
    }
}