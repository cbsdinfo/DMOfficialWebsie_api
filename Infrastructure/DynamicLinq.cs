using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace Infrastructure
{
    public static class DynamicLinq
    {
        public static ParameterExpression CreateLambdaParam<T>(string name)
        {
            return Expression.Parameter(typeof(T), name);
        }

        /// <summary>
        /// 創建linq表達示的body部分
        /// </summary>
        public static Expression GenerateBody<T>(this ParameterExpression param, Filter filterObj)
        {
            PropertyInfo property = typeof(T).GetProperty(filterObj.Key);

            Expression left = null; //組裝左邊
            //組裝右邊
            Expression right = null;

            if (property != null)
            {
                left = Expression.Property(param, property);
                if (property.PropertyType == typeof(int))
                {
                    right = Expression.Constant(int.Parse(filterObj.Value));
                }
                else if (property.PropertyType == typeof(DateTime))
                {
                    right = Expression.Constant(DateTime.Parse(filterObj.Value));
                }
                else if (property.PropertyType == typeof(string))
                {
                    right = Expression.Constant(filterObj.Value);
                }
                else if (property.PropertyType == typeof(decimal))
                {
                    right = Expression.Constant(decimal.Parse(filterObj.Value));
                }
                else if (property.PropertyType == typeof(Guid))
                {
                    right = Expression.Constant(Guid.Parse(filterObj.Value));
                }
                else if (property.PropertyType == typeof(bool))
                {
                    right = Expression.Constant(filterObj.Value.Equals("1"));
                }
                else if (property.PropertyType == typeof(Guid?))
                {
                    left = Expression.Property(left, "Value");
                    right = Expression.Constant(Guid.Parse(filterObj.Value));
                }
                else
                {
                    throw new Exception("暫不能解析該Key的類型");
                }
            }
            else //如果左邊不是屬性，直接是值的情況
            {
                left = Expression.Constant(filterObj.Key);
                right = Expression.Constant(filterObj.Value);
            }

            //c.XXX=="XXX"
            Expression filter = Expression.Equal(left, right);
            switch (filterObj.Contrast)
            {
                case "<=":
                    filter = Expression.LessThanOrEqual(left, right);
                    break;

                case "<":
                    filter = Expression.LessThan(left, right);
                    break;

                case ">":
                    filter = Expression.GreaterThan(left, right);
                    break;

                case ">=":
                    filter = Expression.GreaterThanOrEqual(left, right);
                    break;

                case "!=":
                    filter = Expression.NotEqual(left, right);
                    break;

                case "contains":
                    filter = Expression.Call(left, typeof(string).GetMethod("Contains", new Type[] { typeof(string) }),
                        Expression.Constant(filterObj.Value));
                    break;

                case "in":
                    var lExp = Expression.Constant(filterObj.Value.Split(',').ToList()); //數組
                    var methodInfo = typeof(List<string>).GetMethod("Contains",
                        new Type[] { typeof(string) }); //Contains語句
                    filter = Expression.Call(lExp, methodInfo, left);
                    break;

                case "not in":
                    var listExpression = Expression.Constant(filterObj.Value.Split(',').ToList()); //數組
                    var method = typeof(List<string>).GetMethod("Contains", new Type[] { typeof(string) }); //Contains語句
                    filter = Expression.Not(Expression.Call(listExpression, method, left));
                    break;
                //交集，使用交集時左值必須時固定的值
                case "intersect": //交集
                    if (property != null)
                    {
                        throw new Exception("交集模式下，表達式左邊不能為變量，請調整數據規則，如:c=>\"A,B,C\" intersect \"B,D\"");
                    }

                    var rightval = filterObj.Value.Split(',').ToList();
                    var leftval = filterObj.Key.Split(',').ToList();
                    var val = rightval.Intersect(leftval);

                    filter = Expression.Constant(val.Count() > 0);
                    break;
            }

            return filter;
        }

        public static Expression<Func<T, bool>> GenerateTypeBody<T>(this ParameterExpression param, Filter filterObj)
        {
            return (Expression<Func<T, bool>>)(param.GenerateBody<T>(filterObj));
        }

        /// <summary>
        /// 創建完整的lambda
        /// </summary>
        public static LambdaExpression GenerateLambda(this ParameterExpression param, Expression body)
        {
            //c=>c.XXX=="XXX"
            return Expression.Lambda(body, param);
        }

        public static Expression<Func<T, bool>> GenerateTypeLambda<T>(this ParameterExpression param, Expression body)
        {
            return (Expression<Func<T, bool>>)(param.GenerateLambda(body));
        }

        public static Expression AndAlso(this Expression expression, Expression expressionRight)
        {
            return Expression.AndAlso(expression, expressionRight);
        }

        public static Expression Or(this Expression expression, Expression expressionRight)
        {
            return Expression.Or(expression, expressionRight);
        }

        public static Expression And(this Expression expression, Expression expressionRight)
        {
            return Expression.And(expression, expressionRight);
        }

        public static IQueryable<T> GenerateFilter<T>(this IQueryable<T> query, string parametername, string filterjson)
        {
            if (!string.IsNullOrEmpty(filterjson))
            {
                var filterGroup = JsonHelper.Instance.Deserialize<FilterGroup>(filterjson);
                query = GenerateFilter(query, parametername, filterGroup);
            }

            return query;
        }

        /// <summary>
        /// 轉換FilterGroup為Lambda表達式
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="parametername"></param>
        /// <param name="filterGroup"></param>
        /// <returns></returns>
        public static IQueryable<T> GenerateFilter<T>(this IQueryable<T> query, string parametername,
            FilterGroup filterGroup)
        {
            var param = CreateLambdaParam<T>(parametername);
            Expression result = ConvertGroup<T>(filterGroup, param);
            query = query.Where(param.GenerateTypeLambda<T>(result));
            return query;
        }

        /// <summary>
        /// 轉換filtergroup為表達式
        /// </summary>
        /// <param name="filterGroup"></param>
        /// <param name="param"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression ConvertGroup<T>(FilterGroup filterGroup, ParameterExpression param)
        {
            if (filterGroup == null) return null;

            if (filterGroup.Filters.Length == 1 && (filterGroup.Children == null || !filterGroup.Children.Any())) //只有一個條件
            {
                return param.GenerateBody<T>(filterGroup.Filters[0]);
            }

            Expression result = ConvertFilters<T>(filterGroup.Filters, param, filterGroup.Operation);
            Expression gresult = ConvertGroup<T>(filterGroup.Children, param, filterGroup.Operation);
            if (gresult == null) return result;
            if (result == null) return gresult;

            if (filterGroup.Operation == "and")
            {
                return result.AndAlso(gresult);
            }
            else //or
            {
                return result.Or(gresult);
            }
        }

        /// <summary>
        /// 轉換FilterGroup[]為表達式，不管FilterGroup里面的Filters
        /// </summary>
        /// <param name="groups"></param>
        /// <param name="param"></param>
        /// <param name="operation"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        private static Expression ConvertGroup<T>(FilterGroup[] groups, ParameterExpression param, string operation)
        {
            if (groups == null || !groups.Any()) return null;

            Expression result = ConvertGroup<T>(groups[0], param);

            if (groups.Length == 1) return result;

            if (operation == "and")
            {
                foreach (var filter in groups.Skip(1))
                {
                    result = result.AndAlso(ConvertGroup<T>(filter, param));
                }
            }
            else
            {
                foreach (var filter in groups.Skip(1))
                {
                    result = result.Or(ConvertGroup<T>(filter, param));
                }
            }

            return result;
        }

        /// <summary>
        /// 轉換Filter數組為表達式
        /// </summary>
        /// <param name="filters"></param>
        /// <param name="param"></param>
        /// <param name="operation"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        private static Expression ConvertFilters<T>(Filter[] filters, ParameterExpression param, string operation)
        {
            if (filters == null || !filters.Any())
            {
                return null;
            }

            Expression result = param.GenerateBody<T>(filters[0]);

            if (filters.Length == 1)
            {
                return result;
            }

            if (operation == "and")
            {
                foreach (var filter in filters.Skip(1))
                {
                    result = result.AndAlso(param.GenerateBody<T>(filter));
                }
            }
            else
            {
                foreach (var filter in filters.Skip(1))
                {
                    result = result.Or(param.GenerateBody<T>(filter));
                }
            }

            return result;
        }
    }
}