USE [master]
GO
/****** Object:  Database [DB_Tad]    Script Date: 6/2/2024 11:59:08 AM ******/
CREATE DATABASE [DB_Tad]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Tad', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SERVER\MSSQL\DATA\DB_Tad.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Tad_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SERVER\MSSQL\DATA\DB_Tad_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_Tad] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Tad].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Tad] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Tad] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Tad] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Tad] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Tad] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Tad] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Tad] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Tad] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Tad] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Tad] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Tad] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Tad] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Tad] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Tad] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Tad] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Tad] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Tad] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Tad] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Tad] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Tad] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Tad] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Tad] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Tad] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Tad] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Tad] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Tad] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Tad] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Tad] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Tad] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Tad] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Tad', N'ON'
GO
ALTER DATABASE [DB_Tad] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_Tad] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_Tad]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleID] [nvarchar](10) NOT NULL,
	[DefaultAddress] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[WardID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ProductID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Discount] [float] NOT NULL,
	[PostingDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Detail] [ntext] NULL,
	[Status] [bit] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProvinceID] [int] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[RatingStar] [smallint] NOT NULL,
	[Status] [bit] NOT NULL,
	[FeedbackContent] [ntext] NULL,
	[PostingDate] [datetime] NOT NULL,
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Coupon] [float] NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[DeliveryTime] [datetime] NULL,
	[StatusOrder] [smallint] NOT NULL,
	[AccountID] [int] NOT NULL,
	[DefaultAddress] [ntext] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[Detail] [ntext] NULL,
	[PostingDate] [date] NOT NULL,
	[Unit] [nvarchar](20) NULL,
	[CategoryID] [int] NOT NULL,
	[CouponID] [int] NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [nvarchar](10) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[WardID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DistrictID] [int] NOT NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[WardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[ProductID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (14, N'Nguyễn Đức Chí', N'Danh', N'chidanh0502@gmail.com', N'0868273885', N'acc_4.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'ADMIN', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (35, N'Trần Nguyên', N'Hoàng', N'tnh003@gmail.com', N'0856738591', N'acc_2.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', 3)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (36, N'Phạm Thụy Dạ', N'Ngọc Ánh', N'pthuydathao@gmail.com', N'0376475278', N'acc_7.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', 3)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (37, N'Huỳnh ', N'Thị Ánh', N'ahuynh359@gmail.com', N'0469234921', N'acc_2.png', 1, N'$2a$12$X5Gfw0Hl3z65tPhvU95zz.ZPffjL69FNqg9C2BJb1cIehk.LbYWu2', N'GUEST', 41)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (38, N'Hồ Đức', N'Hoàng', N'hdh020@gmail.com', N'0459684913', N'acc_5.png', 0, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', 3)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (39, N'Hồ Đức ', N'Nguyên ', N'hdnguyen057@gmail.com', N'0756839132', N'acc_1.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (40, N'Nguyễn Thị Tuyết', N'Nhi', N'nttnhi050@gmail.com', N'0729353184', N'acc_7.png', 0, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (42, N'Ngô Hồng', N'Ngọc', N'rubidy0602@gmail.com', N'0385629381', N'acc_8.png', 0, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (43, N'Nguyễn Đức', N'Huy', N'n20dccn021@student.ptithcm.edu.vn', N'0868273914', N'acc_9.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (44, N'Huỳnh ', N'Anh', N'huynhanh123@gmail.com', N'0384758937', N'acc_10.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (45, N'Phạm Đức', N'Bình', N'ducbinh123@gmail.com', N'0723457593', N'no_acc.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (46, N'Nguyễn Trọng ', N'Tính', N'trongtin123@gmail.com', N'0849273847', N'no_acc.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (47, N'Huynh', N'Anh', N'ahuynh3123@gmail.com', N'0376475278', N'no_acc.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (48, N'Huynh', N'Anh', N'n20dccn003@student.ptithcm.edu.vn', N'0376475278', N'no_acc.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (49, N'Huynh', N'Anh', N'ahuynh0312@gmail.com', N'0376475278', N'acc_1.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'GUEST', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (50, N'Huynh', N'Anh', N'ahuynh359@gmai', N'0376475278', N'acc_6.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (52, N'Huynh', N'Anh', N'ahuynh35923@gmail.com', N'0374823432', N'acc_6.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (53, N'Huynh', N'Anh', N'ahuynh312359@gmail.com', N'0374823443', N'acc_6.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (54, N'Huynh', N'Anh', N'ahuynh35932@gmail.com', N'0376475278', N'acc_6.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (55, N'H', N'Anh', N'ahuynh35329@gmail.com', N'0376475267', N'acc_6.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (56, N'Danh', N'Thành', N'thanhdanh092@gmail.com', N'0376475278', N'acc_7.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (59, N'A', N'Nguyên A', N'hdnguyn057@gmail.com', N'0384738234', N'acc_7.png', 1, N'$2a$12$.N.zNff4v/353pw/VKEsB.bk1JKiblI8q82PHvrnzuSIqhIlwJVHK', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (60, N'Huynh Ngoc', N'Anh', N'ahuynh000@gmail.com', N'0387564738', N'acc_10.png', 0, N'$2a$12$dP.K8.35qM2wH9swELuWU./TzwYBQPHf8aw5jJLXMuaBshvZ8tS46', N'EMPLOYEE', NULL)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (61, N'Nguyeenx', N'Huyeens', N'huyen04062003@gmail.com', N'0702433525', N'', 1, N'$2a$12$SazI1xcKggPouhVs2RglT.r63wpoC3ED2oZ.KY1Dj6qVy63PoQgma', N'GUEST', 4)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (67, N'Alexx', N'Mai', N'hhh46@gmail.com', N'0254254123', NULL, 1, N'$2a$12$SazI1xcKggPouhVs2RglT.r63wpoC3ED2oZ.KY1Dj6qVy63PoQgma', N'ADMIN', 3)
INSERT [dbo].[Account] ([AccountID], [LastName], [FirstName], [Email], [PhoneNumber], [Avatar], [Status], [Password], [RoleID], [DefaultAddress]) VALUES (68, N'Hieu', N'Tran', N'n21dccn122@student.ptithcm.edu.vn', N'0764708309', N'', 1, N'$2a$12$oPkjie5V1OEfG1qIBWWzhuyZ3TjjTp9h8KCluTYdBLi3vmB6FYxPK', N'GUEST', 42)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [Name], [WardID], [AccountID]) VALUES (3, N'A50', 2, 36)
INSERT [dbo].[Address] ([AddressID], [Name], [WardID], [AccountID]) VALUES (4, N'Vườn Lài', 16, 61)
INSERT [dbo].[Address] ([AddressID], [Name], [WardID], [AccountID]) VALUES (41, N'A213', 160, 37)
INSERT [dbo].[Address] ([AddressID], [Name], [WardID], [AccountID]) VALUES (42, N'24', 2, 68)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (5, 39, 3)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (5, 45, 10)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (6, 39, 4)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (7, 14, 1)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (7, 39, 22)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (8, 39, 1)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (9, 45, 10)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (10, 44, 10)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (11, 45, 10)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (13, 39, 20)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (18, 39, 2)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (18, 40, 2)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (19, 40, 1)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (20, 14, 3)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (20, 40, 3)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (21, 42, 1)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (23, 42, 4)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (25, 42, 2)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (26, 43, 2)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (28, 43, 5)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (29, 44, 10)
INSERT [dbo].[Cart] ([ProductID], [AccountID], [Quantity]) VALUES (30, 44, 10)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (1, N'Hoa Chúc Mừng', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (2, N'Hoa Cưới Cầm Tay', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (3, N'Hoa tang lễ - Hoa Chia Buồn', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (4, N'Hoa tình yêu', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (5, N'Hoa Valentine', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (6, N'Hoa Kỷ Niệm Ngày Cưới', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (7, N'Ngày của mẹ', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (8, N'Hoa Chúc Mừng 8-3', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (9, N'Hoa Chúc Mừng 20-10', NULL)
INSERT [dbo].[Category] ([CategoryID], [Name], [Image]) VALUES (10, N'Tết âm lịch', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (27, N'Ngày 9/3', 0.2, CAST(N'2023-06-29T00:00:00.000' AS DateTime), CAST(N'2023-07-02T00:00:00.000' AS DateTime), N'Ngày 8/3', 1, 39)
INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (28, N'Ngày 8/3', 0.5, CAST(N'2023-06-09T00:00:00.000' AS DateTime), CAST(N'2023-06-15T00:00:00.000' AS DateTime), N'Dịp Giảm 50%', 1, 38)
INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (29, N'Ngày quốc tế thiếu nhi', 0.2, CAST(N'2023-06-09T00:00:00.000' AS DateTime), CAST(N'2023-06-15T00:00:00.000' AS DateTime), N'Giảm giá', 1, 38)
INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (30, N'Ánh Huỳnh Ngọc', 0.3, CAST(N'2023-06-09T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), N'Ahihi', 1, 39)
INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (31, N'Voucher 20/10', 0.4, CAST(N'2023-06-11T00:00:00.000' AS DateTime), CAST(N'2023-06-16T00:00:00.000' AS DateTime), N'Ngày 20/10', 1, 39)
INSERT [dbo].[Coupon] ([CouponID], [Name], [Discount], [PostingDate], [ExpiryDate], [Detail], [Status], [AccountID]) VALUES (32, N'Ngày 10/3', 0.4, CAST(N'2023-06-10T00:00:00.000' AS DateTime), CAST(N'2023-06-18T00:00:00.000' AS DateTime), N'Ngày 10/3', 1, 39)
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (1, N'Quận 1', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (2, N'Quận 12', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (3, N'Quận Gò Vấp', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (4, N'Quận Bình Thạnh', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (5, N'Quận Tân Bình', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (6, N'Quận Tân Phú', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (7, N'Quận Phú Nhuận', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (8, N'Thành phố Thủ Đức', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (9, N'Quận 3', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (10, N'Quận 10', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (11, N'Quận 11', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (12, N'Quận 4', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (13, N'Quận 5', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (14, N'Quận 6', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (15, N'Quận 8', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (16, N'Quận Bình Tân', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (17, N'Quận 7', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (18, N'Huyện Củ Chi', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (19, N'Huyện Hóc Môn', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (20, N'Huyện Bình Chánh', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (21, N'Huyện Nhà Bè', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (22, N'Huyện Cần Giờ', 1)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (23, N'Thành phố Thủ Dầu Một', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (24, N'Huyện Bàu Bàng', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (25, N'Huyện Dầu Tiếng', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (26, N'Thành phố Bến Cát', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (27, N'Huyện Phú Giáo', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (28, N'Thành phố Tân Uyên', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (29, N'Thành phố Dĩ An', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (30, N'Thành phố Thuận An', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (31, N'Huyện Bắc Tân Uyên', 2)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (32, N'Thành phố Biên Hòa', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (33, N'Thành phố Long Khánh', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (34, N'Huyện Tân Phú', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (35, N'Huyện Vĩnh Cửu', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (36, N'Huyện Định Quán', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (37, N'Huyện Trảng Bom', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (38, N'Huyện Thống Nhất', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (39, N'Huyện Cẩm Mỹ', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (40, N'Huyện Long Thành', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (41, N'Huyện Xuân Lộc', 3)
INSERT [dbo].[District] ([DistrictID], [Name], [ProvinceID]) VALUES (42, N'Huyện Nhơn Trạch', 3)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (1, 1, 0, N'Sản phẩm rất ngon ăn rất ghiền', CAST(N'2023-05-16T00:00:00.000' AS DateTime), 39, 3)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (4, 2, 1, N'Sản phẩm tuyệt vời', CAST(N'2023-05-15T00:00:00.000' AS DateTime), 39, 5)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (5, 3, 0, N'Rất ngon', CAST(N'2023-05-16T19:10:09.580' AS DateTime), 39, 6)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (8, 4, 0, N'Hợp giá tiền', CAST(N'2023-05-17T00:00:00.000' AS DateTime), 39, 7)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (10, 5, 0, N'Tuyệt Vời', CAST(N'2023-05-17T00:00:00.000' AS DateTime), 39, 8)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (12, 1, 1, N'Cần cải thiện chất lượng hơn nữa', CAST(N'2023-05-17T00:00:00.000' AS DateTime), 39, 9)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (15, 2, 0, N'Rất tuyệt vời', CAST(N'2023-05-20T00:00:00.000' AS DateTime), 40, 3)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (16, 3, 1, N'Sản phẩm dở tệ', CAST(N'2023-05-21T00:00:00.000' AS DateTime), 44, 5)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (34, 4, 0, N'13', CAST(N'2023-05-31T01:21:21.853' AS DateTime), 36, 6)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (48, 5, 0, N'Sản phẩm rất tốt', CAST(N'2023-05-31T02:14:57.453' AS DateTime), 36, 7)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (49, 1, 0, N'Sản phẩm tuyệt vời', CAST(N'2023-05-31T02:16:59.380' AS DateTime), 36, 3)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (50, 2, 0, N'Mình rất thích', CAST(N'2023-05-31T15:30:51.227' AS DateTime), 36, 5)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (51, 3, 1, N'Vẹm rất tươi ngon', CAST(N'2023-06-03T00:06:05.167' AS DateTime), 37, 6)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (52, 4, 1, N'Rất thích', CAST(N'2023-06-06T03:29:14.330' AS DateTime), 37, 8)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (53, 5, 1, N'<p style="text-align:center">M&igrave;nh rất th&iacute;ch</p>
', CAST(N'2023-06-06T20:18:21.703' AS DateTime), 37, 9)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (54, 1, 1, N'<p><span style="font-family:Comic Sans MS,cursive">Sản phẩm rất tốt</span></p>
', CAST(N'2023-06-10T02:02:06.487' AS DateTime), 37, 3)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (55, 3, 1, N'<p>Sản phẩm rất tốt</p>
', CAST(N'2023-06-10T02:32:05.317' AS DateTime), 37, 11)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (56, 4, 1, N'<p><span style="font-size:10px">M&igrave;nh rất th&iacute;ch&nbsp;</span></p>
', CAST(N'2023-06-10T14:07:30.493' AS DateTime), 37, 5)
INSERT [dbo].[Feedback] ([FeedbackID], [RatingStar], [Status], [FeedbackContent], [PostingDate], [AccountID], [ProductID]) VALUES (57, 3, 1, N'<p>M&igrave;nh rất th&iacute;ch</p>
', CAST(N'2023-06-11T00:32:33.207' AS DateTime), 37, 7)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (1, 70, 1, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (1, 81, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (2, 75, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (2, 94, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (3, 71, 2, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (3, 72, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (3, 94, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (4, 85, 2, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (5, 91, 3, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (6, 72, 3, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (6, 75, 2, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (6, 90, 4, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (7, 72, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (7, 86, 1, 0.35)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (7, 88, 1, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (7, 92, 1, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (9, 73, 1, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (11, 74, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (12, 72, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (12, 89, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (15, 81, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (15, 86, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (15, 93, 1, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (16, 74, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (17, 76, 5, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (17, 87, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (17, 93, 1, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (18, 75, 20, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (18, 85, 2, 0.2)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (20, 71, 1, 0.4)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (20, 72, 3, 0.4)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (20, 73, 1, 0.4)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (20, 74, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (20, 93, 1, 0.5)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (21, 72, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (23, 72, 3, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (23, 75, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (25, 70, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (25, 74, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (25, 75, 2, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (25, 77, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (25, 87, 1, 0)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Coupon]) VALUES (30, 72, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (70, CAST(N'2023-06-02T01:45:46.257' AS DateTime), CAST(N'2023-06-02T02:15:46.257' AS DateTime), 2, 36, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 517500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (71, CAST(N'2023-06-02T01:51:30.160' AS DateTime), CAST(N'2023-06-02T02:21:30.160' AS DateTime), 2, 36, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 104000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (72, CAST(N'2023-06-02T02:24:27.287' AS DateTime), CAST(N'2023-06-02T02:54:27.287' AS DateTime), 2, 36, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 1142800.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (73, CAST(N'2023-06-03T00:02:19.713' AS DateTime), CAST(N'2023-06-03T00:32:19.713' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 277500.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (74, CAST(N'2023-06-05T12:51:50.517' AS DateTime), CAST(N'2023-06-05T13:21:50.517' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 464000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (75, CAST(N'2023-06-05T19:15:18.033' AS DateTime), CAST(N'2023-06-05T19:45:18.033' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 3185000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (76, CAST(N'2023-06-05T19:20:41.437' AS DateTime), CAST(N'2023-06-05T19:50:41.437' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 215000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (77, CAST(N'2023-06-05T19:21:35.803' AS DateTime), CAST(N'2023-06-05T19:51:35.803' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 75000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (81, CAST(N'2023-06-05T19:23:36.307' AS DateTime), CAST(N'2023-06-05T19:53:36.307' AS DateTime), 2, 37, N'A50, Xã Hải Bối, Huyện Đông Anh, Thành phố Hà Nội', 272000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (85, CAST(N'2023-06-06T03:27:03.897' AS DateTime), CAST(N'2023-06-06T03:57:03.897' AS DateTime), 3, 37, N'A150, Xã Ca Thành, Huyện Nguyên Bình, Tỉnh Cao Bằng', 575000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (86, CAST(N'2023-06-06T08:07:42.673' AS DateTime), CAST(N'2023-06-06T08:37:42.673' AS DateTime), 0, 37, N'A150, Xã Ca Thành, Huyện Nguyên Bình, Tỉnh Cao Bằng', 96000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (87, CAST(N'2023-06-08T00:46:12.640' AS DateTime), CAST(N'2023-06-08T01:16:12.640' AS DateTime), 3, 37, N'A150, Xã Ca Thành, Huyện Nguyên Bình, Tỉnh Cao Bằng', 380000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (88, CAST(N'2023-06-10T02:00:18.543' AS DateTime), CAST(N'2023-06-10T02:30:18.543' AS DateTime), 2, 37, N'A50, Phường Hoàng Văn Thụ, Quận Hoàng Mai, Thành phố Hà Nội', 52000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (89, CAST(N'2023-06-10T02:31:06.670' AS DateTime), CAST(N'2023-06-10T03:01:06.670' AS DateTime), 2, 37, N'A15012, Xã Khánh Xuân, Huyện Bảo Lạc, Tỉnh Cao Bằng', 70000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (90, CAST(N'2023-06-10T02:40:47.383' AS DateTime), CAST(N'2023-06-10T03:10:47.383' AS DateTime), 0, 37, N'A12301, Xã Thành Hòa, Huyện Văn Lãng, Tỉnh Lạng Sơn', 24000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (91, CAST(N'2023-06-10T03:20:41.077' AS DateTime), CAST(N'2023-06-10T03:50:41.077' AS DateTime), 2, 37, N'A15012, Xã Khánh Xuân, Huyện Bảo Lạc, Tỉnh Cao Bằng', 32000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (92, CAST(N'2023-06-10T14:06:10.307' AS DateTime), CAST(N'2023-06-10T14:36:10.307' AS DateTime), 3, 37, N'A50, Phường Hoàng Văn Thụ, Quận Hoàng Mai, Thành phố Hà Nội', 52000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (93, CAST(N'2023-06-11T00:14:38.963' AS DateTime), CAST(N'2023-06-11T00:44:38.963' AS DateTime), 3, 37, N'A50, Phường Hoàng Văn Thụ, Quận Hoàng Mai, Thành phố Hà Nội', 575000.0000)
INSERT [dbo].[Orders] ([OrderID], [OrderTime], [DeliveryTime], [StatusOrder], [AccountID], [DefaultAddress], [Price]) VALUES (94, CAST(N'2024-06-02T11:56:15.630' AS DateTime), CAST(N'2024-06-02T12:26:15.630' AS DateTime), 0, 68, N'24, Phường Đa Kao, Quận 1, TP. Hồ Chí Minh', 1370000.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (1, N'Điều Ngọt Ngào Nhất
', 1850000.0000, N'product-1.jpg', 99, N'Lẵng hoa Điều ngọt ngào nhất được tạo nên từ hoa hồng dâu, hoa hồng kem và đồng tiền hồng được tô điểm bởi các loại lá phụ trang trí khác. Lẵng hoa thích hợp dành tặng những dịp khai trương, chúc mừng, mừng tân gia....

Lẵng hoa Điều Ngọt Ngào Nhất được thiết kế từ :

Hoa hồng dâu: 25 cành 
Hoa hồng kem: 25 cành 
Hoa đồng tiền hồng: 10 cành 
Hoa lan hồ điệp trắng: 1 cành (6-8 bông/ cành )
Hoa baby trắng: 50gram 
Hoa cúc ping pong: 5 cành 
Các loại hoa lá phụ: Lá Mimosa, lá bạc
', CAST(N'2024-01-01' AS Date), N'Bó', 1, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (2, N'Tia Nắng
', 750000.0000, N'product-2.jpg', 98, N'Em là tia nắng của cuộc đời anh, soi sáng những khoảnh khắc tăm tối nhất trong anh, làm anh trở nên mạnh mẽ hơn bao giờ hết. Tặng cô ấy bó hoa Tia Nắng thay cho lời cảm ơn nhé!

Bó hoa Tia nắng được thiết kế từ

Hoa hồng đỏ: 25 cành
Các loại hoa lá phụ: Lá bạc
', CAST(N'2024-01-01' AS Date), N'Bó', 1, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (3, N'Sắc tím mộng mơ
', 600000.0000, N'product-3.jpg', 98, N'Hoa Thạch thảo tím mang trên mình một nét đẹp nhẹ nhàng lại dễ thương, xinh xắn. Hoa thạch thảo tím gắn liền với những ý nghĩa sâu sắc về tình yêu đôi lứa. Loài hoa này mang ý nghĩa tượng trưng cho một tình yêu bình dị và nhẹ nhàng. Trong tình yêu ấy, đôi lứa luôn đong đầy tình cảm và luôn dõi theo nhau. Những cánh hoa mỏng manh còn là tượng trưng cho những lời thề hẹn không bao giờ quên, sẽ mãi cùng nhau nắm tay đi qua những sóng gió, gập ghềnh của cuộc đời.

Giỏ hoa Sắc Tím Mộng Mơ được thiết kế từ

Hoa thạch thảo tím: 5 bó 
', CAST(N'2024-01-01' AS Date), N'Bó', 1, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (4, N'Hoa Cưới J''aime
', 1050000.0000, N'product-4.jpg', 99, N'Hoa mao lương màu cam kết hợp hoàn hảo với hoa hồng và hoa cát tường tạo nên bó hoa cưới xinh xắn, dễ thương.

Bó Hoa Cưới J''aime gồm có

Hoa mao lương cam: 10 cành
Hoa cát tường
Hoa hồng pastel
', CAST(N'2024-01-11' AS Date), N'Bó', 2, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (5, N'Hoa Cưới Together
', 1100000.0000, N'product-5.jpg', 99, N'Bó hoa cưới Together được thiết kế theo tone màu đỏ rực rỡ từ các loài hoa mao lương, cẩm chướng và thanh liễu đỏ, những loài hoa mang ý nghĩa may mắn và tình yêu. Bó hoa là lựa chọn hoàn hảo cho cô dâu mặc váy cưới màu trắng.

Bó hoa gồm có

Hoa mao lương đỏ: 10 cành
Hoa cẩm chướng đỏ
Hoa hoa thanh liễu đỏ
', CAST(N'2024-01-01' AS Date), N'Bó', 2, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (6, N'Hoa cưới Everlasting
', 790000.0000, N'product-6.jpg', 99, N'Hoa cưới cầm tay Everlasting được thiết kế từ

Hoa sen hồng: 7 cành
Đài sen: 3 cành
Hoa baby: 30 gram
Các loại hoa lá phụ: Cỏ đồng tiền
', CAST(N'2024-01-01' AS Date), N'Bó', 2, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (7, N'Hoa Tang Lễ - Chia Xa
', 930000.0000, N'product-7.jpg', 99, N'Dùng hoa tươi chia buồn còn giúp cho ta thể hiện tiếc thương cho những khát khao và niềm hy vọng của một con người còn dang dở. Hay đó cũng chính là lời cầu nguyện, tiếng lòng hiếu thảo của con cháu dâng kính lên các bậc bề trên của mình một cách dễ dàng và tỏ lòng hơn.""

Kệ Hoa Chia Buồn được thiết kế từ

Hoa hồng pastel
Các loại hoa lá phụ
', CAST(N'2024-01-01' AS Date), N'Bó', 3, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (8, N'Mãi Nhớ
', 2690000.0000, N'product-8.jpg', 99, N'Từng chi tiết đều được chú ý, chăm chút kĩ để giúp cho lời chia buồn của bạn được trao gửi một cách thành kính nhất. Những bông hoa hồ điệp tím sang trọng tô điểm trên nền trắng được tạo nên từ những loại hoa đa dạng, giúp làm nên một bố cục độc đáo, trang trọng.

Kệ Hoa Tang Mãi Nhớ được thiết kế từ:

Lan hồ điệp trắng: 8 cành (6-8 bông/cành)
Cát tường xanh: 20 cành
Lan mokara trắng: 5 cành
Các loại hoa lá phụ: Lá đuôi chồn
', CAST(N'2024-01-01' AS Date), N'Bó', 3, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (9, N'Thuần Khiết
', 2690000.0000, N'product-9.jpg', 99, N'Lan hồ điệp trắng kết hợp với cẩm tú cầu trắng tô điểm với calimero và cúc xanh tạo nên một bức tranh thật thuần khiết, tinh tế nhưng vẫn rất nổi bật. Kệ hoa thuần khiết thể hiện tâm hồn thanh tao của người đã khuất, đồng thời cũng là lời chia ly, chia buồn và cũng là lời động viên với người ở lại.

Kệ Hoa Chia Buồn được thiết kế từ

Hoa tú cầu xanh bơ: 5 cành
Cành hoa lan hồ điệp trắng : 7 cành (6-7 bông/cành)
Hoa cát tường xanh : 10 cành 
Hoa calimero trắng : 20 cành
Green wicky : 10 cành
Các loại lhoa lá phụ: Chuỗi ngọc xanh, lá đuôi, lá đồng tiền
', CAST(N'2024-01-01' AS Date), N'Bó', 3, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (10, N'Pure Love', 610000.0000, N'product-10.jpg', 99, N'Bó hoa Pure Love được thiết kế từ

Hoa hồng đỏ: 21 cành
Các loại hoa lá phụ: Lá bạc', CAST(N'2024-01-01' AS Date), N'Bó', 4, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (11, N'Rose Garden', 2750000.0000, N'product-11.jpg', 99, N'Rose Garden được thiết kế từ những bông hoa hồng nhập khẩu Ecuador cao cấp, sang trọng sẽ là lựa chọn hoàn hảo để gửi tặng vợ, bạn gái hoặc những đối tác quan trọng vào dịp sinh nhật, hay những ngày lễ đặc biệt.

Bó hoa Yêu Mỗi Em được thiết kế từ  :

Hoa hồng nhập Ecuador: 25 cành
Các loại hoa lá phụ
', CAST(N'2024-01-01' AS Date), N'Bó', 4, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (12, N'Lạc Thần
', 790000.0000, N'product-12.jpg', 99, N'Hoa hồng lạc thần kết hợp với hoa cúc tana tạo nên một bó hoa xinh xắn, dễ thương khiến bất kì cô gái nào cũng phải xiêu lòng. Bó hoa thích hợp để gửi tặng vợ, bạn gái hay cô bạn thân thiết vào những dịp đặc biệt như sinh nhật, kỷ niệm ngày yêu, ngày cưới...

Bó hoa Lạc Thần bao gồm:

Hoa hồng lạc thần: 15 bông
Cúc tana
Các loại hoa lá phụ
', CAST(N'2024-01-01' AS Date), N'Bó', 4, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (13, N'Enigma Roses
', 2770000.0000, N'product-13.png', 99, N'Bó Hoa Enigma Roses bao gồm:

Hoa hồng đỏ pháp: 100 cành', CAST(N'2024-01-01' AS Date), N'Bó', 5, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (14, N'Perfect', 760000.0000, N'product-14.jpg', 99, N'Mang sắc hồng nhẹ nhàng từ giấy gói ngoài cho đến những đóa hồng kem, bó hoa Perfect hứa hẹn sẽ là một món quà tuyệt vời gửi tặng đến những người mà bạn yêu thương nhất. 

Bó hoa Perfect được thiết kế từ

Hoa hồng kem: 20 cành
Hoa baby trắng: 150 gram
', CAST(N'2024-01-01' AS Date), N'Bó', 5, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (15, N'Chung Đôi', 1440000.0000, N'product-15.jpg', 99, N'Bó hoa gồm 50 hồng đỏ gồm những cánh hồng tươi rực rỡ nhất được gói theo tông giấy hồng dễ thương như một lời nhắn trao gửi yêu thương đầy chân thành nhất. Giữa cuộc sống đầy thử thách, một chút chia sẻ, trao gửi yêu thương nhất định sẽ làm ấm lòng và tiếp thêm sức mạnh cho bạn ấy đấy.

Bó hoa Chung Đôi được thiết kế từ

Hoa hồng đỏ: 50 cành
Hoa baby trắng: 150 gram
', CAST(N'2024-01-01' AS Date), N'Bó', 5, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (16, N'Green Day', 1990000.0000, N'product-16.jpg', 99, N'Bó hoa Green Day được thiết kế từ 20 bông hoa Tulip xanh lá lạ mắt. Lựa chọn bó hoa Tulip Green Day để tặng vợ, bạn gái vào những dịp đặc biệt là cách đơn giản nhất để khiến nàng bất ngờ và hạnh phúc.

Bó hoa Tulip Green Day được thiết kế từ

Hoa tulip nhuộm xanh lá: 20 cành
', CAST(N'2024-01-01' AS Date), N'Bó', 6, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (17, N'Ti Amo', 530000.0000, N'product-17.jpg', 99, N'Bó hoa Ti Amo được thiết kế với từ 15 bông hoa hồng đỏ kết hợp với các loại lá phụ. Trong tình yêu, 15 bông hoa hồng đỏ mang thông điệp:""Tình yêu của Anh kéo dài theo năm tháng"". Bó hoa Ti Amo là lựa chọn hoàn hảo để gửi tặng vợ, bạn gái trong ngày sinh nhật hay ngày lễ tình nhân valentine. 

Bó hoa Ti Amo được thiết kế từ

Hoa hồng đỏ: 15 cành
Các loại hoa lá phụ: Lá chanh
', CAST(N'2024-01-01' AS Date), N'Bó', 6, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (18, N'Ban Mai', 610000.0000, N'product-18.jpg', 99, N'Tình yêu luôn là một tình cảm đầy diệu kì mà tinh khiết. Chỉ cần tình yêu, thế giới xung quanh bạn có thể trở thành một màu hồng đầy tươi sáng. Bó hoa được lấy cảm hứng từ vẻ đẹp của tình yêu đó, được tạo nên từ những cánh hồng với tông màu pastel cùng cát tường trắng và các loại hoa tươi nhất.

Bó hoa Ban Mai được thiết kế từ

Hoa hồng kem: 15 cành
Hoa cát tường xanh: 5 cành
Các loại hoa lá phụ: Lá bạc
', CAST(N'2024-01-01' AS Date), N'Bó', 6, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (19, N'Ước Mơ Của Mẹ
', 700000.0000, N'product-19.jpg', 99, N'Lẵng hoa Giấc Mơ Của Mẹ được thiết kế từ:

Hoa hướng dương: 5 cành
Hoa cẩm chướng hồng: 10 cành
Hoa hồng kem: 5 cành
Các loại hoa lá phụ khác: Nụ cát tường, lá bạc nhí, cúc thạch thảo trắng
', CAST(N'2024-01-01' AS Date), N'Bó', 7, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (20, N'Nồng Say
', 760000.0000, N'product-20.jpg', 99, N'Bó hoa nồng say là sự kết hợp hoàn hảo giữa hoa ly hồng đậm và hoa baby trắng cùng lá phụ. Bó hoa là lựa chọn phù hợp để tặng vợ, tặng mẹ vào dịp sinh nhật hoặc ngày lễ của Mẹ.

Bó Hoa Nồng Say được thiết kế từ

Hoa ly hồng: 5 cành 
Hoa Baby trắng : 50 gram 
Các loại hoa lá phụ
', CAST(N'2024-01-01' AS Date), N'Bó', 7, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (21, N'Tấm Lòng
', 680000.0000, N'product-21.jpg', 99, N'Bó hoa Tấm lòng là sự phối hợp giữa nhiều loại hoa quen thuộc nhưng khi đứng cùng nhau, lại tạo nên 1 tác phẩm độc đáo, mang màu sắc tươi mới và tinh tế, sang trọng. Bó hoa thích hợp tặng trong dịp sinh nhật hay kỷ niệm như 1 lời chúc chân thành nhất đến người được tặng.

Bó hoa Tấm Lòng được thiết kế từ

Hoa hồng đỏ: 15 cành
Hoa ly hồng: 5 cành
Hoa cẩm chướng chùm hồng: 5 cành
Các loại hoa lá phụ: Hoa hoàng anh, trúc bách hợp
', CAST(N'2024-01-01' AS Date), N'Bó', 7, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (22, N'Dreamy Love', 530000.0000, N'product-22.jpg', 99, N'Bó Hoa Dreamy Love bao gồm:

Hoa hồng đỏ pháp: 15 cành', CAST(N'2024-01-01' AS Date), N'Bó', 8, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (23, N'Sunny Days', 560000.0000, N'product-23.jpg', 99, N'Sunny Days như một niềm tin vào ngày mai tươi sáng, hướng về phía trước, như đúng ý nghĩa của Hoa Hướng Dương đem lại. Dẫu cho ngày hôm nay có tối tăm mịt mờ, mặt trời vẫn lên, và ta vẫn đi tiếp

Bó hoa Sunny Days được thiết kế từ

Hoa hướng dương: 6 cành
Hoa baby trắng: 150gram
', CAST(N'2024-01-01' AS Date), N'Bó', 8, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (24, N'Bó Hoa Pinky', 700000.0000, N'product-24.jpg', 99, N'"Bó hoa tông màu hồng nhẹ nhàng  phù hợp tặng cho các bạn nữ. Đặc biệt là những cô gái có cá tính mạnh mẽ nhưng vẫn thể hiện được nét dễ thương, e ấp qua mỗi cử chỉ. Bó hoa được thiết kế theo phong cách hiện đại với kiểu bó tròn và trang trí bởi lá bạc quý phái. Đây là một món quà tinh thần cực kỳ phù để gựi tặng trong những dịp sinh nhật, làm quen, ngày kỉ niệm, chúc mừng, ...v...v

Bó Hoa Pinky được thiết kế từ

Hoa hồng kem: 16 canh
Hoa baby trắng: 50 gram
Các loại hoa lá phụ: Lá bạc"
', CAST(N'2024-01-01' AS Date), N'Bó', 8, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (25, N'
Nụ Cười Em
', 420000.0000, N'product-25.jpg', 99, N'"Hoa cát tường hồng bung nở tựa như nụ cười dịu dàng, ngọt ngào. Bó hoa nụ cười em là lựa chọn thích hợp để gửi tặng vợ, bạn bái vào những dịp đặc biệt.

Bó hoa Nụ Cười Em được thiết kế từ:

Hoa cát tường hồng: 10 cành
Hoa cẩm tú cầu 
Các loại hoa lá phụ"
', CAST(N'2024-01-01' AS Date), N'Bó', 9, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (26, N'Khúc Tình Ca
', 620000.0000, N'product-26.jpg', 99, N'"Bó hoa tone hồng nhẹ nhàng được thiết kế từ các loài hoa cúc ping pong, hoa hồng kem dâu kết hợp với cát tường xoăn trắng là lựa chọn hoàn hảo để gửi đến những người phụ nữ mà bạn yêu thương vào những dịp đặc biệt.

Bó hoa Khúc Tình Ca được thiết kế từ:

Hoa cúc ping pong: 10 cành
Hoa hồng pastel: 5 cành
Hoa cát tường: 10 cành"
', CAST(N'2024-01-01' AS Date), N'Bó', 9, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (27, N'Thanh Thoát
', 510000.0000, N'product-27.jpg', 99, N'"Bó hoa được thiết kế với 9 bông hồng đỏ, baby trắng và lá bạc nhí. Hoa hồng đỏ thể hiện tình yêu ngọt ngào, lãng mạn là quà tặng hoàn hảo dành cho vợ, bạn gái trong những dịp đặc biệt.

Bó Hoa Thanh Thoát được thiết kế từ

Hoa hồng đỏ: 12 cành
Hoa baby trắng: 50 gram
Các loạ hoa lá phụ: Lá bạc"
', CAST(N'2024-01-01' AS Date), N'Bó', 9, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (28, N'Tết Sum Vầy
', 2150000.0000, N'product-28.jpg', 99, N'"Lẵng hoa Tết Sum Vầy được thiết kế với tone màu đỏ màu sắc truyền thống trong dịp Tết Nguyên Đán. Cúc mẫu đơn tượng trưng cho may mắn, tài lộc, sức khỏe và hạnh phúc kết hợp với địa lan sẽ là lựa chọn hoàn hảo để làm quà tặng dịp vào Tết.

Lẵng hoa Tết Sum Vầy gồm có

Hoa cúc mẫu đơn: 8 cành
Hoa địa lan tím: 5 cành
Hoa cẩm chướng đỏ: 10 cành
Đào đông : 2 cành 
Các loại hoa lá phụ : hoa tuyết mai, lá phụ khác."
', CAST(N'2024-01-01' AS Date), N'Bó', 10, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (29, N'Chậu Lan Hồ Điệp - 042
', 5500000.0000, N'product-29.jpg', 99, N'"Chậu lan hồ điệp 042 được thiết kế với 15 cành lan vàng, một trong những loại lan được ưa chuộng nhất hiện nay. Chậu lan hồ điệp 042 là lựa chọn hoàn hỏa để gửi tặng đối tác trong dịp khai trương hoặc lễ tết. Chậu Lan Hồ Điệp - 042 cũng là lựa chọn thích hợp nếu như bạn đang tìm kiếm một loại hoa trưng nhà trong dịp tết nguyên đán.

Chậu lan hồ điệp - 042 được thiết kế từ:

Lan hồ điêp vàng: 20 cành
Hoa lá trang trí "
', CAST(N'2024-01-01' AS Date), N'Bó', 10, NULL, 39)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Image], [Quantity], [Detail], [PostingDate], [Unit], [CategoryID], [CouponID], [AccountID]) VALUES (30, N'Chậu Lan Hồ Điệp - 048
', 2330000.0000, N'product-30.jpg', 99, N'"Chậu lan hồ điệp tím với gam màu không quá đậm đà, phơn phớt, nhẹ nhàng, đằm thắm ep ấp như đang xoa dịu lại những cuộc cãi vã, hờn giận của lứa đôi. Hãy tặng người ấy chậu Lan này như 1 lời xin lỗi nhẹ nhàng đáng yêu các bạn nhé! Chậu Lan này bao gồm 5 cành lan tím được đặt cách nhau trong chiếc chậu màu trắng.

Chậu lan gồm có:

8 cành lan hồ điệp vàng
Hoa lá trang trí "
', CAST(N'2024-01-01' AS Date), N'Bó', 10, NULL, 39)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([ProvinceID], [Name]) VALUES (1, N'TP. Hồ Chí Minh')
INSERT [dbo].[Province] ([ProvinceID], [Name]) VALUES (2, N'Tỉnh Bình Dương')
INSERT [dbo].[Province] ([ProvinceID], [Name]) VALUES (3, N'Tỉnh Đồng Nai')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'EMPLOYEE', N'Employee')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (N'GUEST', N'Guest')
GO
SET IDENTITY_INSERT [dbo].[Ward] ON 

INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (1, N'Phường Tân Định', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (2, N'Phường Đa Kao', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (3, N'Phường Bến Nghé', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (4, N'Phường Bến Thành', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (5, N'Phường Nguyễn Thái Bình', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (6, N'Phường Phạm Ngũ Lão', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (7, N'Phường Cầu Ông Lãnh', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (8, N'Phường Cô Giang', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (9, N'Phường Nguyễn Cư Trinh', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (10, N'Phường Cầu Kho', 1)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (11, N'Phường Thạnh Xuân', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (12, N'Phường Thạnh Lộc', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (13, N'Phường Hiệp Thành', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (14, N'Phường Thới An', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (15, N'Phường Tân Chánh Hiệp', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (16, N'Phường An Phú Đông', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (17, N'Phường Tân Thới Hiệp', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (18, N'Phường Trung Mỹ Tây', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (19, N'Phường Tân Hưng Thuận', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (20, N'Phường Đông Hưng Thuận', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (21, N'Phường Tân Thới Nhất', 2)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (22, N'Phường 15', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (23, N'Phường 13', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (24, N'Phường 17', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (25, N'Phường 6', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (26, N'Phường 16', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (27, N'Phường 12', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (28, N'Phường 14', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (29, N'Phường 10', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (30, N'Phường 05', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (31, N'Phường 07', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (32, N'Phường 04', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (33, N'Phường 01', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (34, N'Phường 9', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (35, N'Phường 8', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (36, N'Phường 11', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (37, N'Phường 03', 3)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (38, N'Phường 13', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (39, N'Phường 11', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (40, N'Phường 27', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (41, N'Phường 26', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (42, N'Phường 12', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (43, N'Phường 25', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (44, N'Phường 05', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (45, N'Phường 07', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (46, N'Phường 24', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (47, N'Phường 06', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (48, N'Phường 14', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (49, N'Phường 15', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (50, N'Phường 02', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (51, N'Phường 01', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (52, N'Phường 03', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (53, N'Phường 17', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (54, N'Phường 21', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (55, N'Phường 22', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (56, N'Phường 19', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (57, N'Phường 28', 4)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (58, N'Phường 02', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (59, N'Phường 04', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (60, N'Phường 12', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (61, N'Phường 13', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (62, N'Phường 01', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (63, N'Phường 03', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (64, N'Phường 11', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (65, N'Phường 07', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (66, N'Phường 05', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (67, N'Phường 10', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (68, N'Phường 06', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (69, N'Phường 08', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (70, N'Phường 09', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (71, N'Phường 14', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (72, N'Phường 15', 5)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (73, N'Phường Tân Sơn Nhì', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (74, N'Phường Tây Thạnh', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (75, N'Phường Sơn Kỳ', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (76, N'Phường Tân Quý', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (77, N'Phường Tân Thành', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (78, N'Phường Phú Thọ Hòa', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (79, N'Phường Phú Thạnh', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (80, N'Phường Phú Trung', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (81, N'Phường Hòa Thạnh', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (82, N'Phường Hiệp Tân', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (83, N'Phường Tân Thới Hòa', 6)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (84, N'Phường 04', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (85, N'Phường 05', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (86, N'Phường 09', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (87, N'Phường 07', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (88, N'Phường 03', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (89, N'Phường 01', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (90, N'Phường 02', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (91, N'Phường 08', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (92, N'Phường 15', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (93, N'Phường 10', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (94, N'Phường 11', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (95, N'Phường 17', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (96, N'Phường 13', 7)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (97, N'Phường Linh Xuân', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (98, N'Phường Bình Chiểu', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (99, N'Phường Linh Trung', 8)
GO
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (100, N'Phường Tam Bình', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (101, N'Phường Tam Phú', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (102, N'Phường Hiệp Bình Phước', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (103, N'Phường Hiệp Bình Chánh', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (104, N'Phường Linh Chiểu', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (105, N'Phường Linh Tây', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (106, N'Phường Linh Đông', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (107, N'Phường Bình Thọ', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (108, N'Phường Trường Thọ', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (109, N'Phường Long Bình', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (110, N'Phường Long Thạnh Mỹ', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (111, N'Phường Tân Phú', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (112, N'Phường Hiệp Phú', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (113, N'Phường Tăng Nhơn Phú A', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (114, N'Phường Tăng Nhơn Phú B', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (115, N'Phường Phước Long B', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (116, N'Phường Phước Long A', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (117, N'Phường Trường Thạnh', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (118, N'Phường Long Phước', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (119, N'Phường Long Trường', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (120, N'Phường Phước Bình', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (121, N'Phường Phú Hữu', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (122, N'Phường Thảo Điền', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (123, N'Phường An Phú', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (124, N'Phường An Khánh', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (125, N'Phường Bình Trưng Đông', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (126, N'Phường Bình Trưng Tây', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (127, N'Phường Cát Lái', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (128, N'Phường Thạnh Mỹ Lợi', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (129, N'Phường An Lợi Đông', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (130, N'Phường Thủ Thiêm', 8)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (131, N'Phường 14', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (132, N'Phường 12', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (133, N'Phường 11', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (134, N'Phường 13', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (135, N'Phường Võ Thị Sáu', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (136, N'Phường 09', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (137, N'Phường 10', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (138, N'Phường 04', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (139, N'Phường 05', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (140, N'Phường 03', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (141, N'Phường 02', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (142, N'Phường 01', 9)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (143, N'Phường 15', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (144, N'Phường 13', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (145, N'Phường 14', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (146, N'Phường 12', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (147, N'Phường 11', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (148, N'Phường 10', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (149, N'Phường 09', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (150, N'Phường 01', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (151, N'Phường 08', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (152, N'Phường 02', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (153, N'Phường 04', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (154, N'Phường 07', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (155, N'Phường 05', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (156, N'Phường 06', 10)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (157, N'Phường 15', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (158, N'Phường 05', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (159, N'Phường 14', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (160, N'Phường 11', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (161, N'Phường 03', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (162, N'Phường 10', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (163, N'Phường 13', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (164, N'Phường 08', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (165, N'Phường 09', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (166, N'Phường 12', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (167, N'Phường 07', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (168, N'Phường 06', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (169, N'Phường 04', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (170, N'Phường 01', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (171, N'Phường 02', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (172, N'Phường 16', 11)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (173, N'Phường 13', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (174, N'Phường 09', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (175, N'Phường 06', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (176, N'Phường 08', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (177, N'Phường 10', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (178, N'Phường 18', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (179, N'Phường 14', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (180, N'Phường 04', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (181, N'Phường 03', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (182, N'Phường 16', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (183, N'Phường 02', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (184, N'Phường 15', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (185, N'Phường 01', 12)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (186, N'Phường 04', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (187, N'Phường 09', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (188, N'Phường 03', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (189, N'Phường 12', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (190, N'Phường 02', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (191, N'Phường 08', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (192, N'Phường 07', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (193, N'Phường 01', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (194, N'Phường 11', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (195, N'Phường 14', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (196, N'Phường 05', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (197, N'Phường 06', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (198, N'Phường 10', 13)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (199, N'Phường 13', 13)
GO
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (200, N'Phường 14', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (201, N'Phường 13', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (202, N'Phường 09', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (203, N'Phường 06', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (204, N'Phường 12', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (205, N'Phường 05', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (206, N'Phường 11', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (207, N'Phường 02', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (208, N'Phường 01', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (209, N'Phường 04', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (210, N'Phường 08', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (211, N'Phường 03', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (212, N'Phường 07', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (213, N'Phường 10', 14)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (214, N'Phường 08', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (215, N'Phường 02', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (216, N'Phường 01', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (217, N'Phường 03', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (218, N'Phường 11', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (219, N'Phường 09', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (220, N'Phường 10', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (221, N'Phường 04', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (222, N'Phường 13', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (223, N'Phường 12', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (224, N'Phường 05', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (225, N'Phường 14', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (226, N'Phường 06', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (227, N'Phường 15', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (228, N'Phường 16', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (229, N'Phường 07', 15)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (230, N'Phường Bình Hưng Hòa', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (231, N'Phường Bình Hưng Hoà A', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (232, N'Phường Bình Hưng Hoà B', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (233, N'Phường Bình Trị Đông', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (234, N'Phường Bình Trị Đông A', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (235, N'Phường Bình Trị Đông B', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (236, N'Phường Tân Tạo', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (237, N'Phường Tân Tạo A', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (238, N'Phường An Lạc', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (239, N'Phường An Lạc A', 16)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (240, N'Phường Tân Thuận Đông', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (241, N'Phường Tân Thuận Tây', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (242, N'Phường Tân Kiểng', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (243, N'Phường Tân Hưng', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (244, N'Phường Bình Thuận', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (245, N'Phường Tân Quy', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (246, N'Phường Phú Thuận', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (247, N'Phường Tân Phú', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (248, N'Phường Tân Phong', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (249, N'Phường Phú Mỹ', 17)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (250, N'Thị trấn Củ Chi', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (251, N'Xã Phú Mỹ Hưng', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (252, N'Xã An Phú', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (253, N'Xã Trung Lập Thượng', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (254, N'Xã An Nhơn Tây', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (255, N'Xã Nhuận Đức', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (256, N'Xã Phạm Văn Cội', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (257, N'Xã Phú Hòa Đông', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (258, N'Xã Trung Lập Hạ', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (259, N'Xã Trung An', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (260, N'Xã Phước Thạnh', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (261, N'Xã Phước Hiệp', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (262, N'Xã Tân An Hội', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (263, N'Xã Phước Vĩnh An', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (264, N'Xã Thái Mỹ', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (265, N'Xã Tân Thạnh Tây', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (266, N'Xã Hòa Phú', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (267, N'Xã Tân Thạnh Đông', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (268, N'Xã Bình Mỹ', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (269, N'Xã Tân Phú Trung', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (270, N'Xã Tân Thông Hội', 18)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (271, N'Thị trấn Hóc Môn', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (272, N'Xã Tân Hiệp', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (273, N'Xã Nhị Bình', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (274, N'Xã Đông Thạnh', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (275, N'Xã Tân Thới Nhì', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (276, N'Xã Thới Tam Thôn', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (277, N'Xã Xuân Thới Sơn', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (278, N'Xã Tân Xuân', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (279, N'Xã Xuân Thới Đông', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (280, N'Xã Trung Chánh', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (281, N'Xã Xuân Thới Thượng', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (282, N'Xã Bà Điểm', 19)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (283, N'Thị trấn Tân Túc', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (284, N'Xã Phạm Văn Hai', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (285, N'Xã Vĩnh Lộc A', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (286, N'Xã Vĩnh Lộc B', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (287, N'Xã Bình Lợi', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (288, N'Xã Lê Minh Xuân', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (289, N'Xã Tân Nhựt', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (290, N'Xã Tân Kiên', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (291, N'Xã Bình Hưng', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (292, N'Xã Phong Phú', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (293, N'Xã An Phú Tây', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (294, N'Xã Hưng Long', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (295, N'Xã Đa Phước', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (296, N'Xã Tân Quý Tây', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (297, N'Xã Bình Chánh', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (298, N'Xã Quy Đức', 20)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (299, N'Thị trấn Nhà Bè', 21)
GO
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (300, N'Xã Phước Kiển', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (301, N'Xã Phước Lộc', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (302, N'Xã Nhơn Đức', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (303, N'Xã Phú Xuân', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (304, N'Xã Long Thới', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (305, N'Xã Hiệp Phước', 21)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (306, N'Thị trấn Cần Thạnh', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (307, N'Xã Bình Khánh', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (308, N'Xã Tam Thôn Hiệp', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (309, N'Xã An Thới Đông', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (310, N'Xã Thạnh An', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (311, N'Xã Long Hòa', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (312, N'Xã Lý Nhơn', 22)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (313, N'Phường Hiệp Thành', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (314, N'Phường Phú Lợi', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (315, N'Phường Phú Cường', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (316, N'Phường Phú Hòa', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (317, N'Phường Phú Thọ', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (318, N'Phường Chánh Nghĩa', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (319, N'Phường Định Hoà', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (320, N'Phường Hoà Phú', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (321, N'Phường Phú Mỹ', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (322, N'Phường Phú Tân', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (323, N'Phường Tân An', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (324, N'Phường Hiệp An', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (325, N'Phường Tương Bình Hiệp', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (326, N'Phường Chánh Mỹ', 23)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (327, N'Xã Trừ Văn Thố', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (328, N'Xã Cây Trường II', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (329, N'Thị trấn Lai Uyên', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (330, N'Xã Tân Hưng', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (331, N'Xã Long Nguyên', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (332, N'Xã Hưng Hòa', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (333, N'Xã Lai Hưng', 24)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (334, N'Thị trấn Dầu Tiếng', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (335, N'Xã Minh Hoà', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (336, N'Xã Minh Thạnh', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (337, N'Xã Minh Tân', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (338, N'Xã Định An', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (339, N'Xã Long Hoà', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (340, N'Xã Định Thành', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (341, N'Xã Định Hiệp', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (342, N'Xã An Lập', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (343, N'Xã Long Tân', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (344, N'Xã Thanh An', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (345, N'Xã Thanh Tuyền', 25)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (346, N'Phường Mỹ Phước', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (347, N'Phường Chánh Phú Hòa', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (348, N'Xã An Điền', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (349, N'Xã An Tây', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (350, N'Phường Thới Hòa', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (351, N'Phường Hòa Lợi', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (352, N'Phường Tân Định', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (353, N'Xã Phú An', 26)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (354, N'Thị trấn Phước Vĩnh', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (355, N'Xã An Linh', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (356, N'Xã Phước Sang', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (357, N'Xã An Thái', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (358, N'Xã An Long', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (359, N'Xã An Bình', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (360, N'Xã Tân Hiệp', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (361, N'Xã Tam Lập', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (362, N'Xã Tân Long', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (363, N'Xã Vĩnh Hoà', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (364, N'Xã Phước Hoà', 27)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (365, N'Phường Uyên Hưng', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (366, N'Phường Tân Phước Khánh', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (367, N'Phường Vĩnh Tân', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (368, N'Phường Hội Nghĩa', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (369, N'Phường Tân Hiệp', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (370, N'Phường Khánh Bình', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (371, N'Phường Phú Chánh', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (372, N'Xã Bạch Đằng', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (373, N'Phường Tân Vĩnh Hiệp', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (374, N'Phường Thạnh Phước', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (375, N'Xã Thạnh Hội', 28)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (376, N'Phường Thái Hòa', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (377, N'Phường Thái Hòa', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (378, N'Phường Dĩ An', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (379, N'Phường Tân Bình', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (380, N'Phường Tân Đông Hiệp', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (381, N'Phường Bình An', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (382, N'Phường Bình Thắng', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (383, N'Phường Đông Hòa', 29)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (384, N'Phường An Bình', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (385, N'Phường An Thạnh', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (386, N'Phường Lái Thiêu', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (387, N'Phường Bình Chuẩn', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (388, N'Phường Thuận Giao', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (389, N'Phường An Phú', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (390, N'Phường Hưng Định', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (391, N'Xã An Sơn', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (392, N'Phường Bình Nhâm', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (393, N'Phường Bình Hòa', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (394, N'Phường Vĩnh Phú', 30)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (395, N'Xã Tân Định', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (396, N'Xã Bình Mỹ', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (397, N'Thị trấn Tân Bình', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (398, N'Xã Tân Lập', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (399, N'Thị trấn Tân Thành', 31)
GO
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (400, N'Xã Đất Cuốc', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (401, N'Xã Hiếu Liêm', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (402, N'Xã Lạc An', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (403, N'Xã Tân Mỹ', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (404, N'Xã Thường Tân', 31)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (405, N'Phường Trảng Dài', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (406, N'Phường Tân Phong', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (407, N'Phường Tân Biên', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (408, N'Phường Hố Nai', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (409, N'Phường Tân Hòa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (410, N'Phường Tân Hiệp', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (411, N'Phường Bửu Long', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (412, N'Phường Tân Tiến', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (413, N'Phường Tam Hiệp', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (414, N'Phường Long Bình', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (415, N'Phường Quang Vinh', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (416, N'Phường Tân Mai', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (417, N'Phường Thống Nhất', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (418, N'Phường Trung Dũng', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (419, N'Phường Tam Hòa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (420, N'Phường Hòa Bình', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (421, N'Phường Quyết Thắng', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (422, N'Phường Thanh Bình', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (423, N'Phường Bình Đa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (424, N'Phường An Bình', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (425, N'Phường Bửu Hòa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (426, N'Phường Long Bình Tân', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (427, N'Phường Tân Vạn', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (428, N'Phường Tân Hạnh', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (429, N'Phường Hiệp Hòa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (430, N'Phường Hóa An', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (431, N'Phường An Hòa', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (432, N'Phường Tam Phước', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (433, N'Phường Phước Tân', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (434, N'Xã Long Hưng', 32)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (435, N'Phường Xuân Trung', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (436, N'Phường Xuân Thanh', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (437, N'Phường Xuân Bình', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (438, N'Phường Xuân An', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (439, N'Phường Xuân Hoà', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (440, N'Phường Phú Bình', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (441, N'Xã Bình Lộc', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (442, N'Xã Bảo Quang', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (443, N'Phường Suối Tre', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (444, N'Phường Bảo Vinh', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (445, N'Phường Xuân Lập', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (446, N'Phường Bàu Sen', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (447, N'Xã Bàu Trâm', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (448, N'Phường Xuân Tân', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (449, N'Xã Hàng Gòn', 33)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (450, N'Thị trấn Tân Phú', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (451, N'Xã Dak Lua', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (452, N'Xã Nam Cát Tiên', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (453, N'Xã Phú An', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (454, N'Xã Núi Tượng', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (455, N'Xã Tà Lài', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (456, N'Xã Phú Lập', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (457, N'Xã Phú Sơn', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (458, N'Xã Phú Thịnh', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (459, N'Xã Thanh Sơn', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (460, N'Xã Phú Trung', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (461, N'Xã Phú Xuân', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (462, N'Xã Phú Lộc', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (463, N'Xã Phú Lâm', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (464, N'Xã Phú Bình', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (465, N'Xã Phú Thanh', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (466, N'Xã Trà Cổ', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (467, N'Xã Phú Điền', 34)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (468, N'Thị trấn Vĩnh An', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (469, N'Xã Phú Lý', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (470, N'Xã Trị An', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (471, N'Xã Tân An', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (472, N'Xã Vĩnh Tân', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (473, N'Xã Bình Lợi', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (474, N'Xã Thạnh Phú', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (475, N'Xã Thiện Tân', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (476, N'Xã Tân Bình', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (477, N'Xã Bình Hòa', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (478, N'Xã Mã Đà', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (479, N'Xã Hiếu Liêm', 35)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (480, N'Thị trấn Định Quán', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (481, N'Xã Thanh Sơn', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (482, N'Xã Phú Tân', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (483, N'Xã Phú Vinh', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (484, N'Xã Phú Lợi', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (485, N'Xã Phú Hòa', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (486, N'Xã Ngọc Định', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (487, N'Xã La Ngà', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (488, N'Xã Gia Canh', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (489, N'Xã Phú Ngọc', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (490, N'Xã Phú Cường', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (491, N'Xã Túc Trưng', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (492, N'Xã Phú Túc', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (493, N'Xã Suối Nho', 36)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (494, N'Thị trấn Trảng Bom', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (495, N'Xã Thanh Bình', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (496, N'Xã Cây Gáo', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (497, N'Xã Bàu Hàm', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (498, N'Xã Sông Thao', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (499, N'Xã Sông Trầu', 37)
GO
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (500, N'Xã Đông Hoà', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (501, N'Xã Bắc Sơn', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (502, N'Xã Hố Nai 3', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (503, N'Xã Tây Hoà', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (504, N'Xã Bình Minh', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (505, N'Xã Trung Hoà', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (506, N'Xã Đồi 61', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (507, N'Xã Hưng Thịnh', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (508, N'Xã Quảng Tiến', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (509, N'Xã Giang Điền', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (510, N'Xã An Viễn', 37)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (511, N'Xã Gia Tân 1', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (512, N'Xã Gia Tân 2', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (513, N'Xã Gia Tân 3', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (514, N'Xã Gia Kiệm', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (515, N'Xã Quang Trung', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (516, N'Xã Bàu Hàm 2', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (517, N'Xã Hưng Lộc', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (518, N'Xã Lộ 25', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (519, N'Xã Xuân Thiện', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (520, N'Thị trấn Dầu Giây', 38)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (521, N'Xã Sông Nhạn', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (522, N'Xã Xuân Quế', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (523, N'Xã Nhân Nghĩa', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (524, N'Xã Xuân Đường', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (525, N'Thị trấn Long Giao', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (526, N'Xã Xuân Mỹ', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (527, N'Xã Thừa Đức', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (528, N'Xã Bảo Bình', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (529, N'Xã Xuân Bảo', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (530, N'Xã Xuân Tây', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (531, N'Xã Xuân Đông', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (532, N'Xã Sông Ray', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (533, N'Xã Lâm San', 39)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (534, N'Thị trấn Long Thành', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (535, N'Xã An Phước', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (536, N'Xã Bình An', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (537, N'Xã Long Đức', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (538, N'Xã Lộc An', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (539, N'Xã Bình Sơn', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (540, N'Xã Tam An', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (541, N'Xã Cẩm Đường', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (542, N'Xã Long An', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (543, N'Xã Bàu Cạn', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (544, N'Xã Long Phước', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (545, N'Xã Phước Bình', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (546, N'Xã Tân Hiệp', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (547, N'Xã Phước Thái', 40)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (548, N'Thị trấn Gia Ray', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (549, N'Xã Xuân Bắc', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (550, N'Xã Suối Cao', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (551, N'Xã Xuân Thành', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (552, N'Xã Xuân Thọ', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (553, N'Xã Xuân Trường', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (554, N'Xã Xuân Hòa', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (555, N'Xã Xuân Hưng', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (556, N'Xã Xuân Tâm', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (557, N'Xã Suối Cát', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (558, N'Xã Xuân Hiệp', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (559, N'Xã Xuân Phú', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (560, N'Xã Xuân Định', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (561, N'Xã Bảo Hoà', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (562, N'Xã Lang Minh', 41)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (563, N'Xã Phước Thiền', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (564, N'Xã Long Tân', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (565, N'Xã Đại Phước', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (566, N'Thị trấn Hiệp Phước', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (567, N'Xã Phú Hữu', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (568, N'Xã Phú Hội', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (569, N'Xã Phú Thạnh', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (570, N'Xã Phú Đông', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (571, N'Xã Long Thọ', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (572, N'Xã Vĩnh Thanh', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (573, N'Xã Phước Khánh', 42)
INSERT [dbo].[Ward] ([WardID], [Name], [DistrictID]) VALUES (574, N'Xã Phước An', 42)
SET IDENTITY_INSERT [dbo].[Ward] OFF
GO
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (1, 37)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (3, 39)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (5, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (5, 40)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (6, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (6, 37)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (6, 42)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (7, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (7, 43)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (11, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (13, 44)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (17, 45)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (18, 46)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (20, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (20, 37)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (21, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (23, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (25, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (25, 39)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (28, 36)
INSERT [dbo].[Wishlist] ([ProductID], [AccountID]) VALUES (30, 36)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Account_Email]    Script Date: 6/2/2024 11:59:08 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UK_Account_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Category_Image]    Script Date: 6/2/2024 11:59:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Category_Image] ON [dbo].[Category]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Category_Name]    Script Date: 6/2/2024 11:59:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Category_Name] ON [dbo].[Category]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Feedback_AccountProduct]    Script Date: 6/2/2024 11:59:08 AM ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [UK_Feedback_AccountProduct] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Province_Name]    Script Date: 6/2/2024 11:59:08 AM ******/
ALTER TABLE [dbo].[Province] ADD  CONSTRAINT [UK_Province_Name] UNIQUE NONCLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__Default__5441852A]  DEFAULT ('') FOR [DefaultAddress]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_PostingDate]  DEFAULT (getdate()) FOR [PostingDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ((0)) FOR [StatusOrder]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_PostingDate]  DEFAULT (getdate()) FOR [PostingDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__DefaultAddress] FOREIGN KEY([DefaultAddress])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__DefaultAddress]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Account]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Ward] FOREIGN KEY([WardID])
REFERENCES [dbo].[Ward] ([WardID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Ward]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_Account]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_Province]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Coupon] FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon] ([CouponID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Coupon]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_District] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[District] ([DistrictID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_District]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Account_ID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Account_ID]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [CK_Cart_Quantity] CHECK  (([Quantity]>=(1)))
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [CK_Cart_Quantity]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [CK_Coupon_DateCmp] CHECK  (([PostingDate]<=[ExpiryDate]))
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [CK_Coupon_DateCmp]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [CK_Coupon_Discount] CHECK  (([Discount]>=(0) AND [Discount]<(1)))
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [CK_Coupon_Discount]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [CK_Feedback_RatingStart] CHECK  (([RatingStar]>=(1) AND [RatingStar]<=(5)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [CK_Feedback_RatingStart]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [CK_OrderDetail_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [CK_OrderDetail_Quantity]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Order_Status] CHECK  (([StatusOrder]>=(0) AND [StatusOrder]<=(3)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Order_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_Price]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Quantity] CHECK  (([Quantity]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_Quantity]
GO
/****** Object:  StoredProcedure [dbo].[SP_FindAddressUser]    Script Date: 6/2/2024 11:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SP_FindAddressUser](
	@id as int
)
as
begin
Select AccountID = @id, AddressID from AddressAccount
where AddressAccount.AccountID = @id
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 : chờ xác nhận
1 : đang giao
2 : đã giao
 
3 : đã hủy
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'StatusOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
USE [master]
GO
ALTER DATABASE [DB_Tad] SET  READ_WRITE 
GO
