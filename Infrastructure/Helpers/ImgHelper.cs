// <summary>生成縮略圖</summary>

using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;

namespace Infrastructure.Helpers
{
    public class ImgHelper
    {
        /// <summary>
        /// 根據已有圖片生成縮略圖
        /// <para>用法：MakeThumbnail(path, tpath, 120, 90, "H");</para>
        /// </summary>
        /// <param name="originalImagePath">源圖片路徑</param>
        /// <param name="thumbnailPath">縮略圖保存路徑</param>
        /// <param name="width">縮略圖的寬度</param>
        /// <param name="height">縮略圖高度</param>
        /// <param name="mode">縮略模式：H:指定高度，寬度按比例處理；W：指定寬度，高度按比例處理；HW按參數指定的高度和寬度</param>
        public static void MakeThumbnail(string originalImagePath,
            string thumbnailPath,
            int width = 120, int height = 90, string mode = "H")
        {
            using (var originalImage = Image.Load(originalImagePath))
            {
                int towidth = width; //縮略圖寬度
                int toheight = height;  //縮略圖高度
                switch (mode)
                {
                    case "HW": //指定高寬縮放（可能變形）
                        break;

                    case "W": //指定寬，高按比例
                        toheight = originalImage.Height * width / originalImage.Width;
                        break;

                    case "H": //指定高，寬按比例
                        towidth = originalImage.Width * height / originalImage.Height;
                        break;

                    default:
                        break;
                }

                originalImage.Mutate(x => x.Resize(towidth, toheight));
                originalImage.Save(thumbnailPath);
            }
        }
    }
}