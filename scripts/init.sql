USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'smartwatch')
BEGIN
	ALTER DATABASE [smartwatch] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [smartwatch] SET ONLINE;
	DROP DATABASE [smartwatch];
END

GO

CREATE DATABASE [smartwatch]
GO

USE [smartwatch]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 

-- Table structure for table `categories`
CREATE TABLE categories (
  CategoryID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CategoryName NVARCHAR(255) NOT NULL
);
GO

-- Table structure for table `users`
CREATE TABLE users (
  Username NVARCHAR(255) NOT NULL PRIMARY KEY,
  Password NVARCHAR(255) NOT NULL,
  Fullname NVARCHAR(255) NOT NULL,
  Phone NVARCHAR(11) NOT NULL,
  Email NVARCHAR(255) NOT NULL,
  Status INT NOT NULL DEFAULT 1,
  Role INT NOT NULL
);
GO

-- Table structure for table `watches`
CREATE TABLE watches (
  WatchID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  WatchName NVARCHAR(255) NOT NULL,
  Thumbnail NVARCHAR(255) NULL,
  Description NVARCHAR(MAX) NOT NULL,
  Price INT NOT NULL,
  Trademark NVARCHAR(255) NOT NULL,
  CategoryID INT NOT NULL,
  FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
GO

-- Table structure for table `orders`
CREATE TABLE orders (
  OrderID NVARCHAR(12) NOT NULL PRIMARY KEY,
  TotalMoney INT NOT NULL DEFAULT 0,
  Payment INT NOT NULL DEFAULT 0,
  CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
  Username NVARCHAR(255) NOT NULL,
  FOREIGN KEY (Username) REFERENCES users(Username)
);
GO

-- Table structure for table `carts`
CREATE TABLE carts (
  CartID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  Username NVARCHAR(255) NOT NULL,
  WatchID INT NOT NULL,
  Quantity INT NOT NULL,
  CONSTRAINT FK_Carts_Users FOREIGN KEY (Username) REFERENCES users(Username),
  CONSTRAINT FK_Carts_Watches FOREIGN KEY (WatchID) REFERENCES watches(WatchID)
);
GO

-- Table structure for table `order_details`
CREATE TABLE order_details (
  OrderDetailID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  OrderID NVARCHAR(12) NOT NULL,
  WatchID INT NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
  FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
  FOREIGN KEY (WatchID) REFERENCES watches(WatchID)
);
GO

-- Table structure for table `sliders`
CREATE TABLE sliders (
  SliderID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  SliderName NVARCHAR(255) NOT NULL,
  Description NVARCHAR(MAX) NOT NULL,
  Thumbnail NVARCHAR(255) NOT NULL,
  Status INT NOT NULL DEFAULT 1
);
GO

-- Table structure for table `months`
--CREATE TABLE months (
--  MonthName INT NOT NULL PRIMARY KEY
--);
--GO
-- Inserting data into table `categories`
INSERT INTO categories (CategoryName) VALUES
(N'Đồng hồ nam'),
(N'Đồng hồ nữ'),
(N'Đồng hồ trẻ em'),
(N'Đồng hồ đôi');
GO
-- Inserting data into table `months`
--INSERT INTO months (MonthName) VALUES
--(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
--GO
-- Inserting data into table `sliders`
INSERT INTO sliders (SliderName, Description, Thumbnail, Status) VALUES
(N'Đồng hồ TiTan', N'Thời gian với sự hoàn hảo là phong cách trông thật phong cách', '/assets/slider/slider-1.jpg', 1),
(N'Thứ sáu giảm giá', N'Giảm giá thời trang vào tối thứ sáu', '/assets/slider/slider-2.jpg', 1),
(N'Đồng hồ nam', N'Đồng hồ tay thời trang độc quyền trường tồn dành cho nam giới', '/assets/slider/slider-3.jpg', 1),
(N'Đồng hồ thông minh', N'Bán đồng hồ thông minh độc quyền', '/assets/slider/slider-4.jpg', 1);
GO
-- Inserting data into table `users`
--INSERT INTO users (Username, Password, Fullname, Phone, Email, Status, Role) VALUES

--GO
-- Inserting data into table `watches`
INSERT INTO watches (WatchName, Thumbnail, Description, Price, Trademark, CategoryID) VALUES
(N'Đồng hồ định vị Wonlex GW400S', '/assets/product/dong-ho-thong-minh-Gw400S.jpg', N'Chưa có', 899000, N'Wonlex', 1),
(N'Đồng hồ Thụy Sỹ Tag Heuer', '/assets/product/dong-ho-noi-tieng-the-gioi-tag-heuer.jpg', N'Một trong những chiếc đồng hồ Thụy Sỹ danh giá, Tag Heuer nổi tiếng với công nghệ chế tác đồng hồ thể thao cực đỉnh. Thương hiệu nhanh chóng đẩy tên tuổi của mình khi kết hợp với các giải thể thao uy tín, đua xe và nhà sản xuất đua xe. Không chỉ dừng lại với đồng hồ đeo tay cổ điển, đồng hồ thông minh (smartwatch) Tag Heuer cũng dần chiếm được thị phần của riêng mình. Nam giới yêu thích đồng hồ nam với thiết kế khỏe khoắn không thể bỏ qua dòng Formula One, Aquaracer hay Grand Carrera từ Tag Heuer.', 34000000, N'Tag Heuer', 1),
(N'Đồng hồ nam Longines Master', '/assets/product/dong-ho-nam-longines-master.png', N'Đang cập nhật', 88464000, N'Longines Master', 1),
(N'Đồng hồ Casio 51 mm Nam', '/assets/product/casio-120w-2avdf-nam.jpg', N'Sở hữu đường kính mặt 51 mm cùng thiết kế màu xanh thanh lịch, trẻ trung cho các bạn nam yêu thích sự cá tính. Thời gian sử dụng pin thoải mái lên đến 10 năm.', 1579000, N'Casio', 1),
(N'Casio g-shock ga-900-4adr', '/assets/product/dong-ho-casio-ga-900-4adr_1608805186.jpg', N'Đèn LED (Chiếu sáng cực mạnh)\r\nThời lượng chiếu sáng có thể lựa chọn (1,5 hoặc 3 giây), phát sáng sau\r\nTính năng chuyển kim (Kim dịch chuyển qua một bên để không che kết quả hiển thị trên màn hình kỹ thuật số.)\r\nGiờ thế giới\r\n31 múi giờ (48 thành phố + giờ phối hợp quốc tế), bật/tắt tiết kiệm ánh sáng ban ngày, chuyển đổi Giờ địa phương/Giờ thế giới, Truy cập một chạm vào múi giờ UTC\r\nĐồng hồ bấm giờ 1/100 giây\r\nKhả năng đo: 23:59-59.99\"\r\nChế độ đo: Thời gian đã trôi qua, ngắt giờ, thời gian về đích thứ nhất - thứ hai\r\nKhác: cảnh báo thời gian đích, bắt đầu định giờ trực tiếp từ chế độ hiển thị giờ hiện hành\r\nĐồng hồ đếm ngược\r\nĐơn vị đo: 1/10 giây\r\nKhoảng đếm ngược: 60 phút\r\nKhoảng cài đặt thời gian bắt đầu đếm ngược: 1 phút đến 60 phút (khoảng tăng 1 phút)\r\n5 chế độ báo thức hàng ngày (với 1 chế độ báo lặp)\r\nTín hiệu thời gian hàng giờ\r\nLịch hoàn toàn tự động (đến năm 2099)\r\nĐịnh dạng giờ 12/24\r\nBật/tắt âm nhấn nút\r\nGiờ hiện hành thông thường: Giờ, phút, giây, giờ chiều, tháng, ngày, thứ\r\nĐộ chính xác: ±15 giây một tháng\r\nTuổi thọ pin xấp xỉ: 7 năm đối với pin CR2016', 3584000, N'Casio', 1),
(N'Đồng hồ định vị trẻ em Masstel Super hero', '/assets/product/masstel-super-hero-xanh-duong-thumb-1-600x600.jpg', N'Chưa có', 1290000, N'Masstel', 3);
GO