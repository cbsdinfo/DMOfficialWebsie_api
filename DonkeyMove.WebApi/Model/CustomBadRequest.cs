using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace donkeymove.WebApi.Model
{
    /// <summary>
    /// 自定義模態驗證異常返回信息
    /// </summary>
    public class CustomBadRequest : ValidationProblemDetails
    {
        
        public CustomBadRequest(ActionContext context)
        {
            Title = "WebAPI客戶端傳入的參數無效";
            Detail = "vue客戶端（或其他方式）調用WebAPI時傳入的參數類型與接口需要的類型不匹配";
            Status = 400;
            ConstructErrorMessages(context);
        }
        private void ConstructErrorMessages(ActionContext context)
        {
            foreach (var keyModelStatePair in context.ModelState)
            {
                var key = keyModelStatePair.Key;
                var errors = keyModelStatePair.Value.Errors;
                if(errors.Count == 0) continue;

                    if (errors.Count == 1)
                    {
                        var errorMessage = GetErrorMessage(errors[0]);
                        Errors.Add(key, new[] { errorMessage });
                    }
                    else
                    {
                        var errorMessages = new string[errors.Count];
                        for (var i = 0; i < errors.Count; i++)
                        {
                            errorMessages[i] = GetErrorMessage(errors[i]);
                        }
                        Errors.Add(key, errorMessages);
                    }
                
            }
        }
        string GetErrorMessage(ModelError error)
        {
            return string.IsNullOrEmpty(error.ErrorMessage) ?"The input was not valid.":error.ErrorMessage;
        }
    }
}
