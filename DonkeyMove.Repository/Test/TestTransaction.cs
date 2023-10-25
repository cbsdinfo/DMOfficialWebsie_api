using System;
using System.Linq;
using NUnit.Framework;
using Microsoft.Extensions.DependencyInjection;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.Repository.Test
{
    /// <summary>
    /// 測試事務
    /// </summary>
    class TestTransaction : TestBase
    {
        /// <summary>
        /// 測試事務正常提交
        /// </summary>
        [Test]
        public void NormalSubmit()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();
            unitWork.ExecuteWithTransaction(() =>
            {
                var account = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");

                AddAndUpdate(account, unitWork);
            });

        }

        /// <summary>
        /// 測試事務回滾
        /// </summary>
        [Test]
        public void SubmitWithRollback()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();
            var account = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");
            try
            {
                unitWork.ExecuteWithTransaction(() =>
                {
                    AddAndUpdate(account, unitWork);

                    throw new Exception("模擬異常");
                });
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            
            //如果沒有插入成功，表示事務發生了回滾
            Assert.IsFalse(unitWork.Any<User>( u=>u.Id == account));

        }

        /// <summary>
        /// 測試添加，單個修改，Z.EntityFramework.Plus條件修改
        /// </summary>
        private void AddAndUpdate(string account, IUnitWork<donkeymoveDBContext> unitWork)
        {
            var user = new User
            {
                Id = account,
                Account = account,
                Name = account,
            };

            unitWork.Add(user);

            unitWork.Save();


            user.Account = "Trans_" + user.Account;
            user.Name = "Trans_" + user.Name;
            unitWork.Update(user);

            unitWork.Save();

            unitWork.Update<User>(u => u.Id == account, u => new User
            {
                Account = "Trans2_" + user.Account
            });
        }


        [Test]
        public void MultiUpdate()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();

            var users = unitWork.Find<User>(u => u.Account.Contains("test"));
            foreach (var user in users)
            {
                user.Name  = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss");
                unitWork.Update(user);
            }
            
            unitWork.Save();
            
        }

        [Test]
        public void MultiUpdate2()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();
            var users = unitWork.Find<User>(null).ToList();
            unitWork.ExecuteWithTransaction(()=>
            {
                foreach (var req in users)
                {
                    unitWork.Update<User>(u =>u.Id == req.Id, user => new User
                    {
                        Name  = "user_" + DateTime.Now.ToString("yyyy_MM_dd HH:mm:ss")
                    });
                    

                    unitWork.Update<SysOrg>(u => u.Id == "08f41bf6-4388-4b1e-bd3e-2ff538b44b1b", u => new SysOrg
                    {
                       CreateTime = DateTime.Now
                    });
                }

                unitWork.Save();
            });

        }
    }
}