USE [master]
GO
/****** Object:  Database [shoes]    Script Date: 11/13/2024 12:30:05 AM ******/
CREATE DATABASE [shoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\shoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [shoes] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoes] SET RECOVERY FULL 
GO
ALTER DATABASE [shoes] SET  MULTI_USER 
GO
ALTER DATABASE [shoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shoes', N'ON'
GO
ALTER DATABASE [shoes] SET QUERY_STORE = ON
GO
ALTER DATABASE [shoes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [shoes]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](255) NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
	[thumbnail] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[orders] [int] NULL,
	[slug] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[post_id] [int] NULL,
	[product_id] [varchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[link] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[size] [bigint] NULL,
	[type] [varchar](255) NULL,
	[created_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
	[note] [nvarchar](255) NULL,
	[price] [bigint] NULL,
	[promotion] [varchar](max) NULL,
	[quantity] [int] NULL,
	[receiver_address] [nvarchar](255) NULL,
	[receiver_name] [nvarchar](255) NULL,
	[receiver_phone] [nvarchar](255) NULL,
	[size] [int] NULL,
	[status] [int] NULL,
	[total_price] [bigint] NULL,
	[buyer] [int] NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
	[product_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[modified_at] [datetime] NULL,
	[published_at] [datetime] NULL,
	[slug] [varchar](max) NULL,
	[status] [int] NULL,
	[thumbnail] [nvarchar](255) NULL,
	[title] [nvarchar](255) NOT NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[image_feedback] [varchar](max) NULL,
	[images] [varchar](max) NULL,
	[modified_at] [datetime] NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [bigint] NULL,
	[sale_price] [bigint] NULL,
	[slug] [varchar](255) NOT NULL,
	[status] [bit] NULL,
	[total_sold] [bigint] NULL,
	[product_view] [int] NULL,
	[brand_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[product_id] [varchar](255) NULL,
	[category_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [varchar](255) NOT NULL,
	[size] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_code] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[discount_type] [int] NULL,
	[discount_value] [bigint] NULL,
	[expired_at] [datetime] NULL,
	[is_active] [bit] NULL,
	[is_public] [bit] NULL,
	[maximum_discount_value] [bigint] NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statistic]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statistic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[created_at] [datetime] NULL,
	[profit] [bigint] NULL,
	[quantity] [int] NULL,
	[sales] [bigint] NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/13/2024 12:30:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[email] [varchar](200) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[modified_at] [datetime] NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](255) NULL,
	[roles] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (1, CAST(N'2024-11-10T23:36:23.307' AS DateTime), NULL, NULL, N'Adidas', 1, N'/media/static/52387f54-881d-458e-97f9-dcf530e3dfd9.png')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (2, CAST(N'2024-11-10T23:36:45.697' AS DateTime), NULL, NULL, N'Converse', 1, N'/media/static/6d33b39e-3471-460c-8572-e0902b2406d5.png')
INSERT [dbo].[brand] ([id], [created_at], [description], [modified_at], [name], [status], [thumbnail]) VALUES (3, CAST(N'2024-11-10T23:41:32.847' AS DateTime), NULL, NULL, N'Li-Ning', 1, N'/media/static/1458d5a0-5c09-4e89-9d9b-d795b9ffb062.jpg')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [orders], [slug], [status]) VALUES (1, CAST(N'2024-11-10T23:38:20.263' AS DateTime), NULL, N'Giày chạy bộ', 0, N'giay-chay-bo', 1)
INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [orders], [slug], [status]) VALUES (2, CAST(N'2024-11-10T23:39:43.483' AS DateTime), NULL, N'Giày thời trang', 0, N'giay-thoi-trang', 1)
INSERT [dbo].[category] ([id], [created_at], [modified_at], [name], [orders], [slug], [status]) VALUES (3, CAST(N'2024-11-10T23:40:09.237' AS DateTime), NULL, N'Giày bóng rổ', 0, N'giay-bong-ro', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([id], [content], [created_at], [post_id], [product_id], [user_id]) VALUES (1, N'đá', CAST(N'2024-11-13T00:05:01.330' AS DateTime), 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[comment] OFF
GO
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'110e76d4-14ff-494f-8a1a-a425701e02e1', CAST(N'2024-11-11T00:00:00.280' AS DateTime), N'/media/static/110e76d4-14ff-494f-8a1a-a425701e02e1.jpg', N'file', 124137, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'1458d5a0-5c09-4e89-9d9b-d795b9ffb062', CAST(N'2024-11-10T23:41:28.800' AS DateTime), N'/media/static/1458d5a0-5c09-4e89-9d9b-d795b9ffb062.jpg', N'file', 65008, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'2fab65f9-d283-4320-9610-9cad1141e0a2', CAST(N'2024-11-10T23:49:16.840' AS DateTime), N'/media/static/2fab65f9-d283-4320-9610-9cad1141e0a2.jpg', N'file', 129005, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'355f4498-0e77-4a09-8006-ea37a34763df', CAST(N'2024-11-12T23:58:38.570' AS DateTime), N'/media/static/355f4498-0e77-4a09-8006-ea37a34763df.jpg', N'file', 167712, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'52387f54-881d-458e-97f9-dcf530e3dfd9', CAST(N'2024-11-10T23:36:17.273' AS DateTime), N'/media/static/52387f54-881d-458e-97f9-dcf530e3dfd9.png', N'file', 3831, N'png', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'6d33b39e-3471-460c-8572-e0902b2406d5', CAST(N'2024-11-10T23:36:40.320' AS DateTime), N'/media/static/6d33b39e-3471-460c-8572-e0902b2406d5.png', N'file', 2689, N'png', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'8e430a5f-d84f-4c5f-b223-13bd79e07a36', CAST(N'2024-11-10T23:49:08.673' AS DateTime), N'/media/static/8e430a5f-d84f-4c5f-b223-13bd79e07a36.jpg', N'file', 96727, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'9cae2742-edd3-4d6a-aa44-70ced2504311', CAST(N'2024-11-10T23:59:46.190' AS DateTime), N'/media/static/9cae2742-edd3-4d6a-aa44-70ced2504311.jpg', N'file', 32726, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'c58dc5ed-50af-40c8-b914-855b675a7783', CAST(N'2024-11-10T23:59:50.383' AS DateTime), N'/media/static/c58dc5ed-50af-40c8-b914-855b675a7783.jpg', N'file', 160929, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'ca95fa50-faa4-4f20-a867-7cf49ab69c89', CAST(N'2024-11-10T23:59:39.773' AS DateTime), N'/media/static/ca95fa50-faa4-4f20-a867-7cf49ab69c89.jpg', N'file', 105502, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'd763511f-cca0-4c9d-8f6d-7a5c286db9d1', CAST(N'2024-11-10T23:49:44.437' AS DateTime), N'/media/static/d763511f-cca0-4c9d-8f6d-7a5c286db9d1.jpg', N'file', 100900, N'jpg', 1)
INSERT [dbo].[images] ([id], [created_at], [link], [name], [size], [type], [created_by]) VALUES (N'dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2', CAST(N'2024-11-10T23:49:02.090' AS DateTime), N'/media/static/dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2.jpg', N'file', 49880, N'jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (1, CAST(N'2024-11-11T00:05:10.080' AS DateTime), CAST(N'2024-11-12T23:52:42.860' AS DateTime), N'asdasd', 1500000, NULL, 1, N'asdasd', N'Đức', N'0345239051', 40, 3, 1400000, 1, 1, 1, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (2, CAST(N'2024-11-11T23:55:31.463' AS DateTime), NULL, N'asdasdsa', 1500000, NULL, 1, N'asdasd', N'Đức', N'0345239051', 37, 5, 1400000, 1, 1, NULL, N'9655JA')
INSERT [dbo].[orders] ([id], [created_at], [modified_at], [note], [price], [promotion], [quantity], [receiver_address], [receiver_name], [receiver_phone], [size], [status], [total_price], [buyer], [created_by], [modified_by], [product_id]) VALUES (3, CAST(N'2024-11-12T00:00:09.587' AS DateTime), NULL, N'jhgjhg', 1500000, NULL, 1, N'jkkjh', N'Đức', N'0345239051', 38, 5, 1400000, 1, 1, NULL, N'9655JA')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [content], [created_at], [description], [modified_at], [published_at], [slug], [status], [thumbnail], [title], [created_by], [modified_by]) VALUES (1, N'<p>Đây là bài viết test</p>', CAST(N'2024-11-12T23:58:44.397' AS DateTime), N'<p>Đây là bài viết test</p>', NULL, CAST(N'2024-11-12T23:58:44.397' AS DateTime), N'bai-viet-test', 1, N'/media/static/355f4498-0e77-4a09-8006-ea37a34763df.jpg', N'Bài viết test', 1, NULL)
SET IDENTITY_INSERT [dbo].[post] OFF
GO
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'9655JA', CAST(N'2024-11-11T00:00:12.130' AS DateTime), N'<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Giày nam Adidas Runfalcon ‘Dark Blue’&nbsp;đã được bày bán trên Sneaker Daily Shop, đừng bỏ lỡ cơ hội sở hữu cho mình một đôi ngay trước khi sold out nhé!</span></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Cập nhật nhanh nhất lịch ra mắt của các mẫu giày mới nhất bằng cách theo dõi&nbsp;<span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Sneaker Daily</span>&nbsp;trên&nbsp;Facebook&nbsp;hoặc&nbsp;Instagram.</span></p><h3 style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 1em; margin-bottom: 1em; line-height: 1.4; font-size: 1.56em; color: rgb(40, 40, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;">Thông tin phát hành adidas Runfalcon ‘Dark Blue’</span></h3><p><divclass="gtx-body" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"></divclass="gtx-body"></p><div style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><divclass="product-footer__details" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thương hiệu:</strong><span>&nbsp;</span>adidas</span></p><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thiết kế:<span>&nbsp;</span></strong><a href="https://sneakerdaily.vn/danh-muc-san-pham/adidas-falcon/" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; color: rgb(40, 40, 40); text-decoration: none; background-color: transparent; outline: 0px; position: relative; display: inline-block; padding: 0.1em 0px; backface-visibility: hidden;">Runfalcon</a></span></p><divclass="product-footer__item" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility;"><p class="product-footer__item-title" style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 28px;"><span style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-family: &quot;times new roman&quot;, times; font-size: 14pt;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Mã sản phẩm:</strong><span>&nbsp;</span>F36201</span></p><p style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 0px; margin-bottom: 0px;"><strong style="box-sizing: border-box; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Xuất xứ:<span>&nbsp;</span></strong>Đức</p></divclass="product-footer__item"></divclass="product-footer__details"></div>', NULL, N'["/media/static/ca95fa50-faa4-4f20-a867-7cf49ab69c89.jpg","/media/static/9cae2742-edd3-4d6a-aa44-70ced2504311.jpg","/media/static/c58dc5ed-50af-40c8-b914-855b675a7783.jpg","/media/static/110e76d4-14ff-494f-8a1a-a425701e02e1.jpg"]', NULL, N'Giày nam Adidas Runfalcon ‘Dark Blue’', 1000000, 1500000, N'giay-nam-adidas-runfalcon-dark-blue', 1, 1, 13, 1)
INSERT [dbo].[product] ([id], [created_at], [description], [image_feedback], [images], [modified_at], [name], [price], [sale_price], [slug], [status], [total_sold], [product_view], [brand_id]) VALUES (N'KeaYXM', CAST(N'2024-11-10T23:49:49.287' AS DateTime), N'<p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="color: rgb(104, 104, 104);">Giày </span><font color="#282828">Li-Ning bóng rổ nam</font><font color="#686868">&nbsp;là một đôi giày chuyên dụng được thiết kế đặc biệt cho các vận động viên nam chơi bóng rổ. Đôi giày này thuộc vào dòng sản phẩm cao cấp của thương hiệu Li-Ning, nổi tiếng với chất lượng và hiệu suất của sản phẩm thể thao.</font></p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Giày có một thiết kế thể thao và mạnh mẽ, mang đến sự tự tin và phong cách cho người mang. Chúng được làm từ chất liệu tổng hợp chất lượng cao, kết hợp với lớp lưới thoáng khí, giúp tăng cường sự thoải mái và đảm bảo sự thông thoáng cho chân trong quá trình chơi bóng rổ.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Một trong những điểm nổi bật của giày Li-Ning là hệ thống đệm tiên tiến. Giày được trang bị công nghệ đệm chất lượng cao, giúp giảm sốc và tăng cường sự thoải mái khi nhảy lên và đạp xuống sàn bóng. Điều này giúp bảo vệ xương và khớp chân, và giúp người chơi có thể di chuyển linh hoạt và thực hiện các động tác nhảy cao, chuyền bóng và cắt giữa trận đấu.</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;">Đế giày được thiết kế để cung cấp độ bám đất tốt và ổn định. Họa tiết và cấu trúc đế giày được tối ưu hóa để cung cấp sự bám dính và độ linh hoạt khi chuyển động nhanh trên sân bóng rổ. Điều này giúp người chơi có sự kiểm soát tốt hơn khi di chuyển và thực hiện các động tác quan trọng trong trận đấu.</p><h3 33:1-33:277"="" style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-top: 1em; margin-bottom: 1em; line-height: 1.4; font-size: 1.56em; color: rgb(40, 40, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif;">Thông tin sản phẩm Giày Li-Ning bóng rổ nam</h3><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thương hiệu:</span>&nbsp;Li-Ning</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 28px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Thiết kế:&nbsp;</span>Li-Ning</p><p style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; margin-bottom: 0px; color: rgb(104, 104, 104); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen-Sans, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;"><span style="-webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; font-weight: bolder;">Xuất xứ:</span>&nbsp;Trung Quốc</p>', NULL, N'["/media/static/dbb90bdf-c4c5-4698-a7fe-b71edc2d31c2.jpg","/media/static/8e430a5f-d84f-4c5f-b223-13bd79e07a36.jpg","/media/static/2fab65f9-d283-4320-9610-9cad1141e0a2.jpg","/media/static/d763511f-cca0-4c9d-8f6d-7a5c286db9d1.jpg"]', NULL, N'Giày Li-Ning bóng rổ nam', 1000000, 1490000, N'giay-li-ning-bong-ro-nam', 1, 0, 1, 3)
GO
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'KeaYXM', 3)
INSERT [dbo].[product_category] ([product_id], [category_id]) VALUES (N'9655JA', 1)
GO
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 37, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 38, 1)
INSERT [dbo].[product_size] ([product_id], [size], [quantity]) VALUES (N'9655JA', 40, 0)
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([id], [coupon_code], [created_at], [discount_type], [discount_value], [expired_at], [is_active], [is_public], [maximum_discount_value], [name]) VALUES (1, N'CHRISMAS2024', CAST(N'2024-11-11T00:02:39.060' AS DateTime), 1, 10, CAST(N'2024-11-14T07:00:00.000' AS DateTime), 1, 1, 100000, N'Sale Giáng sinh')
SET IDENTITY_INSERT [dbo].[promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[statistic] ON 

INSERT [dbo].[statistic] ([id], [created_at], [profit], [quantity], [sales], [order_id]) VALUES (1, CAST(N'2024-11-12T23:52:42.827' AS DateTime), 400000, 1, 1400000, 1)
SET IDENTITY_INSERT [dbo].[statistic] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (1, NULL, NULL, CAST(N'2024-11-10T15:17:24.117' AS DateTime), N'ducpm1206@gmail.com', N'Đức', NULL, N'$2a$12$R03KAwFYiPcSdJgDdKo4L.LEBziDl79h7IHgXceZ4tZl/u.kpdZry', N'034xxxxx51', N'["ADMIN"]', 1)
INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (2, N'sasdasd', NULL, CAST(N'2024-11-11T00:03:14.153' AS DateTime), N'admin@gmail.com', N'Admin', NULL, N'$2a$12$R03KAwFYiPcSdJgDdKo4L.LEBziDl79h7IHgXceZ4tZl/u.kpdZry', N'0345678912', N'["ADMIN"]', 1)
INSERT [dbo].[users] ([id], [address], [avatar], [created_at], [email], [full_name], [modified_at], [password], [phone], [roles], [status]) VALUES (3, NULL, NULL, CAST(N'2024-11-11T00:03:41.120' AS DateTime), N'user@gmail.com', N'User', NULL, N'$2a$12$R03KAwFYiPcSdJgDdKo4L.LEBziDl79h7IHgXceZ4tZl/u.kpdZry', N'0234567891', N'["USER"]', 1)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__images__A2692381D9C8C675]    Script Date: 11/13/2024 12:30:06 AM ******/
ALTER TABLE [dbo].[images] ADD UNIQUE NONCLUSTERED 
(
	[link] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__promotio__ADE5CBB7E8D8437F]    Script Date: 11/13/2024 12:30:06 AM ******/
ALTER TABLE [dbo].[promotion] ADD UNIQUE NONCLUSTERED 
(
	[coupon_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[post] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([buyer])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([modified_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD FOREIGN KEY([modified_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[statistic]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
USE [master]
GO
ALTER DATABASE [shoes] SET  READ_WRITE 
GO
