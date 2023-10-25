using System;

namespace donkeymove.Repository.Domain
{
	/// <summary>
	/// 用戶ID
	/// </summary>
	public static class UserExt
	{
	    public static void  CheckPassword(this User user, string password)
	    {
	        if (user.Password != password)
	        {
	            throw  new Exception("密碼錯誤");
	        }
	    }

	}
} 