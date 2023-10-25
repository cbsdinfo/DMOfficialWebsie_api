using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using Infrastructure.Const;
using Infrastructure.Utilities;

namespace Infrastructure.Extensions
{
    public static class EntityProperties
    {
        public static string GetExpressionPropertyFirst<TEntity>(this Expression<Func<TEntity, object>> properties)
        {
            string[] arr = properties.GetExpressionProperty();
            if (arr.Length > 0)
                return arr[0];
            return "";
        }

        /// <summary>
        /// 獲取對象里指定成員名稱
        /// </summary>
        /// <typeparam name="TEntity"></typeparam>
        /// <param name="properties"> <![CDATA[格式 Expression<Func<entityt, object>> exp = x => new { x.字段1, x.字段2 };或x=>x.Name]]></param>
        /// <returns></returns>
        public static string[] GetExpressionProperty<TEntity>(this Expression<Func<TEntity, object>> properties)
        {
            if (properties == null)
                return new string[] { };
            if (properties.Body is NewExpression)
                return ((NewExpression) properties.Body).Members.Select(x => x.Name).ToArray();
            if (properties.Body is MemberExpression)
                return new string[] {((MemberExpression) properties.Body).Member.Name};
            if (properties.Body is UnaryExpression)
                return new string[] {((properties.Body as UnaryExpression).Operand as MemberExpression).Member.Name};
            throw new Exception("未實現的表達式");
        }

        public static string ValidateHashInEntity(this Type typeinfo, Dictionary<string, object> dic)
        {
            return typeinfo.ValidateDicInEntity(dic, false);
        }

        public static void RemoveNotExistColumns(this Type typeinfo, List<string> cols)
        {
        }

        /// <summary>
        /// 獲取所有字段的名稱 
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <returns></returns>
        public static List<string> GetAtrrNames(this Type typeinfo)
        {
            return typeinfo.GetProperties().Select(c => c.Name).ToList();
        }

        public static void IsExistColumns(this Type typeinfo)
        {
        }

        public static Dictionary<string, string> GetColumType(this PropertyInfo[] properties)
        {
            return properties.GetColumType(false);
        }

        public static Dictionary<string, string> GetColumType(this PropertyInfo[] properties, bool containsKey)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();
            foreach (PropertyInfo property in properties)
            {
                if (!containsKey && property.IsKey())
                {
                    continue;
                }

                var keyVal = GetColumnType(property, true);
                dictionary.Add(keyVal.Key, keyVal.Value);
            }

            return dictionary;
        }

        private static readonly Dictionary<Type, string> entityMapDbColumnType = new Dictionary<Type, string>()
        {
            {typeof(int), SqlDbTypeName.Int},
            {typeof(int?), SqlDbTypeName.Int},
            {typeof(long), SqlDbTypeName.BigInt},
            {typeof(long?), SqlDbTypeName.BigInt},
            {typeof(decimal), "decimal(18, 5)"},
            {typeof(decimal?), "decimal(18, 5)"},
            {typeof(double), "decimal(18, 5)"},
            {typeof(double?), "decimal(18, 5)"},
            {typeof(float), "decimal(18, 5)"},
            {typeof(float?), "decimal(18, 5)"},
            {typeof(Guid), "UniqueIdentifier"},
            {typeof(Guid?), "UniqueIdentifier"},
            {typeof(byte), "tinyint"},
            {typeof(byte?), "tinyint"},
            {typeof(string), "nvarchar"}
        };

