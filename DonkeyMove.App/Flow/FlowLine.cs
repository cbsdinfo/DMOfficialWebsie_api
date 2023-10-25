// <summary>流程中的連線</summary>

using System.Collections.Generic;
using Infrastructure.Extensions;
using Newtonsoft.Json.Linq;

namespace donkeymove.App.Flow
{
    /// <summary>
    /// 流程連線
    /// </summary>
    public class FlowLine
    {
        public string id { get; set; }
        public string label { get; set; }
        public string type { get; set; }
        public string from { get; set; }
        public string to { get; set; }
        public string name { get; set; }
        public bool dash { get; set; }

        /// <summary> 分支條件 </summary>
        public List<DataCompare> Compares { get; set; }

        public bool Compare(JObject frmDataJson)
        {
            bool result = true;
            foreach (var compare in Compares)
            {
                bool isDecimal = decimal.TryParse(compare.Value, out decimal value);
                var fieldVal = frmDataJson.GetValue(compare.FieldName.ToLower()).ToString();

                if (isDecimal)  //如果是數字或小數
                {
                    decimal frmvalue = decimal.Parse(fieldVal); //表單中填寫的值

                    switch (compare.Operation)
                    {
                        case DataCompare.Equal:
                            result &= compare.Value == fieldVal;
                            break;

                        case DataCompare.Larger:
                            result &= frmvalue > value;
                            break;

                        case DataCompare.Less:
                            result &= frmvalue < value;
                            break;

                        case DataCompare.LargerEqual:
                            result &= frmvalue >= value;
                            break;

                        case DataCompare.LessEqual:
                            result &= frmvalue <= value;
                            break;
                    }
                }
                else //如果只是字符串，只判斷相等
                {
                    result &= compare.Value == fieldVal;
                }
            }

            return result;
        }
    }

    /// <summary>
    ///  分支條件
    /// </summary>
    public class DataCompare
    {
        public const string Larger = ">";
        public const string Less = "<";
        public const string LargerEqual = ">=";
        public const string LessEqual = "<=";
        public const string NotEqual = "!=";
        public const string Equal = "=";

        /// <summary>操作類型比如大于/等于/小于</summary>
        public string Operation { get; set; }

        /// <summary> form種的字段名稱 </summary>
        public string FieldName { get; set; }

        /// <summary> 字段類型："form"：為表單中的字段，后期擴展系統表等. </summary>
        public string FieldType { get; set; }

        /// <summary>比較的值</summary>
        public string Value { get; set; }
    }
}