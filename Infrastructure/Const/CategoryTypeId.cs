using Microsoft.VisualStudio.TestPlatform.ObjectModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Const
{
    public enum CategoryTypeId
    {
        文章分類, 
    }

    public static class CategoryTypeIdExtensions
    {
        public static string GetStringValue(CategoryTypeId categoryTypeId)
        {
            switch (categoryTypeId)
            {
                case CategoryTypeId.文章分類:
                    return "b6f5998e-9bef-46c6-9d84-b1b1862350c7";                
                default:
                    throw new ArgumentOutOfRangeException(nameof(categoryTypeId), categoryTypeId, null);
            }
        }
    }
}
