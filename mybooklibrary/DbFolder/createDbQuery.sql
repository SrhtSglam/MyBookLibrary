USE [master]
GO
/****** Object:  Database [mybookDb]    Script Date: 12/18/2024 7:38:52 PM ******/
CREATE DATABASE [mybookDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mybookDb', FILENAME = N'C:\DB\mybookDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mybookDb_log', FILENAME = N'C:\DB\mybookDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mybookDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mybookDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mybookDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mybookDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mybookDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mybookDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mybookDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [mybookDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mybookDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mybookDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mybookDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mybookDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mybookDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mybookDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mybookDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mybookDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mybookDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mybookDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mybookDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mybookDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mybookDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mybookDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mybookDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mybookDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mybookDb] SET RECOVERY FULL 
GO
ALTER DATABASE [mybookDb] SET  MULTI_USER 
GO
ALTER DATABASE [mybookDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mybookDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mybookDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mybookDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mybookDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [mybookDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'mybookDb', N'ON'
GO
ALTER DATABASE [mybookDb] SET QUERY_STORE = OFF
GO
USE [mybookDb]
GO
/****** Object:  User [BILGITAS\STJ067]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE USER [BILGITAS\STJ067] FOR LOGIN [BILGITAS\STJ067] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [BILGITAS\STJ067]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] NOT NULL,
	[UserId] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] NOT NULL,
	[ProductId] [int] NULL,
	[CartId] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Url] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/18/2024 7:38:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1001,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Url] [varchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[Description] [varchar](250) NULL,
	[ImageUrl] [varchar](50) NULL,
	[IsApproved] [bit] NULL,
	[IsHome] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104130445_InitialCreate', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105064000_AddProduct', N'8.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8c066b9c-27ff-4122-b88a-8c0f3c163ffd', N'admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'02cb6192-9cf3-4f11-a30a-6afc21a846ca', N'8c066b9c-27ff-4122-b88a-8c0f3c163ffd')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'02cb6192-9cf3-4f11-a30a-6afc21a846ca', N'admin', N'admin', N'sa', N'SA', N'adminuser@mybooklibrary.com', N'ADMINUSER@MYBOOKLIBRARY.COM', 1, N'AQAAAAIAAYagAAAAEDRg8hjWDAQQ1PqSz2kGQRAaZSshT6Lbhs6rXWOMvraEbKozh4AhmfPmvT4vcsoEsA==', N'3ROJDXQX3UB2AWNCAF3IX6WEOOGZJLDL', N'95f07b13-a071-47f1-bc05-b225107d37d4', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (101, N'Tarih', N'tarih')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (102, N'Edebiyat', N'edebiyat')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (103, N'Araştırma', N'arastirma')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Url]) VALUES (104, N'Din', N'din')
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1001)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1002)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1003)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1004)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1005)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1006)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1007)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1008)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1009)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1010)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1011)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1012)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1013)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1014)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1015)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (101, 1016)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1017)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1018)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1019)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1020)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1021)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1022)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1023)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1024)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (102, 1025)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1026)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1027)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1028)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1029)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1030)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1031)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1032)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1033)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1034)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (103, 1035)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (104, 1036)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (104, 1037)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (104, 1038)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (104, 1039)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1001, N'Book Title 1', N'MBL-100001', CAST(51999.00 AS Decimal(18, 2)), N'Short description of Book Title 1', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1002, N'Book Title 2', N'MBL-100002', CAST(17999.00 AS Decimal(18, 2)), N'Short description of Book Title 2', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1003, N'Book Title 3', N'MBL-100003', CAST(32699.00 AS Decimal(18, 2)), N'Short description of Book Title 3', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1004, N'Book Title 4', N'MBL-100004', CAST(42665.00 AS Decimal(18, 2)), N'Short description of Book Title 4', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1005, N'Book Title 5', N'MBL-100005', CAST(35869.00 AS Decimal(18, 2)), N'Short description of Book Title 5', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1006, N'Book Title 6', N'MBL-100006', CAST(14169.00 AS Decimal(18, 2)), N'Short description of Book Title 6', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1007, N'Book Title 7', N'MBL-100007', CAST(14799.00 AS Decimal(18, 2)), N'Short description of Book Title 7', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1008, N'Book Title 8', N'MBL-100008', CAST(38999.00 AS Decimal(18, 2)), N'Short description of Book Title 8', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1009, N'Book Title 9', N'MBL-100009', CAST(29999.00 AS Decimal(18, 2)), N'Short description of Book Title 9', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1010, N'Book Title 10', N'MBL-100010', CAST(36374.00 AS Decimal(18, 2)), N'Short description of Book Title 10', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1011, N'Book Title 11', N'MBL-100011', CAST(36507.00 AS Decimal(18, 2)), N'Short description of Book Title 11', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1012, N'Book Title 12', N'MBL-100012', CAST(365.00 AS Decimal(18, 2)), N'Short description of Book Title 12', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1013, N'Book Title 13', N'MBL-100013', CAST(28699.00 AS Decimal(18, 2)), N'Short description of Book Title 13', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1014, N'Book Title 14', N'MBL-100014', CAST(34199.00 AS Decimal(18, 2)), N'Short description of Book Title 14', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1015, N'Book Title 15', N'MBL-100015', CAST(8999.00 AS Decimal(18, 2)), N'Short description of Book Title 15', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1016, N'Book Title 16', N'MBL-100016', CAST(8998.00 AS Decimal(18, 2)), N'Short description of Book Title 16', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1017, N'Book Title 17', N'MBL-100017', CAST(1199.00 AS Decimal(18, 2)), N'Short description of Book Title 17', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1018, N'Book Title 18', N'MBL-100018', CAST(1239.00 AS Decimal(18, 2)), N'Short description of Book Title 18', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1019, N'Book Title 19', N'MBL-100019', CAST(3879.00 AS Decimal(18, 2)), N'Short description of Book Title 19', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1020, N'Book Title 20', N'MBL-100020', CAST(26499.00 AS Decimal(18, 2)), N'Short description of Book Title 20', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1021, N'Book Title 21', N'MBL-100021', CAST(189999.00 AS Decimal(18, 2)), N'Short description of Book Title 21', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1022, N'Book Title 22', N'MBL-100022', CAST(2298.00 AS Decimal(18, 2)), N'Short description of Book Title 22', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1023, N'Book Title 23', N'MBL-100023', CAST(2324.00 AS Decimal(18, 2)), N'Short description of Book Title 23', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1024, N'Book Title 24', N'MBL-100024', CAST(499.00 AS Decimal(18, 2)), N'Short description of Book Title 24', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1025, N'Book Title 25', N'MBL-100025', CAST(21069.00 AS Decimal(18, 2)), N'Short description of Book Title 25', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1026, N'Book Title 26', N'MBL-100026', CAST(2739.00 AS Decimal(18, 2)), N'Short description of Book Title 26', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1027, N'Book Title 27', N'MBL-100027', CAST(2919.00 AS Decimal(18, 2)), N'Short description of Book Title 27', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1028, N'Book Title 28', N'MBL-100028', CAST(24999.00 AS Decimal(18, 2)), N'Short description of Book Title 28', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1029, N'Book Title 29', N'MBL-100029', CAST(599.00 AS Decimal(18, 2)), N'Short description of Book Title 29', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1030, N'Book Title 30', N'MBL-100030', CAST(25363.00 AS Decimal(18, 2)), N'Short description of Book Title 30', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1031, N'Book Title 31', N'MBL-100031', CAST(19999.00 AS Decimal(18, 2)), N'Short description of Book Title 31', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1032, N'Book Title 32', N'MBL-100032', CAST(45999.00 AS Decimal(18, 2)), N'Short description of Book Title 32', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1033, N'Book Title 33', N'MBL-100033', CAST(15400.00 AS Decimal(18, 2)), N'Short description of Book Title 33', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1034, N'Book Title 34', N'MBL-100034', CAST(13150.00 AS Decimal(18, 2)), N'Short description of Book Title 34', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1035, N'Book Title 35', N'MBL-100035', CAST(484.00 AS Decimal(18, 2)), N'Short description of Book Title 35', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1036, N'Book Title 36', N'MBL-100036', CAST(1429.00 AS Decimal(18, 2)), N'Short description of Book Title 36', N'b3.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1037, N'Book Title 37', N'MBL-100037', CAST(8199.00 AS Decimal(18, 2)), N'Short description of Book Title 37', N'b1.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1038, N'Book Title 38', N'MBL-100038', CAST(6999.00 AS Decimal(18, 2)), N'Short description of Book Title 38', N'b2.png', 1, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Url], [Price], [Description], [ImageUrl], [IsApproved], [IsHome]) VALUES (1039, N'Book Title 39', N'MBL-100039', CAST(13389.00 AS Decimal(18, 2)), N'Short description of Book Title 39', N'b3.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/18/2024 7:38:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [mybookDb] SET  READ_WRITE 
GO
