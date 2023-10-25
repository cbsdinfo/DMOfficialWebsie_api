using System.Collections.Generic;
using Infrastructure;
using donkeymove.Repository.Domain;

namespace donkeymove.App.Response
{
    public class ModuleView
    {
        /// <summary>
        /// ID
        /// </summary>
        /// <returns></returns>
        public string Id { get; set; }

        /// <summary>
	    /// 節點語義ID
	    /// </summary>
        public string CascadeId { get; set; }

        /// <summary>
        /// 名稱
        /// </summary>
        /// <returns></returns>
        public string Name { get; set; }

        /// <summary>
        /// 主頁面URL
        /// </summary>
        /// <returns></returns>
        public string Url { get; set; }

        /// <summary>
        /// 父節點流水號
        /// </summary>
        /// <returns></returns>
        public string ParentId { get; set; }

        /// <summary>
        /// 父節點流水號
        /// </summary>
        /// <returns></returns>
        public string ParentName { get; set; }

        /// <summary>
        /// 節點圖標文件名稱
        /// </summary>
        /// <returns></returns>
        public string IconName { get; set; }


        /// <summary>
        /// 當前狀態，0：正常，-1：隱藏，不在導航列表中顯示
        /// </summary>
        public int Status { get; set; }


        public bool Checked { get; set; }

        /// <summary>
        /// 排序號
        /// </summary>
        public int SortNo { get; set; }

        public string Code { get; set; }

        public bool IsSys { get; set; }

        /// <summary>
        /// 模塊中的元素
        /// </summary>
        public List<ModuleElement> Elements { get; set; }

        public static implicit operator ModuleView(Module module)
        {
            return module.MapTo<ModuleView>();
        }

        public static implicit operator Module(ModuleView view)
        {
            return view.MapTo<Module>();
        }
    }
}