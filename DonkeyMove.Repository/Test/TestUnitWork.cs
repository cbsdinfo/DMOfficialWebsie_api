using System;
using System.Data;
using System.Linq;
using Infrastructure;
using Microsoft.Data.SqlClient;
using NUnit.Framework;
using Microsoft.Extensions.DependencyInjection;
using MySqlConnector;
using donkeymove.Repository.Domain;
using donkeymove.Repository.Interface;

namespace donkeymove.Repository.Test
{
    /// <summary>
    /// 測試UnitWork
    /// </summary>
    class TestUnitWork : TestBase
    {
        /// <summary>
        /// 測試存儲過程
        /// </summary>
        [Test]
        public void ExecProcedure()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();
            var users = unitWork.ExecProcedure<User>("sp_alluser");
            Console.WriteLine(JsonHelper.Instance.Serialize(users));
        }
        
        
        /// <summary>
        /// 測試Mysql執行存儲過程
        /// </summary>
        [Test]
        public void ExecProcedureWithParam()
        {
            var unitWork = _autofacServiceProvider.GetService<IUnitWork<donkeymoveDBContext>>();
            var param = new MySqlParameter("keyword", SqlDbType.NVarChar);
            param.Value = "test%";
            var users = unitWork.ExecProcedure<User>("sp_alluser", new []{param});
            Console.WriteLine(JsonHelper.Instance.Serialize(users));
        }
        
    }
}