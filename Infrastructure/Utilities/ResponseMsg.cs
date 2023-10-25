using Infrastructure.Const;

namespace Infrastructure.Utilities
{
    public static class ResponseMsg
    {
        public static string GetMsg(this ResponseType responseType)
        {
            string msg;
            switch (responseType)
            {
                case ResponseType.LoginExpiration:
                    msg = "登陸已過期,請重新登陸"; break;
                case ResponseType.TokenExpiration:
                    msg = "Token已過期,請重新登陸"; break;
                case ResponseType.AccountLocked:
                    msg = "帳號已被鎖定"; break;
                case ResponseType.LoginSuccess:
                    msg = "登陸成功"; break;
                case ResponseType.ParametersLack:
                    msg = "參數不完整"; break;
                case ResponseType.NoPermissions:
                    msg = "沒有權限操作"; break;
                case ResponseType.NoRolePermissions:
                    msg = "角色沒有權限操作"; break;
                case ResponseType.ServerError:
                    msg = "服務器好像出了點問題....."; break;
                case ResponseType.LoginError:
                    msg = "用戶名或密碼錯誤"; break;
                case ResponseType.SaveSuccess:
                    msg = "保存成功"; break;
                case ResponseType.NoKey:
                    msg = "沒有主鍵不能編輯"; break;
                case ResponseType.NoKeyDel:
                    msg = "沒有主鍵不能刪除"; break;
                case ResponseType.KeyError:
                    msg = "主鍵不正確或沒有傳入主鍵"; break;
                case ResponseType.EidtSuccess:
                    msg = "編輯成功"; break;
                case ResponseType.DelSuccess:
                    msg = "刪除成功"; break;
                case ResponseType.RegisterSuccess:
                    msg = "注冊成功"; break;
                case ResponseType.AuditSuccess:
                    msg = "審核成功"; break;
                case ResponseType.ModifyPwdSuccess:
                    msg = "密碼修改成功"; break;
                case ResponseType.OperSuccess:
                    msg = "操作成功"; break;
                case ResponseType.PINError:
                    msg = "驗證碼不正確"; break;

                default: msg = responseType.ToString(); break;
            }
            return msg;
        }
    }
}