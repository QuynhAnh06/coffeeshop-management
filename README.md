# Phần mềm Quản lý Quán Cà Phê

*Coffee Shop Management Software*

## Giới thiệu

Đây là ứng dụng desktop chạy trên Windows, được phát triển bằng **C#**, **WPF**,  **SQL Sever**, nhằm tối ưu hóa toàn bộ quy trình vận hành của một quán cà phê.

**Phần mềm Quản lý Quán Cà Phê** mang đến giao diện trực quan, dễ sử dụng cho **Admin**, **Thu ngân** và **Nhân viên pha chế**, hỗ trợ đầy đủ các nghiệp vụ như:
- Quản lý menu sản phẩm  
- Tạo và xử lý đơn hàng  
- Quản lý thông tin và phân quyền nhân viên  
- Lập hóa đơn và thanh toán  
- Theo dõi và thống kê doanh thu  

Ứng dụng có UI hiện đại, trực quan, dễ dùng cho cả người mới. ược thiết kế với mục tiêu nâng cao hiệu suất làm việc, giảm thiểu sai sót và cải thiện trải nghiệm của khách hàng trong quá trình vận hành quán cà phê.

---

## Kho lưu trữ liên quan

Dự án là một ứng dụng độc lập được xây dựng phục vụ học tập và môn học tại trường. Mã nguồn và tài nguyên liên quan được lưu trong kho của dự án.

---

## Giao diện minh họa

### 1. Màn hình đăng nhập
![Login Interface](./media/login.png)

#### Quản lý Menu (Admin)
![Menu Interface (Admin)](./media/product.png)

#### Quản lý Nhân viên (Admin)
![Menu Interface (Admin)](./media/employee.png)

#### Thống kê doanh thu(Admin)
![Revenue Statistics Interface](./media/statistic.png)

#### Xử lý đơn hàng (Cashier)
![Order Interface (Cashier)](./media/order.png)
![Order Interface (Cashier)](./media/bill.png)
![Order Interface (Cashier)](./media/detail.png)

#### Giao diện pha chế (Bartender)
![Order Interface (Cashier)](./media/kitchen.png)

---

###  Chức năng chính
- **Đăng nhập & phân quyền người dùng:** đảm bảo bảo mật, mỗi vai trò (Admin, Thu ngân, Nhân viên) có quyền hạn và giao diện riêng.

- **Quản lý Menu:** Thêm, sửa, xóa sản phẩm; phân loại đồ uống

- **Quản lý đơn hàng:** Tạo mới đơn hàng, chỉnh sửa, cập nhật số lượng; tính tổng tiền theo thời gian thực.

- **Hóa đơn & Thanh toán:** Xuất hóa đơn và xem chi tiết từng món.

- **Quản lý nhân viên:** Thêm tài khoản, chỉnh sửa thông tin, phân quyền theo chức vụ và nhiệm vụ.

- **Thống kê doanh thu:** Xem báo cáo doanh thu; theo dõi sản phẩm bán chạy.

- **Giao diện hiện đại:** Được xây dựng bằng WPF, mang lại trải nghiệm trực quan, mượt mà và nhất quán cho người dùng.

---

