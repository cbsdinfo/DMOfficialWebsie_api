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

namespace donkeymove.WebApi
{
    public static class AuthenticationExtension
    {
        public static void AddApiKeySupport(this AuthenticationBuilder authenticationBuilder)
        {
            authenticationBuilder
                .AddScheme<TokenAuthOption, AuthHandler>(TokenAuthOption.Scheme,
                                    option =>
                                 {
                                 });
        }
    }
}