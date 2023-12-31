USE [master]
GO
/****** Object:  Database [FDB08]    Script Date: 2023/9/23 下午 04:31:20 ******/
CREATE DATABASE [FDB08]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FDB08', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB08.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FDB08_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB08_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FDB08] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FDB08].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FDB08] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FDB08] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FDB08] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FDB08] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FDB08] SET ARITHABORT OFF 
GO
ALTER DATABASE [FDB08] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FDB08] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FDB08] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FDB08] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FDB08] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FDB08] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FDB08] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FDB08] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FDB08] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FDB08] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FDB08] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FDB08] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FDB08] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FDB08] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FDB08] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FDB08] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FDB08] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FDB08] SET RECOVERY FULL 
GO
ALTER DATABASE [FDB08] SET  MULTI_USER 
GO
ALTER DATABASE [FDB08] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FDB08] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FDB08] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FDB08] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FDB08] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FDB08] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FDB08', N'ON'
GO
ALTER DATABASE [FDB08] SET QUERY_STORE = ON
GO
ALTER DATABASE [FDB08] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FDB08]
GO
/****** Object:  User [sa5]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Suggestion] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[PhoneNumber] [char](10) NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponMemberRels]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponMemberRels](
	[Id] [int] NOT NULL,
	[CouponId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_CouponMemberRels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Id] [int] NOT NULL,
	[CouponName] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[RedeemedDate] [datetime] NULL,
	[Discount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK__Coupons__384AF1BAA2894F14] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentPosition]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentPosition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentNumber] [int] NOT NULL,
	[PositionNumber] [int] NOT NULL,
	[EmployeeNumber] [int] NULL,
 CONSTRAINT [PK_DepartmentPosition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentNumber] [int] NOT NULL,
	[DepartmentName] [nvarchar](30) NOT NULL,
	[SupervisorEmployeeNumber] [int] NOT NULL,
	[Disable] [bit] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountDetails]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountDetails](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_DiscountDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[Id] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[DiscountAmount] [int] NOT NULL,
	[TagName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
	[EmployeeName] [nvarchar](30) NOT NULL,
	[Gender] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Disable] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FunctionInRoles]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionInRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FunctionsId] [int] NOT NULL,
 CONSTRAINT [PK_FunctionInRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FunctionDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCarts]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_MemberCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Account] [nchar](50) NOT NULL,
	[EncryptedPassword] [varchar](70) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SubTotal] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[DiscountAmount] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderTime] [date] NOT NULL,
	[MemberId] [int] NOT NULL,
	[Total] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionNumber] [int] NOT NULL,
	[PositionName] [nvarchar](30) NOT NULL,
	[Disable] [bit] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[TagId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleEmployee]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[EmployeeNumber] [int] NOT NULL,
 CONSTRAINT [PK_RoleEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RuleBases]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleBases](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RuleBases_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[MemberCartId] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2023/9/23 下午 04:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
	[ParametersX] [int] NULL,
	[ParametersY] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[RuleBasesId] [int] NOT NULL,
 CONSTRAINT [PK_RuleBases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DepartmentPosition] ON 

INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (1, 1, 1, 1)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (2, 1, 2, 2)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (3, 2, 4, 3)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (4, 2, 10, 12)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (7, 2, 13, 28)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (8, 3, 3, 6)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (9, 3, 13, 5)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (10, 3, 10, 10)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (17, 5, 12, 15)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (18, 5, 10, 7)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (20, 5, 13, 9)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (21, 6, 17, 4)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (22, 6, 16, 13)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (25, 1, 5, 24)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (26, 1, 6, 25)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (27, 3, 8, 26)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (28, 3, 9, 27)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (32, 5, 8, 17)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (33, 5, 9, 11)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (34, 6, 13, NULL)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (35, 5, 13, 16)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (36, 6, 17, 18)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (37, 5, 9, 19)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (38, 5, 12, 20)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (39, 5, 10, 22)
INSERT [dbo].[DepartmentPosition] ([Id], [DepartmentNumber], [PositionNumber], [EmployeeNumber]) VALUES (40, 6, 16, 23)
SET IDENTITY_INSERT [dbo].[DepartmentPosition] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (1, 1, N'董事長室', 1, 0)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (2, 2, N'人資部門', 3, 0)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (3, 3, N'財務部門', 6, 0)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (6, 5, N'行政部門', 15, 0)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (8, 6, N'門市部門', 18, 0)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (9, 7, N'國外業務部', 0, 1)
INSERT [dbo].[Departments] ([Id], [DepartmentNumber], [DepartmentName], [SupervisorEmployeeNumber], [Disable]) VALUES (10, 0, N'無', 0, 1)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (1, 1, N'John', 0, N'0912345678', N'123 Main St', CAST(N'1990-05-15' AS Date), 100000, N'john', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (2, 2, N'Jane', 1, N'0987654321', N'456 Elm St', CAST(N'1985-08-20' AS Date), 55000, N'jane', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (3, 3, N'Michael', 0, N'0955123456', N'789 Oak St', CAST(N'1992-03-10' AS Date), 72000, N'michael', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (4, 4, N'Susan', 1, N'0933999888', N'321 Pine St', CAST(N'1988-11-28' AS Date), 48000, N'susan', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (5, 5, N'David', 0, N'0912777888', N'654 Birch St', CAST(N'1987-06-05' AS Date), 52000, N'david', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (6, 6, N'Sarah', 1, N'0967123456', N'789 Elm St', CAST(N'1991-02-14' AS Date), 60000, N'sarah', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (7, 7, N'Robert', 0, N'0988888999', N'234 Oak St', CAST(N'1986-09-22' AS Date), 58000, N'robert', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (8, 8, N'Jessica', 1, N'0955666777', N'567 Pine St', CAST(N'1995-04-01' AS Date), 51000, N'jessica', N'123', 1)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (9, 9, N'Matthew', 0, N'0934123456', N'876 Elm St', CAST(N'1989-07-30' AS Date), 59000, N'matthew', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (10, 10, N'Amanda', 1, N'0912888999', N'123 Birch St', CAST(N'1993-11-15' AS Date), 54000, N'amanda', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (11, 11, N'JamesJr', 0, N'0988777666', N'432 Pine St', CAST(N'1984-03-18' AS Date), 62000, N'jamesjr', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (12, 12, N'Jennifer', 1, N'0966999888', N'789 Oak St', CAST(N'1987-08-27' AS Date), 51000, N'jennifer', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (13, 13, N'William', 0, N'0933788999', N'345 Elm St', CAST(N'1990-12-04' AS Date), 54000, N'william', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (14, 14, N'Emily', 1, N'0912777666', N'876 Main St', CAST(N'1985-05-21' AS Date), 58000, N'emily', N'123', 1)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (15, 15, N'Daniel', 0, N'0988555444', N'654 Oak St', CAST(N'1991-09-08' AS Date), 58000, N'daniel', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (16, 16, N'Emma', 1, N'0977666555', N'234 Pine St', CAST(N'1988-02-17' AS Date), 53000, N'emma', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (17, 17, N'Joseph', 0, N'0966555444', N'567 Elm St', CAST(N'1994-07-26' AS Date), 60000, N'joseph', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (18, 18, N'Olivia', 1, N'0912444222', N'432 Main St', CAST(N'1983-12-12' AS Date), 59000, N'olivia', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (19, 19, N'Christopher', 0, N'0955333444', N'123 Pine St', CAST(N'1993-03-31' AS Date), 56000, N'christopher', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (20, 20, N'Grace', 1, N'0933888777', N'789 Elm St', CAST(N'1995-10-19' AS Date), 52000, N'grace', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (21, 21, N'Andrew', 0, N'0912111222', N'876 Birch St', CAST(N'1987-04-09' AS Date), 58000, N'andrew', N'123', 1)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (22, 22, N'Chloe', 1, N'0988999222', N'345 Oak St', CAST(N'1989-01-07' AS Date), 54000, N'chloe', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (23, 23, N'DavidJr', 0, N'0977888111', N'654 Pine St', CAST(N'1994-06-23' AS Date), 51000, N'davidd', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (24, 24, N'Sophia', 1, N'0933555666', N'432 Elm St', CAST(N'1991-08-14' AS Date), 59000, N'sophia', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (25, 25, N'James', 0, N'0912333444', N'234 Birch St', CAST(N'1988-03-06' AS Date), 62000, N'james', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (26, 26, N'Isabella', 1, N'0988111222', N'567 Main St', CAST(N'1993-10-28' AS Date), 47000, N'isabella', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (27, 27, N'John', 0, N'0966111222', N'987 Oak St', CAST(N'1992-05-24' AS Date), 51000, N'john', N'123', 0)
INSERT [dbo].[Employees] ([Id], [EmployeeNumber], [EmployeeName], [Gender], [PhoneNumber], [Address], [Birthday], [Salary], [Account], [Password], [Disable]) VALUES (28, 28, N'Mia', 1, N'0955444333', N'765 Pine St', CAST(N'1984-09-10' AS Date), 52000, N'mia', N'123', 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[FunctionInRoles] ON 

INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (1, 1, 1)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (2, 1, 2)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (3, 1, 3)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (4, 2, 5)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (5, 2, 6)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (6, 2, 7)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (7, 3, 9)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (8, 3, 10)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (9, 3, 11)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (10, 4, 13)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (11, 4, 14)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (12, 4, 15)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (13, 4, 17)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (14, 4, 18)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (18, 6, 25)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (19, 6, 26)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (20, 6, 27)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (21, 7, 28)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (22, 7, 29)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (23, 8, 19)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (24, 8, 20)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (25, 8, 21)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (26, 9, 2)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (27, 9, 6)
INSERT [dbo].[FunctionInRoles] ([Id], [RoleId], [FunctionsId]) VALUES (28, 9, 29)
SET IDENTITY_INSERT [dbo].[FunctionInRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Functions] ON 

INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (1, N'建立員工資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (2, N'查詢員工資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (3, N'更新員工資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (5, N'建立部門資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (6, N'查詢部門資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (7, N'更新部門資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (9, N'建立職位資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (10, N'查詢職位資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (11, N'更新職位資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (13, N'建立權限群組')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (14, N'查詢權限群組')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (15, N'更新權限群組')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (17, N'查詢權限內的功能')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (18, N'更新權限內的功能')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (19, N'新增功能')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (20, N'查詢功能')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (21, N'更新功能')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (25, N'建立報表')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (26, N'查詢報表')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (27, N'更新報表')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (28, N'更新會員資料')
INSERT [dbo].[Functions] ([Id], [FunctionDescription]) VALUES (29, N'查詢會員資料')
SET IDENTITY_INSERT [dbo].[Functions] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (1, N'Ann', 1, CAST(N'0001-01-01' AS Date), N'0911111111', N'Ann23@ghmai.com                                   ', N'Ann666                                            ', N'B8E0B3431BAEE096364EC857BA8201BCC8462F2739265305E27A9806A2953B9E      ', N'uihewwerff ', 1, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (2, N'BRian', 1, CAST(N'0001-01-01' AS Date), N'0962543262', N'reg@rjkufgh.p9                                    ', N'rijg                                              ', N'BF6694BED31FD1EC3300991793CBBD529BFDDF79F81752124896B86D1A3E0C0B      ', N'ewfter y ', 0, N'434aafda06f5442f8f0dc1381843adf6')
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (3, N'Hiewjoufh ', 0, CAST(N'0001-01-01' AS Date), N'0952165828', N'ewopkf @eiorw[jf                                  ', N'wpokf epwok                                       ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N' wpofiker90 [opfier-0]fio ', 1, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (4, N'Ju', 0, CAST(N'0001-01-01' AS Date), N'0952162421', N'jujuju@gmail.c                                    ', N'jujuju                                            ', N'A416FE08C776D4DC85720B09E2FB93DA411C2CBF0DC737CF27A8CC3035F4213B      ', N'reg rtghrth', 1, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (5, N'whyyyyy', 1, CAST(N'0001-01-01' AS Date), N'0952164844', N'why23@ghmai.com                                   ', N'pfojk                                             ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'ewpofjkweiopfj 9p0', 0, N'2e43a9435c1242f4b3f6c7c0eb1bb61b')
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (6, N'1', 0, CAST(N'0001-01-01' AS Date), N'0952165041', N'111@gmail.com                                     ', N'111                                               ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'11111111111111111111111', 1, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (7, N'123', 0, CAST(N'0001-01-01' AS Date), N'0911111111', N'123                                               ', N'123                                               ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'123', 1, N'')
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (8, N'Hu', 0, CAST(N'0001-01-01' AS Date), N'0952165826', N'sakura86012825@gmail.com                          ', N'huhuhuh                                           ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'kuhfiurehfipu ', 0, N'c91bd87ed12645c99fe1c3a6dd802060')
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (9, N'oidgueiopry', 0, CAST(N'0001-01-01' AS Date), N'0952165826', N'sakura8601281@gmail.com                           ', N'huhuherwuh                                        ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'kuhfiurehfipu ', 1, NULL)
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (10, N'Hi52981', 0, CAST(N'0001-01-01' AS Date), N'0911111111', N'sakura8601281@gmail.com                           ', N'jujujufgdtu                                       ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'uyiutv 7tou7yt o8y 807y', 0, N'042c1174ace549949c158ad007b3b014')
INSERT [dbo].[Members] ([Id], [Name], [Gender], [BirthDate], [PhoneNumber], [Email], [Account], [EncryptedPassword], [Address], [IsConfirmed], [ConfirmCode]) VALUES (11, N'Heiowfhfioruhwjoufh ', 0, CAST(N'0001-01-01' AS Date), N'0952154555', N'sakura8601281@gmail.com                           ', N'rgreg                                             ', N'79FEC16E57AEBFABB2CE0DB947DB5B2936E9DD81A7EC44BE917C8107E848D6DD      ', N'rtgtr4g tergertgt t t45rr ', 0, N'0fe0d91f1bf54162a370051addd4dc95')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (1, 1, N'董事長', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (2, 2, N'副董事長', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (3, 3, N'財務長', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (4, 4, N'人資長', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (5, 5, N'總經理', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (6, 6, N'副總經理', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (7, 7, N'品牌長', 1)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (8, 8, N'經理', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (9, 9, N'副理', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (11, 10, N'行政人員', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (14, 12, N'行政總務', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (15, 13, N'秘書', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (16, 14, N'秘書長', 1)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (19, 16, N'門市人員', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (20, 17, N'門市經理', 0)
INSERT [dbo].[Positions] ([Id], [PositionNumber], [PositionName], [Disable]) VALUES (21, 0, N'無', 1)
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleEmployee] ON 

INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (1, 1, 1)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (2, 1, 2)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (3, 1, 3)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (4, 1, 24)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (5, 1, 25)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (6, 2, 1)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (7, 2, 2)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (10, 3, 1)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (11, 3, 2)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (14, 4, 24)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (15, 4, 25)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (22, 4, 15)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (23, 6, 1)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (24, 6, 2)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (25, 6, 6)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (26, 6, 24)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (27, 6, 25)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (28, 6, 26)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (29, 6, 27)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (30, 7, 24)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (31, 7, 25)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (32, 7, 17)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (33, 7, 19)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (34, 8, 24)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (35, 8, 25)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (36, 8, 15)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (37, 1, 28)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (38, 7, 9)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (39, 2, 15)
INSERT [dbo].[RoleEmployee] ([Id], [RoleId], [EmployeeNumber]) VALUES (40, 3, 15)
SET IDENTITY_INSERT [dbo].[RoleEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (1, N'員工維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (2, N'部門維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (3, N'職位維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (4, N'權限維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (6, N'報表管理群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (7, N'會員維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (8, N'功能維護群組')
INSERT [dbo].[Roles] ([Id], [RoleDescription]) VALUES (9, N'通用功能群組')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
/****** Object:  Index [IX_DepartmentPosition]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DepartmentPosition] ON [dbo].[DepartmentPosition]
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Departments]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Departments] ON [dbo].[Departments]
(
	[DepartmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Employees]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employees] ON [dbo].[Employees]
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Members]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members] ON [dbo].[Members]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Positions]    Script Date: 2023/9/23 下午 04:31:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Positions] ON [dbo].[Positions]
(
	[PositionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupons_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CouponMemberRels]  WITH CHECK ADD  CONSTRAINT [FK_CouponMemberRels_Coupons] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([Id])
GO
ALTER TABLE [dbo].[CouponMemberRels] CHECK CONSTRAINT [FK_CouponMemberRels_Coupons]
GO
ALTER TABLE [dbo].[CouponMemberRels]  WITH CHECK ADD  CONSTRAINT [FK_CouponMemberRels_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[CouponMemberRels] CHECK CONSTRAINT [FK_CouponMemberRels_Members]
GO
ALTER TABLE [dbo].[DepartmentPosition]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentPosition_Departments] FOREIGN KEY([DepartmentNumber])
REFERENCES [dbo].[Departments] ([DepartmentNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DepartmentPosition] CHECK CONSTRAINT [FK_DepartmentPosition_Departments]
GO
ALTER TABLE [dbo].[DepartmentPosition]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentPosition_Employees] FOREIGN KEY([EmployeeNumber])
REFERENCES [dbo].[Employees] ([EmployeeNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DepartmentPosition] CHECK CONSTRAINT [FK_DepartmentPosition_Employees]
GO
ALTER TABLE [dbo].[DepartmentPosition]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentPosition_Positions] FOREIGN KEY([PositionNumber])
REFERENCES [dbo].[Positions] ([PositionNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DepartmentPosition] CHECK CONSTRAINT [FK_DepartmentPosition_Positions]
GO
ALTER TABLE [dbo].[DiscountDetails]  WITH CHECK ADD  CONSTRAINT [FK_DiscountDetails_Discounts] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([Id])
GO
ALTER TABLE [dbo].[DiscountDetails] CHECK CONSTRAINT [FK_DiscountDetails_Discounts]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Orders]
GO
ALTER TABLE [dbo].[FunctionInRoles]  WITH CHECK ADD  CONSTRAINT [FK_FunctionInRoles_Functions] FOREIGN KEY([FunctionsId])
REFERENCES [dbo].[Functions] ([Id])
GO
ALTER TABLE [dbo].[FunctionInRoles] CHECK CONSTRAINT [FK_FunctionInRoles_Functions]
GO
ALTER TABLE [dbo].[FunctionInRoles]  WITH CHECK ADD  CONSTRAINT [FK_FunctionInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[FunctionInRoles] CHECK CONSTRAINT [FK_FunctionInRoles_Roles]
GO
ALTER TABLE [dbo].[MemberCarts]  WITH CHECK ADD  CONSTRAINT [FK_MemberCarts_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[MemberCarts] CHECK CONSTRAINT [FK_MemberCarts_Members]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Members] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Members]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Tags]
GO
ALTER TABLE [dbo].[RoleEmployee]  WITH CHECK ADD  CONSTRAINT [FK_RoleEmployee_Employees] FOREIGN KEY([EmployeeNumber])
REFERENCES [dbo].[Employees] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[RoleEmployee] CHECK CONSTRAINT [FK_RoleEmployee_Employees]
GO
ALTER TABLE [dbo].[RoleEmployee]  WITH CHECK ADD  CONSTRAINT [FK_RoleEmployee_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RoleEmployee] CHECK CONSTRAINT [FK_RoleEmployee_Roles]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_MemberCarts] FOREIGN KEY([MemberCartId])
REFERENCES [dbo].[MemberCarts] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_MemberCarts]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products]
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD  CONSTRAINT [FK_Tags_RuleBases] FOREIGN KEY([RuleBasesId])
REFERENCES [dbo].[RuleBases] ([Id])
GO
ALTER TABLE [dbo].[Tags] CHECK CONSTRAINT [FK_Tags_RuleBases]
GO
USE [master]
GO
ALTER DATABASE [FDB08] SET  READ_WRITE 
GO