## Mục lục

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Run the Project](#run-the-project)
- [Usage](#usage)
- [Tech Stack](#tech-stack)
- [License](#license)

---

## Cài đặt
Thực hiện các bước sau để thiết lập và chạy dự án trên máy của bạn.

---

### Yêu cầu hệ thống

Bạn cần cài đặt trước:

- **.NET Framework:** Phiên bản 4.5 trở lên.
- **Visual Studio:** 2019 hoặc mới hơn (Community, Professional hoặc Enterprise) để phát triển và debug.
- **SQL Server:** Dùng để quản lý cơ sở dữ liệu (ví dụ: SQL Server Express).
- **Git:** Dùng để clone repository (tùy chọn).


### Cài đặt

1. Clone dự án về máy của bạn (nếu repository khả dụng):

   ```bash
   [git clone https://github.com/TuananhDo0308/coffee-shop-management.git
   cd coffee-shop-management](https://github.com/QuynhAnh06/coffeeshop-management/edit/main/README.md)
   ```

2. Mở dự án bằng Visual Studio:

   - Khởi chạy **Visual Studio**.
   - Mở file .sln (solution) trong thư mục dự án vừa clone.
    ```
   
3. Khôi phục các gói phụ thuộc (dependencies):

   - Trong Visual Studio, vào **Tools > NuGet Package Manager > Manage NuGet Packages for Solution**.
   - Cài đặt các package cần thiết, chẳng hạn như **Entity Framework** để thao tác với cơ sở dữ liệu.
 ```
4. Thiết lập cơ sở dữ liệu SQL Server:

   - Tạo một database mới trong **SQL Server Management Studio** (ví dụ: `CoffeeShopDB`).
   - Cập nhật chuỗi kết nối (connection string) trong file cấu hình của dự án (ví dụ: `App.config` hoặc `web.config`).

### Cấu hình

1. Cấu hình kết nối cơ sở dữ liệu:

   - Mở file cấu hình của dự án (ví dụ: `App.config`) trong Visual Studio.
   - Cập nhật chuỗi kết nối (connection string) để trỏ đến SQL Server bạn đang sử dụng. Ví dụ:

     ```xml
     <connectionStrings>
       <add name="CoffeeShopDB"
            connectionString="Server=localhost;Database=CoffeeShopDB;Trusted_Connection=True;"
            providerName="System.Data.SqlClient" />
     </connectionStrings>
     ```

2. Khởi tạo cơ sở dữ liệu:

   - Chạy các script SQL (nếu có trong repository) để tạo các bảng như `MENU`, `BILL`, `BILLDETAIL`, `EMPLOYEE` và `TYPE`.
   - Hoặc sử dụng tính năng **Entity Framework Migrations** để tạo cấu trúc cơ sở dữ liệu:
     ```bash
     Update-Database
     ```

3. Kiểm tra lại thiết lập của dự án:

   - Đảm bảo dự án đang sử dụng đúng phiên bản .NET Framework.
   - Đặt đúng Project khởi động (Startup Project), ví dụ: `CoffeeShopManagement.WPF`.

---

## Chạy dự án

### Phát triển (Development)

1. Mở dự án bằng Visual Studio.
2. Nhấn **F5** hoặc chọn **Start** để build và chạy ứng dụng ở chế độ debug.
3. Màn hình đăng nhập sẽ xuất hiện, cho phép bạn kiểm thử ứng dụng bằng các tài khoản mẫu (ví dụ: admin, cashier hoặc staff).

### Build và Triển khai (Build and Deploy)

1. Build dự án:
   - Vào **Build > Build Solution** trong Visual Studio.
   - Đảm bảo rằng không có lỗi phát sinh.

2. Publish ứng dụng:
   - Chuột phải vào project trong **Solution Explorer**, chọn **Publish**.
   - Chọn hình thức publish (ví dụ: Folder) và làm theo hướng dẫn để tạo file thực thi.

3. Chạy ứng dụng:
   - Mở thư mục publish và chạy file `.exe` để khởi động ứng dụng.


---

## Sử dụng

Khi ứng dụng được khởi chạy, người dùng có thể:

- **Đăng nhập** với vai trò admin, thu ngân hoặc nhân viên bằng thông tin tài khoản tương ứng.

- **Admin** có thể:
  - Quản lý menu (thêm, sửa, xóa sản phẩm).
  - Quản lý tài khoản nhân viên và phân quyền.
  - Xem báo cáo doanh thu và thống kê sản phẩm bán chạy.

- **Thu ngân** có thể:
  - Tạo và xử lý đơn hàng bằng cách thêm sản phẩm vào giỏ.
  - Xuất hóa đơn và xem chi tiết đơn hàng.

- **Nhân viên** có thể:
  - Xem các đơn hàng được giao.
  - Xác nhận hoàn thành món hoặc đơn hàng.

- Sử dụng giao diện trực quan để điều hướng giữa các chức năng như quản lý menu, xử lý đơn hàng và lập hóa đơn.

---

## Công nghệ sử dụng

Dự án được xây dựng dựa trên các công nghệ sau:

- **C#:** Ngôn ngữ lập trình chính dùng để xử lý logic ứng dụng.
- **WPF (Windows Presentation Foundation):** Dùng để xây dựng giao diện desktop hiện đại và linh hoạt.
- **MVVM (Model–View–ViewModel):** Mô hình kiến trúc giúp tách biệt giao diện, logic và dữ liệu.
- **Entity Framework:** ORM hỗ trợ thao tác với cơ sở dữ liệu SQL Server.
- **SQL Server:** Hệ quản trị cơ sở dữ liệu dùng để lưu trữ menu, đơn hàng, nhân viên và hóa đơn.
- **XAML:** Ngôn ngữ thiết kế giao diện trong WPF.

---


## Hướng phát triển trong tương lai

Để mở rộng và nâng cao trải nghiệm, ứng dụng có thể được phát triển thêm các tính năng sau:

- **Đặt hàng trực tuyến:** Tích hợp giao diện web hoặc mobile để khách hàng có thể đặt món từ xa.
- **Quản lý kho:** Theo dõi số lượng nguyên liệu và hàng tồn kho.
- **Ứng dụng di động:** Phát triển ứng dụng đi kèm dành cho khách hàng hoặc nhân viên để tăng tính tiện lợi.
- **Phân tích nâng cao:** Cung cấp các báo cáo chi tiết hơn về doanh thu, hiệu suất và hành vi khách hàng.

---

**Coffee Shop Management Software** là giải pháp toàn diện giúp chủ quán cà phê tối ưu hóa quy trình vận hành và nâng cao hiệu quả kinh doanh. Chúc bạn quản lý thành công! ☕
