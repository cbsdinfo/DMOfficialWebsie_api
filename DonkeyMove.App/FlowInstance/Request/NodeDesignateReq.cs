using System.Collections.Generic;

namespace donkeymove.App.Request
{
    public class NodeDesignateReq
    {
        /// <summary>
        /// 如果下個執行節點是運行時指定執行者。需要傳指定的類型
        /// <para>取值為RUNTIME_SPECIAL_ROLE、RUNTIME_SPECIAL_USER</para>
        /// </summary>
        public string NodeDesignateType { get; set; }
        
        /// <summary>
        /// 如果下個執行節點是運行時指定執行者。該值表示具體的執行者
        /// <para>如果NodeDesignateType為RUNTIME_SPECIAL_ROLE，則該值為指定的角色</para>
        /// <para>如果NodeDesignateType為RUNTIME_SPECIAL_USER，則該值為指定的用戶</para>
        /// </summary>
        public string[] NodeDesignates { get; set; }
    }
}
