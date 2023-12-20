using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace Test.Model
{
    public class SanPham
    {
        public string MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public DateTime NgaySanXuat { get; set; }
        public DateTime NgayHetHan { get; set; }
        public long GiaNhap { get; set; }
        public long GiaBan { get; set; }
        public long SoLuongNhap { get; set; }
        public string HinhDaiDien { get; set; }

        public static string ListToString(List<SanPham> list)
        {
            var jSon = JsonSerializer.Serialize(list);
            return jSon;
        }

        // chuyển đổi chuỗi JSON thành danh sách các đối tượng SanPham
        public static List<SanPham> FromJson(string json)
        {
            var sanPham = JsonSerializer.Deserialize<List<SanPham>>(json);
            return sanPham;
        }
    }
}
