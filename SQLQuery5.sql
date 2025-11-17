/*
================================================================
SCRIPT TẠO VÀ CHÈN DỮ LIỆU CHO DATABASE COFFEESHOP
================================================================
Script này sẽ:
1. Xóa database 'COFFEESHOP' cũ nếu tồn tại.
2. Tạo database 'COFFEESHOP' mới.
3. Tạo tất cả 5 bảng: EMPLOYEE, TYPE, MENU, BILL, BILLDETAIL.
4. Chèn dữ liệu mẫu theo đúng thứ tự để tránh lỗi khóa ngoại.
================================================================
*/

-- Chuyển về database 'master' để có thể xóa database 'COFFEESHOP'
USE master
GO

-- Kiểm tra xem database có tồn tại không, nếu có thì xóa đi
IF DB_ID('COFFEESHOP') IS NOT NULL
BEGIN
    ALTER DATABASE COFFEESHOP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE COFFEESHOP;
    PRINT 'Đã xóa database COFFEESHOP cũ.';
END
GO

-- Tạo database mới
PRINT 'Tạo database COFFEESHOP mới...';
CREATE DATABASE COFFEESHOP
GO

-- Sử dụng database vừa tạo
USE COFFEESHOP
GO

-- ========== TẠO CÁC BẢNG ==========

PRINT '1. Tạo bảng EMPLOYEE (Bảng cha)...';
CREATE TABLE EMPLOYEE (
    ID_EM INT PRIMARY KEY,
    IMAGE_DATA IMAGE,
    NAME_EM NVARCHAR(4000),
    DAY_OF_BIRTH DATE,
    PHONE_NUM VARCHAR(15),
    ADDRESS_EM NVARCHAR(4000),
    SEX NVARCHAR(3) CHECK (SEX IN ('Nam', N'Nữ')),
    NAME_ROLE NVARCHAR(100),
    USERNAME VARCHAR(50) UNIQUE ,
    PASS VARCHAR(50)
);
GO

PRINT '2. Tạo bảng TYPE (Bảng cha)...';
CREATE TABLE TYPE (
    ID INT PRIMARY KEY,
    TYPE NVARCHAR(100),
    AVAILABLE BIT
);
GO

PRINT '3. Tạo bảng MENU (Bảng con, phụ thuộc vào TYPE)...';
CREATE TABLE MENU (
    ID INT PRIMARY KEY,
    IMAGE_DATA IMAGE,
    ID_TYPE INT,
    NAME_FOOD NVARCHAR(200),
    DESCRIPTION NVARCHAR(500),
    PRICE DECIMAL(7),
    AVAILABLE BIT,
    FOREIGN KEY (ID_TYPE) REFERENCES TYPE(ID)
);
GO

PRINT '4. Tạo bảng BILL (Bảng con, phụ thuộc vào EMPLOYEE)...';
CREATE TABLE BILL (
    ID_BILL INT PRIMARY KEY,
    ID_EM  INT,
    NAME_CUSTOMER NVARCHAR(200),
    DAY_BILL DATE,
    PRICE DECIMAL(10),
    STATUS_BILL VARCHAR(20),
    FOREIGN KEY (ID_EM) REFERENCES EMPLOYEE(ID_EM)
);
GO

PRINT '5. Tạo bảng BILLDETAIL (Bảng cháu, phụ thuộc vào BILL và MENU)...';
CREATE TABLE BILLDETAIL (
    ID_BILL INT,
    ID INT,
    SOLUONG INT,
    PRIMARY KEY (ID_BILL, ID),
    FOREIGN KEY (ID_BILL) REFERENCES BILL(ID_BILL),
    FOREIGN KEY (ID) REFERENCES MENU(ID)
);
GO

-- ========== CHÈN DỮ LIỆU MẪU (THEO ĐÚNG THỨ TỰ) ==========

PRINT '--- Bắt đầu chèn dữ liệu ---';

PRINT 'A. Chèn vào bảng EMPLOYEE (Cha)...';
-- (Phải chèn dữ liệu cho EMPLOYEE trước khi chèn BILL)
INSERT INTO EMPLOYEE (ID_EM, NAME_EM, NAME_ROLE, USERNAME, PASS) VALUES
(1, N'Nguyễn Văn A', 'Admin', 'admin', '123'),
(2, N'Trần Thị B', 'Staff', 'staff', '123');
GO

PRINT 'B. Chèn vào bảng TYPE (Cha)...';
INSERT INTO TYPE (ID, TYPE, AVAILABLE) VALUES
(0, 'COFFEE', 1),
(1, 'JUICES', 1),
(2, 'TEA', 1),
(3, 'SMOOTHIES', 1),
(4, 'ICE BLENDED', 1);
GO

PRINT 'C. Chèn vào bảng MENU (Con của TYPE)...';
-- (Phải chèn dữ liệu cho MENU trước khi chèn BILLDETAIL)
INSERT INTO MENU (ID, ID_TYPE, NAME_FOOD, PRICE, AVAILABLE) VALUES
(0, 0, N'Cà phê đen', 25000, 1),
(1, 0, N'Cà phê sữa', 30000, 1),
(2, 1, N'Nước ép cam', 40000, 1),
(4, 3, N'Sinh tố bơ', 45000, 1),
(5, 4, N'Cookie Đá Xay', 50000, 1);
GO

PRINT 'D. Chèn vào bảng BILL (Con của EMPLOYEE)...';
-- (Bây giờ ID_EM = 1 đã tồn tại, nên lệnh này sẽ thành công)
INSERT INTO BILL (ID_BILL, ID_EM, NAME_CUSTOMER, DAY_BILL, PRICE, STATUS_BILL) VALUES
(0, 1, N'Customer A', '2023-01-05', 150000, 'Pending'),
(1, 1, N'Customer B', '2023-02-10', 120000, 'Pending');
GO

PRINT 'E. Chèn vào bảng BILLDETAIL (Cháu của BILL và MENU)...';
-- (Bây giờ ID_BILL 0, 1 và các ID MENU đã tồn tại, nên lệnh này sẽ thành công)
INSERT INTO BILLDETAIL (ID_BILL, ID, SOLUONG) VALUES
(0, 0, 2),
(0, 1, 1),
(1, 2, 3),
(1, 4, 1),
(1, 5, 2);
GO

PRINT '--- HOÀN TẤT! Đã tạo và chèn dữ liệu cho database COFFEESHOP. ---';