        /// <summary>
        /// 返回屬性的字段及數據庫類型
        /// </summary>
        /// <param name="property"></param>
        /// <param name="lenght">是否包括后字段具體長度:nvarchar(100)</param>
        /// <returns></returns>
        public static KeyValuePair<string, string> GetColumnType(this PropertyInfo property, bool lenght = false)
        {
            string colType = "";
            object objAtrr = property.GetTypeCustomAttributes(typeof(ColumnAttribute), out bool asType);
            if (asType)
            {
                colType = ((ColumnAttribute) objAtrr).TypeName.ToLower();
                if (!string.IsNullOrEmpty(colType))
                {
                    //不需要具體長度直接返回
                    if (!lenght)
                    {
                        return new KeyValuePair<string, string>(property.Name, colType);
                    }

                    if (colType == "decimal" || colType == "double" || colType == "float")
                    {
                        objAtrr = property.GetTypeCustomAttributes(typeof(DisplayFormatAttribute), out asType);
                        colType += "(" + (asType ? ((DisplayFormatAttribute) objAtrr).DataFormatString : "18,5") + ")";
                    }

                    //如果是string,根據 varchar或nvarchar判斷最大長度
                    if (property.PropertyType.ToString() == "System.String")
                    {
                        colType = colType.Split("(")[0];
                        objAtrr = property.GetTypeCustomAttributes(typeof(MaxLengthAttribute), out asType);
                        if (asType)
                        {
                            int length = ((MaxLengthAttribute) objAtrr).Length;
                            colType += "(" + (length < 1 || length > (colType.StartsWith("n") ? 8000 : 4000)
                                ? "max"
                                : length.ToString()) + ")";
                        }
                        else
                        {
                            colType += "(max)";
                        }
                    }

                    return new KeyValuePair<string, string>(property.Name, colType);
                }
            }

            if (entityMapDbColumnType.TryGetValue(property.PropertyType, out string value))
            {
                colType = value;
            }
            else
            {
                colType = SqlDbTypeName.NVarChar;
            }

            if (lenght && colType == SqlDbTypeName.NVarChar)
            {
                colType = "nvarchar(max)";
            }

            return new KeyValuePair<string, string>(property.Name, colType);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="array">將數組轉換成sql語句</param>
        /// <param name="fieldType">指定FieldType數據庫字段類型</param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static string GetArraySql(this object[] array, FieldType fieldType)
        {
            if (array == null || array.Count() == 0)
            {
                return string.Empty;
            }

            string columnType = string.Empty;
            List<ArrayEntity> arrrayEntityList = array.Select(x => new ArrayEntity {column1 = x.ToString()}).ToList();
            return arrrayEntityList.GetEntitySql(false, null, null, null, fieldType);
        }

        /// <summary>
        ///<param name="sql">要執行的sql語句如：通過EntityToSqlTempName.Temp_Insert0.ToString()字符串占位，生成的的sql語句會把EntityToSqlTempName.Temp_Insert0.ToString()替換成生成的sql臨時表數據
        ///    string sql = " ;DELETE FROM " + typeEntity.Name + " where " + typeEntity.GetKeyName() +
        ///      " in (select * from " + EntityToSqlTempName.Temp_Insert0.ToString() + ")";
        /// </param>
        /// </summary>
        /// <param name="array"></param>
        /// <param name="fieldType">指定生成的數組值的類型</param>
        /// <returns></returns>
        public static string GetArraySql(this object[] array, FieldType fieldType, string sql)
        {
            if (array == null || array.Count() == 0)
            {
                return string.Empty;
            }

            string columnType = string.Empty;
            List<ArrayEntity> arrrayEntityList = array.Select(x => new ArrayEntity {column1 = x.ToString()}).ToList();
            return arrrayEntityList.GetEntitySql(false, sql, null, null, fieldType);
        }

        public static string GetArraySql<T>(this object[] array, string sql)
        {
            return array.GetArraySql(typeof(T).GetFieldType(), sql);
        }

        /// <summary>
        /// 根據實體獲取key的類型，用于update或del操作
        /// </summary>
        /// <returns></returns>
        public static FieldType GetFieldType(this Type typeEntity)
        {
            FieldType fieldType;
            string columnType = typeEntity.GetProperties().Where(x => x.Name == typeEntity.GetKeyName()).ToList()[0]
                .GetColumnType(false).Value;
            switch (columnType)
            {
                case SqlDbTypeName.Int:
                    fieldType = FieldType.Int;
                    break;
                case SqlDbTypeName.BigInt:
                    fieldType = FieldType.BigInt;
                    break;
                case SqlDbTypeName.VarChar:
                    fieldType = FieldType.VarChar;
                    break;
                case SqlDbTypeName.UniqueIdentifier:
                    fieldType = FieldType.UniqueIdentifier;
                    break;
                default:
                    fieldType = FieldType.NvarChar;
                    break;
            }

            return fieldType;
        }

        public static string GetEntitySql<T>(this IEnumerable<T> entityList,
            bool containsKey = false,
            string sql = null,
            Expression<Func<T, object>> ignoreFileds = null,
            Expression<Func<T, object>> fixedColumns = null,
            FieldType? fieldType = null
        )
        {
            if (entityList == null || entityList.Count() == 0) return "";
            PropertyInfo[] propertyInfo = typeof(T).GetProperties().ToArray();
            if (propertyInfo.Count() == 0)
            {
                propertyInfo = entityList.ToArray()[0].GetType().GetGenericProperties().ToArray();
            }

            propertyInfo = propertyInfo.GetGenericProperties().ToArray();

            string[] arr = null;
            if (fixedColumns != null)
            {
                arr = fixedColumns.GetExpressionToArray();
                PropertyInfo keyProperty = typeof(T).GetKeyProperty();
                propertyInfo = propertyInfo
                    .Where(x => (containsKey && x.Name == keyProperty.Name) || arr.Contains(x.Name)).ToArray();
            }

            if (ignoreFileds != null)
            {
                arr = ignoreFileds.GetExpressionToArray();
                propertyInfo = propertyInfo.Where(x => !arr.Contains(x.Name)).ToArray();
            }

            Dictionary<string, string> dictProperties = propertyInfo.GetColumType(containsKey);
            if (fieldType != null)
            {
                string realType = fieldType.ToString();
                if ((int) fieldType == 0 || (int) fieldType == 1)
                {
                    realType += "(max)";
                }

                dictProperties = new Dictionary<string, string>
                    {{dictProperties.Select(x => x.Key).ToList()[0], realType}};
            }

            if (dictProperties.Keys.Count * entityList.Count() > 50 * 3000)
            {
                throw new Exception("寫入數據太多,請分開寫入。");
            }

            string cols = string.Join(",", dictProperties.Select(c => "[" + c.Key + "]" + " " + c.Value));
            StringBuilder declareTable = new StringBuilder();

            string tempTablbe = "#" + EntityToSqlTempName.TempInsert.ToString();

            declareTable.Append("CREATE TABLE " + tempTablbe + " (" + cols + ")");
            declareTable.Append("\r\n");

            //參數總數量
            int parCount = (dictProperties.Count) * (entityList.Count());
            int takeCount = 0;
            int maxParsCount = 2050;
            if (parCount > maxParsCount)
            {
                //如果參數總數量超過2100，設置每次分批循環寫入表的大小
                takeCount = maxParsCount / dictProperties.Count;
            }

            int count = 0;
            StringBuilder stringLeft = new StringBuilder();
            StringBuilder stringCenter = new StringBuilder();
            StringBuilder stringRight = new StringBuilder();

            int index = 0;
            foreach (T entity in entityList)
            {
                //每1000行需要分批寫入(數據庫限制每批至多寫入1000行數據)
                if (index == 0 || index >= 1000 || takeCount - index == 0)
                {
                    if (stringLeft.Length > 0)
                    {
                        declareTable.AppendLine(
                            stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                            stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                            stringRight.Remove(stringRight.Length - 1, 1).ToString());

                        stringLeft.Clear();
                        stringCenter.Clear();
                        stringRight.Clear();
                    }

                    stringLeft.AppendLine("exec sp_executesql N'SET NOCOUNT ON;");
                    stringCenter.Append("N'");

                    index = 0;
                    count = 0;
                }

                stringLeft.Append(index == 0 ? "; INSERT INTO  " + tempTablbe + "  values (" : " ");
                index++;
                foreach (PropertyInfo property in propertyInfo)
                {
                    if (!containsKey && property.IsKey())
                    {
                        continue;
                    }

                    string par = "@v" + count;
                    stringLeft.Append(par + ",");
                    stringCenter.Append(par + " " + dictProperties[property.Name] + ",");
                    object val = property.GetValue(entity);
                    if (val == null)
                    {
                        stringRight.Append(par + "=NUll,");
                    }
                    else
                    {
                        stringRight.Append(par + "='" + val.ToString().Replace("'", "''''") + "',");
                    }

                    count++;
                }

                stringLeft.Remove(stringLeft.Length - 1, 1);
                stringLeft.Append("),(");
            }

            if (stringLeft.Length > 0)
            {
                declareTable.AppendLine(
                    stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                    stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                    stringRight.Remove(stringRight.Length - 1, 1).ToString());

                stringLeft.Clear();
                stringCenter.Clear();
                stringRight.Clear();
            }

            if (!string.IsNullOrEmpty(sql))
            {
                sql = sql.Replace(EntityToSqlTempName.TempInsert.ToString(), tempTablbe);
                declareTable.AppendLine(sql);
            }
            else
            {
                declareTable.AppendLine(" SELECT " +
                                        (string.Join(",", fixedColumns?.GetExpressionToArray() ?? new string[] {"*"})) +
                                        " FROM " + tempTablbe);
            }


            if (tempTablbe.Substring(0, 1) == "#")
            {
                declareTable.AppendLine("; drop table " + tempTablbe);
            }

            return declareTable.ToString();
        }


        /// <summary>
        ///此方法適用于數據量少,只有幾列數據，不超過1W行，或幾十列數據不超過1000行的情況下使用
        /// 大批量的數據考慮其他方式
        /// 將datatable生成sql語句，替換datatable作為參數傳入存儲過程
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public static string GetDataTableSql(this DataTable table)
        {
            Dictionary<string, string> dictCloumn = new Dictionary<string, string>();
            for (int i = 0; i < table.Columns.Count; i++)
            {
                dictCloumn.Add(table.Columns[i].ColumnName, "  nvarchar(max)");
            }


            //參數總數量
            int parCount = (dictCloumn.Count) * (table.Rows.Count);
            int takeCount = 0;
            int maxParsCount = 2050;
            if (parCount > maxParsCount)
            {
                //如果參數總數量超過2100，設置每次分批循環寫入表的大小
                takeCount = maxParsCount / dictCloumn.Count;
            }

            if (dictCloumn.Keys.Count * table.Rows.Count > 50 * 3000)
            {
                throw new Exception("寫入數據太多,請分開寫入。");
            }

            string cols = string.Join(",", dictCloumn.Select(c => "[" + c.Key + "]" + " " + c.Value));
            StringBuilder declareTable = new StringBuilder();

            string tempTablbe = "#Temp_Insert0";
            declareTable.Append("CREATE TABLE " + tempTablbe + " (" + cols + ")");
            declareTable.Append("\r\n");
            int count = 0;
            StringBuilder stringLeft = new StringBuilder();
            StringBuilder stringCenter = new StringBuilder();
            StringBuilder stringRight = new StringBuilder();

            int index = 0;

            foreach (DataRow row in table.Rows)
            {
                //每1000行需要分批寫入(數據庫限制每批至多寫入1000行數據)
                if (index == 0 || index >= 1000 || takeCount - index == 0)
                {
                    if (stringLeft.Length > 0)
                    {
                        declareTable.AppendLine(
                            stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                            stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                            stringRight.Remove(stringRight.Length - 1, 1).ToString());

                        stringLeft.Clear();
                        stringCenter.Clear();
                        stringRight.Clear();
                    }

                    //  sbLeft.AppendLine(" INSERT INTO  @toInsert0");
                    stringLeft.AppendLine("exec sp_executesql N'SET NOCOUNT ON;");
                    stringCenter.Append("N'");

                    index = 0;
                    count = 0;
                }

                stringLeft.Append(index == 0 ? "; INSERT INTO  " + tempTablbe + "  values (" : " ");
                index++;
                foreach (KeyValuePair<string, string> keyValue in dictCloumn)
                {
                    string par = "@v" + count;
                    stringLeft.Append(par + ",");
                    stringCenter.Append(par + " " + keyValue.Value + ",");
                    object val = row[keyValue.Key];
                    if (val == null)
                    {
                        stringRight.Append(par + "=NUll,");
                    }
                    else
                    {
                        stringRight.Append(par + "='" + val.ToString().Replace("'", "''''") + "',");
                    }

                    count++;
                }

                stringLeft.Remove(stringLeft.Length - 1, 1);
                stringLeft.Append("),(");
            }


            if (stringLeft.Length > 0)
            {
                declareTable.AppendLine(
                    stringLeft.Remove(stringLeft.Length - 2, 2).Append("',").ToString() +
                    stringCenter.Remove(stringCenter.Length - 1, 1).Append("',").ToString() +
                    stringRight.Remove(stringRight.Length - 1, 1).ToString());

                stringLeft.Clear();
                stringCenter.Clear();
                stringRight.Clear();
            }

            declareTable.AppendLine(" SELECT * FROM " + tempTablbe);
            if (tempTablbe.Substring(0, 1) == "#")
            {
                declareTable.AppendLine("; drop table " + tempTablbe);
            }

            return declareTable.ToString();
        }


        public static string GetKeyName(this Type typeinfo)
        {
            return typeinfo.GetProperties().GetKeyName();
        }

        public static string GetKeyType(this Type typeinfo)
        {
            string keyType = typeinfo.GetProperties().GetKeyName(true);
            if (keyType == "varchar")
            {
                return "varchar(max)";
            }
            else if (keyType != "nvarchar")
            {
                return keyType;
            }
            else
            {
                return "nvarchar(max)";
            }
        }

        public static string GetKeyName(this PropertyInfo[] properties)
        {
            return properties.GetKeyName(false);
        }

        /// <summary>
        /// 獲取key列名
        /// </summary>
        /// <param name="properties"></param>
        /// <param name="keyType">true獲取key對應類型,false返回對象Key的名稱</param>
        /// <returns></returns>
        public static string GetKeyName(this PropertyInfo[] properties, bool keyType)
        {
            string keyName = string.Empty;
            foreach (PropertyInfo propertyInfo in properties)
            {
                if (!propertyInfo.IsKey())
                    continue;
                if (!keyType)
                    return propertyInfo.Name;
                var attributes = propertyInfo.GetCustomAttributes(typeof(ColumnAttribute), false);
                //如果沒有ColumnAttribute的需要單獨再驗證，下面只驗證有屬性的
                if (attributes.Length > 0)
                    return ((ColumnAttribute) attributes[0]).TypeName.ToLower();
                else
                    return GetColumType(new PropertyInfo[] {propertyInfo}, true)[propertyInfo.Name];
            }

            return keyName;
        }

        /// <summary>
        /// 獲取主鍵字段
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static PropertyInfo GetKeyProperty(this Type entity)
        {
            return entity.GetProperties().GetKeyProperty();
        }

        public static PropertyInfo GetKeyProperty(this PropertyInfo[] properties)
        {
            return properties.Where(c => c.IsKey()).FirstOrDefault();
        }

        public static bool IsKey(this PropertyInfo propertyInfo)
        {
            object[] keyAttributes = propertyInfo.GetCustomAttributes(typeof(KeyAttribute), false);
            if (keyAttributes.Length > 0)
                return true;
            return false;
        }


        private static string[] _userEditFields { get; set; }


        /// <summary>
        /// 判斷是否包含某個屬性
        /// <para>public string MO {get; set; }包含Editable</para>
        /// </summary>
        public static bool ContainsCustomAttributes(this PropertyInfo propertyInfo, Type type)
        {
            propertyInfo.GetTypeCustomAttributes(type, out bool contains);
            return contains;
        }

        public static List<PropertyInfo> ContainsCustomAttributes(this Type obj, Type containType)
        {
            List<PropertyInfo> proList = new List<PropertyInfo>();
            foreach (PropertyInfo pro in obj.GetProperties())
            {
                if (pro.GetTypeCustomAttributes(containType) != null)
                {
                    proList.Add(pro);
                }
            }

            return proList;
        }

        /// <summary>
        /// 獲取PropertyInfo指定屬性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this PropertyInfo propertyInfo, Type type, out bool asType)
        {
            object[] attributes = propertyInfo.GetCustomAttributes(type, false);
            if (attributes.Length == 0)
            {
                asType = false;
                return new string[0];
            }

            asType = true;
            return attributes[0];
        }

        /// <summary>
        /// 驗證集合的屬性
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entityList"></param>
        /// <param name="expression"></param>
        /// <returns></returns>
        public static void ValidationEntityList<T>(this List<T> entityList,
            Expression<Func<T, object>> expression = null)
        {
            WebResponseContent responseData = new WebResponseContent();
            foreach (T entity in entityList)
            {
                entity.ValidationEntity(expression);
            }
        }

        /// <summary>
        /// 指定需要驗證的字段
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="expression">對指定屬性進行驗證x=>{x.Name,x.Size}</param>
        /// <returns></returns>
        public static void ValidationEntity<T>(this T entity, Expression<Func<T, object>> expression = null,
            Expression<Func<T, object>> validateProperties = null)
        {
            ValidationEntity<T>(entity, expression?.GetExpressionProperty<T>(),
                validateProperties?.GetExpressionProperty<T>());
        }

        /// <summary>
        /// specificProperties=null并且validateProperties=null，對所有屬性驗證，只驗證其是否合法，不驗證是否為空(除屬性標識指定了不能為空外)
        /// specificProperties!=null，對指定屬性校驗，并且都必須有值
        /// null并且validateProperties!=null，對指定屬性校驗，不判斷是否有值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="entity"></param>
        /// <param name="specificProperties">驗證指定的屬性，并且非空判斷</param>
        /// <param name="validateProperties">驗證指定屬性，只對字段合法性判斷，不驗證是否為空</param>
        /// <returns></returns>
        public static void ValidationEntity<T>(this T entity, string[] specificProperties,
            string[] validateProperties = null)
        {
            if (entity == null)
            {
                throw new Exception("對象不能為null");
            }

            PropertyInfo[] propertyArray = typeof(T).GetProperties();
            //若T為object取不到屬性
            if (propertyArray.Length == 0)
            {
                propertyArray = entity.GetType().GetProperties();
            }

            List<PropertyInfo> compareProper = new List<PropertyInfo>();

            //只驗證數據合法性，驗證非空
            if (specificProperties != null && specificProperties.Length > 0)
            {
                compareProper.AddRange(propertyArray.Where(x => specificProperties.Contains(x.Name)));
            }

            //只驗證數據合法性，不驗證非空
            if (validateProperties != null && validateProperties.Length > 0)
            {
                compareProper.AddRange(propertyArray.Where(x => validateProperties.Contains(x.Name)));
            }

            if (compareProper.Count() > 0)
            {
                propertyArray = compareProper.ToArray();
            }

            foreach (PropertyInfo propertyInfo in propertyArray)
            {
                object value = propertyInfo.GetValue(entity);
                //設置默認狀態的值
                if (propertyInfo.Name == "Enable")
                {
                    if (value == null)
                    {
                        propertyInfo.SetValue(entity, 0);
                        continue;
                    }
                }

                //若存在specificProperties并且屬性為數組specificProperties中的值，校驗時就需要判斷是否為空
                var reslut = propertyInfo.ValidationProperty(value,
                    specificProperties != null && specificProperties.Contains(propertyInfo.Name) ? true : false
                );
                if (!reslut.Item1)
                {
                    throw new Exception(reslut.Item2);
                }
            }
        }

        /// <summary>
        /// 獲取數據庫類型，不帶長度，如varchar(100),只返回的varchar
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static string GetSqlDbType(this PropertyInfo propertyInfo)
        {
            string dbType = propertyInfo.GetTypeCustomValue<ColumnAttribute>(x => new {x.TypeName});

            if (string.IsNullOrEmpty(dbType))
            {
                return dbType;
            }

            dbType = dbType.ToLower();
            if (dbType.Contains(SqlDbTypeName.NVarChar))
            {
                dbType = SqlDbTypeName.NVarChar;
            }
            else if (dbType.Contains(SqlDbTypeName.VarChar))
            {
                dbType = SqlDbTypeName.VarChar;
            }
            else if (dbType.Contains(SqlDbTypeName.NChar))
            {
                dbType = SqlDbTypeName.NChar;
            }
            else if (dbType.Contains(SqlDbTypeName.Char))
            {
                dbType = SqlDbTypeName.Char;
            }

            return dbType;
        }

        /// <summary>
        /// 驗證數據庫字段類型與值是否正確，
        /// </summary>
        /// <param name="propertyInfo">propertyInfo為當字段，當前字段必須有ColumnAttribute屬性,
        /// 如字段:標識為數據庫int類型[Column(TypeName="int")]  public int Id { get; set; }
        /// 如果是小數float或Decimal必須對propertyInfo字段加DisplayFormatAttribute屬性
        /// </param>
        /// <param name="value"></param>
        /// <returns>IEnumerable&lt;(bool, string, object)&gt; bool成否校驗成功,string校驗失敗信息,object,當前校驗的值</returns>
        public static IEnumerable<(bool, string, object)> ValidationValueForDbType(this PropertyInfo propertyInfo,
            params object[] values)
        {
            string dbTypeName = propertyInfo.GetTypeCustomValue<ColumnAttribute>(c => c.TypeName);
            foreach (object value in values)
            {
                yield return dbTypeName.ValidationVal(value, propertyInfo);
            }
        }

        public static bool ValidationRquiredValueForDbType(this PropertyInfo propertyInfo, object value,
            out string message)
        {
            if (value == null || value?.ToString()?.Trim() == "")
            {
                message = $"{propertyInfo.GetDisplayName()}不能為空";
                return false;
            }

            var result = propertyInfo.GetProperWithDbType().ValidationVal(value, propertyInfo);
            message = result.Item2;
            return result.Item1;
        }

        private static readonly Dictionary<Type, string> ProperWithDbType = new Dictionary<Type, string>()
        {
            {typeof(string), SqlDbTypeName.NVarChar},
            {typeof(DateTime), SqlDbTypeName.DateTime},
            {typeof(long), SqlDbTypeName.BigInt},
            {typeof(int), SqlDbTypeName.Int},
            {typeof(decimal), SqlDbTypeName.Decimal},
            {typeof(float), SqlDbTypeName.Float},
            {typeof(double), SqlDbTypeName.Double},
            {typeof(byte), SqlDbTypeName.Int}, //類型待完
            {typeof(Guid), SqlDbTypeName.UniqueIdentifier}
        };

        public static string GetProperWithDbType(this PropertyInfo propertyInfo)
        {
            bool result = ProperWithDbType.TryGetValue(propertyInfo.PropertyType, out string value);
            if (result)
            {
                return value;
            }

            return SqlDbTypeName.NVarChar;
        }

        /// <summary>
        /// 驗證數據庫字段類型與值是否正確，
        /// </summary>
        /// <param name="dbType">數據庫字段類型(如varchar,nvarchar,decimal,不要帶后面長度如:varchar(50))</param>
        /// <param name="value">值</param>
        /// <param name="propertyInfo">要驗證的類的屬性，若不為null，則會判斷字符串的長度是否正確</param>
        /// <returns>(bool, string, object)bool成否校驗成功,string校驗失敗信息,object,當前校驗的值</returns>
        public static (bool, string, object) ValidationVal(this string dbType, object value,
            PropertyInfo propertyInfo = null)
        {
            if (string.IsNullOrEmpty(dbType))
            {
                dbType = propertyInfo != null ? propertyInfo.GetProperWithDbType() : SqlDbTypeName.NVarChar;
            }

            dbType = dbType.ToLower();
            string val = value?.ToString();
            //驗證長度
            string reslutMsg = string.Empty;
            if (dbType == SqlDbTypeName.Int || dbType == SqlDbTypeName.BigInt)
            {
                if (!StringExtension.IsInt(value))
                    reslutMsg = "只能為有效整數";
            }
            else if (dbType == SqlDbTypeName.DateTime
                     || dbType == SqlDbTypeName.Date
                     || dbType == SqlDbTypeName.SmallDateTime
                     || dbType == SqlDbTypeName.SmallDate
            )
            {
                if (!StringExtension.IsDate(value))
                    reslutMsg = "必須為日期格式";
            }
            else if (dbType == SqlDbTypeName.Float || dbType == SqlDbTypeName.Decimal || dbType == SqlDbTypeName.Double)
            {
                string formatString = string.Empty;
                if (propertyInfo != null)
                    formatString = propertyInfo.GetTypeCustomValue<DisplayFormatAttribute>(x => x.DataFormatString);
                //if (string.IsNullOrEmpty(formatString))
                //    throw new Exception("請對字段" + propertyInfo?.Name + "添加DisplayFormat屬性標識");

                if (!StringExtension.IsNumber(val, formatString))
                {
                    string[] arr = (formatString ?? "10,0").Split(',');
                    reslutMsg = $"整數{arr[0]}最多位,小數最多{arr[1]}位";
                }
            }
            else if (dbType == SqlDbTypeName.UniqueIdentifier)
            {
                if (!StringExtension.IsGuid(val))
                {
                    reslutMsg = propertyInfo.Name + "Guid不正確";
                }
            }
            else if (propertyInfo != null
                     && (dbType == SqlDbTypeName.VarChar
                         || dbType == SqlDbTypeName.NVarChar
                         || dbType == SqlDbTypeName.NChar
                         || dbType == SqlDbTypeName.Char
                         || dbType == SqlDbTypeName.Text))
            {
                //默認nvarchar(max) 、text 長度不能超過20000
                if (val.Length > 20000)
                {
                    reslutMsg = $"字符長度最多【20000】";
                }
                else
                {
                    int length =
                        StringExtension.GetInt(
                            propertyInfo.GetTypeCustomValue<MaxLengthAttribute>(x => new {x.Length}));
                    if (length == 0)
                    {
                        return (true, null, null);
                    }
                    //判斷雙字節與單字段
                    else if (length < 8000 &&
                             ((dbType.Substring(0, 1) != "n"
                               && Encoding.UTF8.GetBytes(val.ToCharArray()).Length > length)
                              || val.Length > length)
                    )
                    {
                        reslutMsg = $"最多只能【{length}】個字符。";
                    }
                }
            }

            if (!string.IsNullOrEmpty(reslutMsg) && propertyInfo != null)
            {
                reslutMsg = propertyInfo.GetDisplayName() + reslutMsg;
            }

            return (reslutMsg == "" ? true : false, reslutMsg, value);
        }

        public static string GetDisplayName(this PropertyInfo property)
        {
            string displayName = property.GetTypeCustomValue<DisplayAttribute>(x => new {x.Name});
            if (string.IsNullOrEmpty(displayName))
            {
                return property.Name;
            }

            return displayName;
        }

        /// <summary>
        /// 驗證每個屬性的值是否正確
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="objectVal">屬性的值</param>
        /// <param name="required">是否指定當前屬性必須有值</param>
        /// <returns></returns>
        public static (bool, string, object) ValidationProperty(this PropertyInfo propertyInfo, object objectVal,
            bool required)
        {
            if (propertyInfo.IsKey())
            {
                return (true, null, objectVal);
            }

            string val = objectVal == null ? "" : objectVal.ToString().Trim();

            string requiredMsg = string.Empty;
            if (required)
            {
                var reuireVal =
                    propertyInfo.GetTypeCustomValues<RequiredAttribute>(x => new {x.AllowEmptyStrings, x.ErrorMessage});
                if (reuireVal != null && !Convert.ToBoolean(reuireVal["AllowEmptyStrings"]))
                {
                    required = true;
                    requiredMsg = reuireVal["ErrorMessage"];
                }
            }

            //如果不要求為必填項并且值為空，直接返回
            if (!required && string.IsNullOrEmpty(val))
                return (true, null, objectVal);

            if ((required && val == string.Empty))
            {
                if (requiredMsg != "") return (false, requiredMsg, objectVal);
                string propertyName = propertyInfo.GetTypeCustomValue<DisplayAttribute>(x => new {x.Name});
                return (false,
                    requiredMsg + (string.IsNullOrEmpty(propertyName) ? propertyInfo.Name : propertyName) + "不能為空",
                    objectVal);
            }

            //列名
            string typeName = propertyInfo.GetSqlDbType();

            //如果沒有ColumnAttribute的需要單獨再驗證，下面只驗證有屬性的
            if (typeName == null)
            {
                return (true, null, objectVal);
            }

            //驗證長度
            return typeName.ValidationVal(val, propertyInfo);
        }

        /// <summary>
        /// 獲取屬性的指定屬性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this MemberInfo member, Type type)
        {
            object[] obj = member.GetCustomAttributes(type, false);
            if (obj.Length == 0) return null;
            return obj[0];
        }

        /// <summary>
        /// 獲取類的指定屬性
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public static object GetTypeCustomAttributes(this Type entity, Type type)
        {
            object[] obj = entity.GetCustomAttributes(type, false);
            if (obj.Length == 0) return null;
            return obj[0];
        }

        /// <summary>
        /// 獲取類的多個指定屬性的值
        /// </summary>
        /// <param name="member">當前類</param>
        /// <param name="type">指定的類</param>
        /// <param name="expression">指定屬性的值 格式 Expression&lt;Func&lt;entityt, object&gt;&gt; exp = x =&gt; new { x.字段1, x.字段2 };</param>
        /// <returns>返回的是字段+value</returns>
        public static Dictionary<string, string> GetTypeCustomValues<TEntity>(this MemberInfo member,
            Expression<Func<TEntity, object>> expression)
        {
            var attr = member.GetTypeCustomAttributes(typeof(TEntity));
            if (attr == null)
            {
                return null;
            }

            string[] propertyName = expression.GetExpressionProperty();
            Dictionary<string, string> propertyKeyValues = new Dictionary<string, string>();

            foreach (PropertyInfo property in attr.GetType().GetProperties())
            {
                if (propertyName.Contains(property.Name))
                {
                    propertyKeyValues[property.Name] = (property.GetValue(attr) ?? string.Empty).ToString();
                }
            }

            return propertyKeyValues;
        }

        /// <summary>
        /// 獲取類的單個指定屬性的值(只會返回第一個屬性的值)
        /// </summary>
        /// <param name="member">當前類</param>
        /// <param name="type">指定的類</param>
        /// <param name="expression">指定屬性的值  格式 Expression&lt;Func&lt;entityt, object&gt;&gt; exp = x =&gt; new { x.字段1, x.字段2 };</param>
        /// <returns></returns>
        public static string GetTypeCustomValue<TEntity>(this MemberInfo member,
            Expression<Func<TEntity, object>> expression)
        {
            var propertyKeyValues = member.GetTypeCustomValues(expression);
            if (propertyKeyValues == null || propertyKeyValues.Count == 0)
            {
                return null;
            }

            return propertyKeyValues.First().Value ?? "";
        }

        /// <summary>
        /// 判斷hash的列是否為對應的實體，并且值是否有效
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <param name="dic"></param>
        /// <param name="removeNotContains">移除不存在字段</param>
        /// <returns></returns>
        public static string ValidateDicInEntity(this Type typeinfo, Dictionary<string, object> dic,
            bool removeNotContains, string[] ignoreFields = null)
        {
            return typeinfo.ValidateDicInEntity(dic, removeNotContains, true, ignoreFields);
        }

        public static string ValidateDicInEntity(this Type type, List<Dictionary<string, object>> dicList,
            bool removeNotContains, bool removerKey, string[] ignoreFields = null)
        {
            PropertyInfo[] propertyInfo = type.GetProperties();
            string reslutMsg = string.Empty;
            foreach (Dictionary<string, object> dic in dicList)
            {
                reslutMsg = type.ValidateDicInEntity(dic, propertyInfo, removeNotContains, removerKey, ignoreFields);
                if (!string.IsNullOrEmpty(reslutMsg))
                    return reslutMsg;
            }

            return reslutMsg;
        }

        public static string ValidateDicInEntity(this Type type, Dictionary<string, object> dic, bool removeNotContains,
            bool removerKey, string[] ignoreFields = null)
        {
            return type.ValidateDicInEntity(dic, null, removeNotContains, removerKey, ignoreFields);
        }

        /// <summary>
        /// 判斷hash的列是否為對應的實體，并且值是否有效
        /// </summary>
        /// <param name="typeinfo"></param>
        /// <param name="dic"></param>
        /// <param name="removeNotContains">移除不存在字段</param>
        /// <param name="removerKey">移除主鍵</param>
        /// <returns></returns>
        private static string ValidateDicInEntity(this Type typeinfo, Dictionary<string, object> dic,
            PropertyInfo[] propertyInfo, bool removeNotContains, bool removerKey, string[] ignoreFields = null)
        {
            if (dic == null || dic.Count == 0)
            {
                return "參數無效";
            }

            if (propertyInfo == null)
                propertyInfo = typeinfo.GetProperties().Where(x => x.PropertyType.Name != "List`1").ToArray();

            // 不存在的字段直接移除
            dic.Where(x => !propertyInfo.Any(p => p.Name == x.Key)).Select(s => s.Key).ToList().ForEach(f =>
            {
                dic.Remove(f);
            });
            string keyName = typeinfo.GetKeyName();
            //移除主鍵
            if (removerKey)
            {
                dic.Remove(keyName);
            }

            foreach (PropertyInfo property in propertyInfo)
            {
                //忽略與主鍵的字段不做驗證
                if (property.Name == keyName || (ignoreFields != null && ignoreFields.Contains(property.Name)))
                    continue;

                //不在編輯中的列，是否也要必填
                if (!dic.ContainsKey(property.Name))
                {
                    //移除主鍵默認為新增數據，將不在編輯列中的有默認值的數據設置為默認值
                    //如果為true默認為添加功能，添加操作所有不能為空的列也必須要提交
                    if (property.GetCustomAttributes(typeof(RequiredAttribute)).Count() > 0
                        && property.PropertyType != typeof(int)
                        && property.PropertyType != typeof(long)
                        && property.PropertyType != typeof(byte)
                        && property.PropertyType != typeof(decimal)
                    )
                    {
                        return property.GetTypeCustomValue<DisplayAttribute>(x => x.Name) + "為必須提交項";
                    }

                    continue;
                }

                bool isEdit = property.ContainsCustomAttributes(typeof(EditableAttribute));
                //不是編輯列的直接移除,并且不是主鍵
                //removerKey=true，不保留主鍵，直接移除
                //removerKey=false,保留主鍵，屬性與主鍵不同的直接移除
                //  if (!isEdit && (removerKey || (!removerKey && property.Name != keyName)))
                if (!isEdit)
                {
                    if (property.GetCustomAttributes(typeof(RequiredAttribute)).Count() > 0)
                    {
                        return property.GetTypeCustomValue<DisplayAttribute>(x => x.Name) + "沒有配置好Model為編輯列";
                    }

                    dic.Remove(property.Name);
                    continue;
                }

                ////移除忽略的不保存的數據
                //if (property.ContainsCustomAttributes(typeof(JsonIgnoreAttribute)))
                //{
                //    hash.Remove(property.Name);
                //    continue;
                //}
                //驗證數據類型,不驗證是否為空
                var result = property.ValidationProperty(dic[property.Name], false);
                if (!result.Item1)
                    return result.Item2;

                //將所有空值設置為null
                if (dic[property.Name] != null && dic[property.Name].ToString() == string.Empty)
                    dic[property.Name] = null;
            }

            return string.Empty;
        }


        private static object MapToInstance(this Type reslutType, object sourceEntity, PropertyInfo[] sourcePro,
            PropertyInfo[] reslutPro, string[] sourceFilterField, string[] reslutFilterField, string mapType = null)
        {
            mapType = mapType ?? GetMapType(reslutType);
            if (sourcePro == null)
            {
                sourcePro = sourceEntity.GetType().GetProperties();
            }

            if (reslutPro == null)
            {
                reslutPro = reslutType.GetProperties();
                ;
            }

            object newObj = Activator.CreateInstance(reslutType);

            if (mapType == "Dictionary")
            {
                if (sourceFilterField != null && sourceFilterField.Length > 0)
                {
                    sourcePro = sourcePro.Where(x => sourceFilterField.Contains(x.Name)).ToArray();
                }

                foreach (var property in sourcePro)
                {
                    (newObj as System.Collections.IDictionary).Add(property.Name, property.GetValue(sourceEntity));
                }

                return newObj;
            }

            if (reslutFilterField != null && reslutFilterField.Count() > 0)
            {
                reslutPro.Where(x => reslutFilterField.Contains(x.Name));
            }

            foreach (var property in reslutPro)
            {
                PropertyInfo info = sourcePro.Where(x => x.Name == property.Name).FirstOrDefault();
                if (!(info != null && info.PropertyType == property.PropertyType))
                    continue;
                property.SetValue(newObj, info.GetValue(sourceEntity));
            }

            return newObj;
        }

        private static string GetMapType(Type type)
        {
            return typeof(Dictionary<,>) == type ? "Dictionary" : "entity";
        }

        /// <summary>
        /// 將數據源映射到新的數據中,目前只支持List&lt;TSource&gt;映射到List&lt;TResult&gt;或TSource映射到TResult
        /// 目前只支持Dictionary或實體類型
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="resultExpression">只映射返回對象的指定字段,若為null則默認為全部字段</param>
        /// <param name="sourceExpression">只映射數據源對象的指定字段,若為null則默認為全部字段</param>
        /// <returns></returns>
        public static TResult MapToObject<TSource, TResult>(this TSource source,
            Expression<Func<TResult, object>> resultExpression,
            Expression<Func<TSource, object>> sourceExpression = null
        ) where TResult : class
        {
            if (source == null)
                return null;
            string[] sourceFilterField = sourceExpression == null
                ? typeof(TSource).GetProperties().Select(x => x.Name).ToArray()
                : sourceExpression.GetExpressionProperty();
            string[] reslutFilterField = resultExpression?.GetExpressionProperty();
            if (!(source is System.Collections.IList))
                return MapToInstance(typeof(TResult), source, null, null, sourceFilterField, reslutFilterField) as
                    TResult;

            Type sourceType = null;
            Type resultType = null;
            System.Collections.IList sourceList = source as System.Collections.IList;
            sourceType = sourceList[0].GetType();
            resultType = (typeof(TResult)).GenericTypeArguments[0];

            System.Collections.IList reslutList = Activator.CreateInstance(typeof(TResult)) as System.Collections.IList;
            PropertyInfo[] sourcePro = sourceType.GetProperties();
            PropertyInfo[] resultPro = resultType.GetProperties();

            string mapType = GetMapType(resultType);
            for (int i = 0; i < sourceList.Count; i++)
            {
                var reslutobj = MapToInstance(resultType, sourceList[i], sourcePro, resultPro, sourceFilterField,
                    reslutFilterField, mapType);
                reslutList.Add(reslutobj);
            }

            return reslutList as TResult;
        }

        /// <summary>
        /// 將一個實體的賦到另一個實體上,應用場景：
        /// 兩個實體，a a1= new a();b b1= new b();  a1.P=b1.P; a1.Name=b1.Name;
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="source"></param>
        /// <param name="result"></param>
        /// <param name="expression">指定對需要的字段賦值,格式x=>new {x.Name,x.P},返回的結果只會對Name與P賦值</param>
        public static void MapValueToEntity<TSource, TResult>(this TSource source, TResult result,
            Expression<Func<TResult, object>> expression = null) where TResult : class
        {
            if (source == null)
                return;
            string[] fields = expression?.GetExpressionToArray();
            PropertyInfo[] reslutPro = fields == null
                ? result.GetType().GetProperties()
                : result.GetType().GetProperties().Where(x => fields.Contains(x.Name)).ToArray();
            PropertyInfo[] sourcePro = source.GetType().GetProperties();
            foreach (var property in reslutPro)
            {
                PropertyInfo info = sourcePro.Where(x => x.Name == property.Name).FirstOrDefault();
                if (info != null && info.PropertyType == property.PropertyType)
                {
                    property.SetValue(result, info.GetValue(source));
                }
            }
        }
    }

    public class ArrayEntity
    {
        public string column1 { get; set; }
    }

    public enum FieldType
    {
        VarChar = 0,
        NvarChar,
        Int,
        BigInt,
        UniqueIdentifier
    }

    public enum EntityToSqlTempName
    {
        TempInsert = 0
    }
}