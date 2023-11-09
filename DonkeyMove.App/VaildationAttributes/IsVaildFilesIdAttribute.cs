using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace donkeymove.App.VaildationAttributes
{
    public class IsVaildFilesIdAttribute : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            FileApp _fileApp = (FileApp)validationContext.GetService(typeof(FileApp));

            var id = (string)value;

            var file = _fileApp.Get(id);
            if (file == null)
            {
                return new ValidationResult("查無此 Files.Id");
            }

            return ValidationResult.Success;
        }
    }
}
