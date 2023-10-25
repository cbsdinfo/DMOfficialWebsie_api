using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Castle.Core.Internal;
using Infrastructure;
using Infrastructure.Extensions;
using Microsoft.EntityFrameworkCore;
using donkeymove.App.Interface;
using donkeymove.App.Request;
using donkeymove.App.Response;
using donkeymove.Repository;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.App.SocialPractice
{
    public class SocialPracticeApp : BaseStringApp<donkeymove.Repository.Domain.SocialPractice, donkeymoveDBContext>
    {
        private RevelanceManagerApp _revelanceApp;

        public SocialPracticeApp(IUnitWork<donkeymoveDBContext> unitWork, IRepository<donkeymove.Repository.Domain.SocialPractice, donkeymoveDBContext> repository, 
            RevelanceManagerApp app, IAuth auth) : base(unitWork, repository, auth)
        {
            _revelanceApp = app;

        }
    }
}
