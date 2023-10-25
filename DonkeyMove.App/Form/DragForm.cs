using System;
using System.Linq;
using System.Text;
using Infrastructure;
using Newtonsoft.Json.Linq;
using donkeymove.Repository;
using donkeymove.Repository.Interface;
using donkeymove.Repository.QueryObj;
namespace donkeymove.App
{
    /// <summary>
    /// 拖動表單，根據表單字段創建數據庫表
    /// </summary>
    public class DragForm: IForm
    {
        private IUnitWork<donkeymoveDBContext> _unitWork;
        public DragForm(IUnitWork<donkeymoveDBContext> unitWork)
        {
            _unitWork = unitWork;
        }
        /**
	     * 功能:  創建表單數據表格（基于sql server）
	     */
        public string GetSql(Repository.Domain.Form form, string dbType)
        {
            if (dbType == Define.DBTYPE_SQLSERVER) //Sql Server
            {
                // 獲取字段并處理
                var jsonArray = JsonHelper.Instance.Deserialize<JObject>(form.ContentData)["list"];
                // 數據庫名稱
                string tableName = form.DbName;
                var exist = _unitWork.FromSql<QueryStringObj>($"select '1' as value from sysobjects where name = '{tableName}' and type = 'U'").SingleOrDefault();
                if (exist != null) return string.Empty;
                // 創建數據表
                StringBuilder sql = new StringBuilder($"CREATE TABLE {tableName} (   [Id] varchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,"); //主鍵
                string sqlDefault = "";
                foreach (var json in jsonArray)
                {
                    string type = json["type"].ToString();
                    string name = json["model"].ToString();
                    sql.Append("[" + name + "] " + field_type_sql(type)); //字段拼接
                    if ("checkboxs" == type)
                        sqlDefault += field_type_sql_default(tableName, name, "0");
                    else
                        sqlDefault += field_type_sql_default(tableName, name, "''");
                }
                sql.Append(");");
                //設置主鍵
                sql.Append("ALTER TABLE " + tableName + " ADD CONSTRAINT [PK_" + form.DbName +
                           "] PRIMARY KEY NONCLUSTERED ([Id])");
                sql.Append(
                    "WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ");
                sql.Append("ON [PRIMARY];");
                //主鍵默認值
                sql.Append("ALTER TABLE " + tableName + " ADD   DEFAULT (newid()) FOR [Id];");
                return sql + sqlDefault;
            }
            else
            {
                // 獲取字段并處理
                var jsonArray = JsonHelper.Instance.Deserialize<JObject>(form.ContentData)["list"];
                // 數據庫名稱
                string tableName = form.DbName;
                var exist = _unitWork.FromSql<QueryStringObj>($"select distinct table_name as value from information_schema.tables where table_name ='{tableName}'").SingleOrDefault();
                if (exist != null) return string.Empty;
                // 創建數據表
                StringBuilder sql = new StringBuilder($"create table if not exists `{tableName}` ( Id varchar(50) not null primary key,"); //主鍵
                foreach (var json in jsonArray)
                {
                    string type = json["type"].ToString();
                    string name = json["model"].ToString();
                    sql.Append("`" + name + "` " + field_type_mysql(type)); //字段拼接
                }

                var result = sql.ToString().TrimEnd(',') + ");";
                return result;
            }
        }
        private string field_type_sql(string leipiplugins)
        {
            if ("textarea" == leipiplugins || "listctrl" == leipiplugins)
            {
                return " text  NULL ,";
            }
            else if ("checkboxs" == leipiplugins)
            {
                return " int NOT NULL ,";
            }
            else
            {
                return " varchar(255)  NULL ,";
            }
        }
        private string field_type_mysql(string leipiplugins)
        {
            if ("textarea" == leipiplugins || "listctrl" == leipiplugins)
            {
                return " varchar(255) null ,";
            }
            else if ("checkboxs" == leipiplugins)
            {
                return " tinyint not null ,";
            }
            else
            {
                return " varchar(255)  NULL ,";
            }
        }
        private string field_type_sql_default(string tablename, string field, string defaultValue)
        {
            return "ALTER TABLE " + tablename + " ADD  DEFAULT (" + defaultValue + ") FOR [" + field + "];";
        }
    }
}