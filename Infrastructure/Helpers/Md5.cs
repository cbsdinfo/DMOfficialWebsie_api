using System;
using System.Security.Cryptography;
using System.Text;

namespace Infrastructure.Helpers
{
    public class Md5
    {
        public static string Encrypt(string str)
        {

            string pwd = String.Empty;

            MD5 md5 = MD5.Create();

            // 編碼UTF8/Unicode　
            byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            // 轉換成字符串
            for (int i = 0; i < s.Length; i++)
            {
                //格式后的字符是小寫的字母
                //如果使用大寫（X）則格式后的字符是大寫字符
                pwd = pwd + s[i].ToString("X");

            }

            return pwd;
        }
    }
}
