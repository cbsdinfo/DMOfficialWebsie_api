using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Reflection;
using System.Text;
using Newtonsoft.Json;

namespace Infrastructure.Extensions
{
    public static class ConvertJsonExtension
    {
        #region 私有方法
        /// <summary>
        /// 過濾特殊字符
        /// </summary>
        /// <param name="s">字符串</param>
        /// <returns>json字符串</returns>
        private static string String2Json(String s)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < s.Length; i++)
            {
                char c = s.ToCharArray()[i];
                switch (c)
                {
                    case '\"':
                        sb.Append("\\\""); break;
                    case '\\':
                        sb.Append("\\\\"); break;
                    case '/':
                        sb.Append("\\/"); break;
                    case '\b':
                        sb.Append("\\b"); break;
                    case '\f':
                        sb.Append("\\f"); break;
                    case '\n':
                        sb.Append("\\n"); break;
                    case '\r':
                        sb.Append("\\r"); break;
                    case '\t':
                        sb.Append("\\t"); break;
                    default:
                        sb.Append(c); break;
                }
            }
            return sb.ToString();
        }
        /// <summary>
        /// 格式化字符型、日期型、布爾型
        /// </summary>
        /// <param name="str"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        private static string StringFormat(string str, Type type)
        {
            if (type == typeof(string))
            {
                str = String2Json(str);
                str = "\"" + str + "\"";
            }
            else if (type == typeof(DateTime))
            {
                str = "\"" + str + "\"";
            }
            else if (type == typeof(bool))
            {
                str = str.ToLower();
            }
            else if (type != typeof(string) && string.IsNullOrEmpty(str))
            {
                str = "\"" + str + "\"";
            }
            return str;
        }

        #endregion

        #region list轉換成JSON
        /// <summary>
        /// list轉換為Json
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <returns></returns>
        public static string ListToJson<T>(this IList<T> list)
        {
            object obj = list[0];
            return ListToJson<T>(list, obj.GetType().Name);
        }
        /// <summary>
        /// list轉換為json
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <param name="p"></param>
        /// <returns></returns>
        private static string ListToJson<T>(this IList<T> list, string JsonName)
        {
            if (list.Count == 0)
            {
                return "";
            }
            StringBuilder Json = new StringBuilder();
            if (string.IsNullOrEmpty(JsonName))
                JsonName = list[0].GetType().Name;
            Json.Append("{\"" + JsonName + "\":[");

            for (int i = 0; i < list.Count; i++)
            {
                T obj = Activator.CreateInstance<T>();
                PropertyInfo[] pi = obj.GetType().GetProperties();
                Json.Append("{");
                for (int j = 0; j < pi.Length; j++)
                {
                    Type type = pi[j].GetValue(list[i], null).GetType();
                    Json.Append("\"" + pi[j].Name.ToString() + "\":" + StringFormat(pi[j].GetValue(list[i], null).ToString(), type));
                    if (j < pi.Length - 1)
                    {
                        Json.Append(",");
                    }
                }
                Json.Append("}");
                if (i < list.Count - 1)
                {
                    Json.Append(",");
                }
            }
            Json.Append("]}");
            return Json.ToString();
        }
        #endregion

        #region 對象轉換為Json
        /// <summary>
        /// 對象轉換為json
        /// </summary>
        /// <param name="jsonObject">json對象</param>
        /// <returns>json字符串</returns>
        public static string ToJson(this object jsonObject)
        {
            string jsonString = "{";
            PropertyInfo[] propertyInfo = jsonObject.GetType().GetProperties();
            for (int i = 0; i < propertyInfo.Length; i++)
            {
                object objectValue = propertyInfo[i].GetGetMethod().Invoke(jsonObject, null);
                string value = string.Empty;
                if (objectValue is DateTime || objectValue is Guid || objectValue is TimeSpan)
                {
                    value = "'" + objectValue.ToString() + "'";
                }
                else if (objectValue is string)
                {
                    value = "'" + ToJson(objectValue.ToString()) + "'";
                }
                else if (objectValue is IEnumerable)
                {
                    value = ToJson((IEnumerable)objectValue);
                }
                else
                {
                    value = ToJson(objectValue.ToString());
                }
                jsonString += "\"" + ToJson(propertyInfo[i].Name) + "\":" + value + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "}";
        }

        #endregion

        #region 對象集合轉換為json
        /// <summary>
        /// 對象集合轉換為json
        /// </summary>
        /// <param name="array">對象集合</param>
        /// <returns>json字符串</returns>
        public static string ToJson(this IEnumerable array)
        {
            string jsonString = "{";
            foreach (object item in array)
            {
                jsonString += ToJson(item) + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "]";
        }
        #endregion

        #region 普通集合轉換Json
        /// <summary>    
        /// 普通集合轉換Json   
        /// </summary>   
        /// <param name="array">集合對象</param> 
        /// <returns>Json字符串</returns>  
        public static string ToArrayString(this IEnumerable array)
        {
            string jsonString = "[";
            foreach (object item in array)
            {
                jsonString = ToJson(item.ToString()) + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "]";
        }
        #endregion

        #region  DataSet轉換為Json
        /// <summary>    
        /// DataSet轉換為Json   
        /// </summary>    
        /// <param name="dataSet">DataSet對象</param>   
        /// <returns>Json字符串</returns>    
        public static string ToJson(this DataSet dataSet)
        {
            string jsonString = "{";
            foreach (DataTable table in dataSet.Tables)
            {
                jsonString += "\"" + table.TableName + "\":" + ToJson(table) + ",";
            }
            jsonString = jsonString.TrimEnd(',');
            return jsonString + "}";
        }
        #endregion

        #region Datatable轉換為Json
        /// <summary>     
        /// Datatable轉換為Json     
        /// </summary>    
        /// <param name="table">Datatable對象</param>     
        /// <returns>Json字符串</returns>     
        public static string ToJson(this DataTable dt)
        {
            StringBuilder jsonString = new StringBuilder();
            jsonString.Append("[");
            DataRowCollection drc = dt.Rows;
            for (int i = 0; i < drc.Count; i++)
            {
                jsonString.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    string strKey = dt.Columns[j].ColumnName;
                    string strValue = drc[i][j].ToString();
                    Type type = dt.Columns[j].DataType;
                    jsonString.Append("\"" + strKey + "\":");
                    strValue = StringFormat(strValue, type);
                    if (j < dt.Columns.Count - 1)
                    {
                        jsonString.Append(strValue + ",");
                    }
                    else
                    {
                        jsonString.Append(strValue);
                    }
                }
                jsonString.Append("},");
            }
            jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            return jsonString.ToString();
        }
        /// <summary>    
        /// DataTable轉換為Json     
        /// </summary>    
        public static string ToJson(this DataTable dt, string jsonName)
        {
            StringBuilder Json = new StringBuilder();
            if (string.IsNullOrEmpty(jsonName))
                jsonName = dt.TableName;
            Json.Append("{\"" + jsonName + "\":[");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Json.Append("{");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        Type type = dt.Rows[i][j].GetType();
                        Json.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + StringFormat(dt.Rows[i][j].ToString(), type));
                        if (j < dt.Columns.Count - 1)
                        {
                            Json.Append(",");
                        }
                    }
                    Json.Append("}");
                    if (i < dt.Rows.Count - 1)
                    {
                        Json.Append(",");
                    }
                }
            }
            Json.Append("]}");
            return Json.ToString();
        }

        #endregion

        #region DataReader轉換為Json
        /// <summary>     
        /// DataReader轉換為Json     
        /// </summary>     
        /// <param name="dataReader">DataReader對象</param>     
        /// <returns>Json字符串</returns>  
        public static string ReaderJson(this IDataReader dataReader)
        {
            StringBuilder jsonString = new StringBuilder();
            Dictionary<string, Type> ModelField = new Dictionary<string, Type>();
            for (int i = 0; i < dataReader.FieldCount; i++)
            {
                ModelField.Add(dataReader.GetName(i), dataReader.GetFieldType(i));
            }
            jsonString.Append("[");
            while (dataReader.Read())
            {
                jsonString.Append("{");
                foreach (KeyValuePair<string, Type> keyVal in ModelField)
                {
                    Type type = keyVal.Value;
                    string strKey = keyVal.Key;
                    string strValue = dataReader[strKey].ToString();
                    jsonString.Append("\"" + strKey + "\":");
                    strValue = StringFormat(strValue, type);
                    jsonString.Append(strValue + ",");
                }
                jsonString.Remove(jsonString.Length - 1, 1);
                jsonString.Append("},");
            }
            dataReader.Close();
            jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            return jsonString.ToString();
        }
        #endregion


        public static T DeserializeObject<T>(this string entityString)
        {
            if (string.IsNullOrEmpty(entityString))
            {
                return default(T);
            }
            if (entityString == "{}")
            {
                entityString = "[]";
            }
            return JsonConvert.DeserializeObject<T>(entityString);
        }

        public static string Serialize(this object obj, JsonSerializerSettings formatDate = null)
        {
            if (obj == null)  return null;
            formatDate = formatDate ?? new JsonSerializerSettings
            {
                DateFormatString = "yyyy-MM-dd HH:mm:ss"
            };
            return JsonConvert.SerializeObject(obj, formatDate);
        }

    }
}

