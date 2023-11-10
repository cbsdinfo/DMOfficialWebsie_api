using donkeymove.Repository;
using donkeymove.Repository.Interface;
using Infrastructure.Const;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.VaildationAttributes
{
    public class IsVaildCategoryAttribute : ValidationAttribute
    {
        private string _typeId;

        public IsVaildCategoryAttribute(CategoryTypeId categoryTypeId)
        {
            _typeId = CategoryTypeIdExtensions.GetStringValue(categoryTypeId);
        }
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            CategoryApp _categoryApp = (CategoryApp)validationContext.GetService(typeof(CategoryApp));

            var dtCode = (string)value;

            var category = _categoryApp.isMatch(_typeId,dtCode);

            if (!category)
            {
                return new ValidationResult("此欄位的值無效");
            }

            return ValidationResult.Success;
        }
    }
}
