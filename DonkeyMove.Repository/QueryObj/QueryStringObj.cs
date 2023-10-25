namespace donkeymove.Repository.QueryObj
{
    /// <summary>
    /// 針對只返回字符串類型的數值。查詢SQL必需使用Value作為返回字段
    /// 因為string沒有構造函數，不能作為DbSet/DbQuery泛型的參數
    /// </summary>
    public class QueryStringObj
    {
        public string Value { get; set; }
    }
}