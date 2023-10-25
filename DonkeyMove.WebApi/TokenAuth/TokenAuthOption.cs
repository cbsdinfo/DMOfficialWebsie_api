using Microsoft.AspNetCore.Authentication;

namespace donkeymove.WebApi
{
    public class TokenAuthOption : AuthenticationSchemeOptions
    {
        public TokenAuthOption()
        {
        }
        public const string Scheme = "ApiKey";
    }
}