namespace Infrastructure
{
    public static class Define
    {
        public static string USERROLE = "UserRole";       //用戶角色關聯KEY
        public const string ROLERESOURCE= "RoleResource";  //角色資源關聯KEY
        public const string USERORG = "UserOrg";  //用戶機構關聯KEY
        public const string ROLEELEMENT = "RoleElement"; //角色菜單關聯KEY
        public const string ROLEMODULE = "RoleModule";   //角色模塊關聯KEY
        public const string ROLEDATAPROPERTY = "RoleDataProperty";   //角色數據字段權限

        public const string DBTYPE_SQLSERVER = "SqlServer";    //sql server
        public const string DBTYPE_MYSQL = "MySql";    //mysql
        public const string DBTYPE_ORACLE = "Oracle";    //oracle


        public const int INVALID_TOKEN = 50014;     //token無效

        public const string TOKEN_NAME = "X-Token";
        public const string TENANT_ID = "tenantId";


        public const string SYSTEM_USERNAME = "System";
        public const string SYSTEM_USERPWD = "123456";

        public const string DATAPRIVILEGE_LOGINUSER = "{loginUser}";  //數據權限配置中，當前登錄用戶的key
        public const string DATAPRIVILEGE_LOGINROLE = "{loginRole}";  //數據權限配置中，當前登錄用戶角色的key
        public const string DATAPRIVILEGE_LOGINORG = "{loginOrg}";  //數據權限配置中，當前登錄用戶部門的key

        public const string JOBMAPKEY = "OpenJob";
    }
}
