//using CoffeeShop.Models;
using CoffeeShop.Models;
using CoffeeShop.ViewModel;
using System;
using System.Collections.Generic;
// using System.Configuration; // Xóa dòng này, không cần cho .json
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

// THÊM 2 DÒNG NÀY VÀO:
using Microsoft.Extensions.Configuration;
using System.IO;

namespace CoffeeShop
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        // Code cũ của bạn, giữ nguyên:
        public static Employee MainUser { get; set; } = new Employee();

        // THÊM 2 DÒNG NÀY VÀO:
        public static IConfiguration Configuration { get; private set; }
        public static string ConnectionString { get; private set; }

        // THÊM TOÀN BỘ HÀM NÀY VÀO:
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            // Xây dựng bộ đọc cấu hình
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory()) // Đặt đường dẫn cơ sở là thư mục chạy
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true); // Nạp tệp json

            Configuration = builder.Build();

            // Đọc chuỗi kết nối từ tệp và lưu vào một biến toàn cục
            ConnectionString = Configuration.GetConnectionString("DefaultConnection");
        }
    }
}