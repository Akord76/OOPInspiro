USE [master]
GO
/****** Object:  Database [TestINSPIRO]    Script Date: 1/26/2022 6:22:23 AM ******/
CREATE DATABASE [TestINSPIRO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestINSPIRO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestINSPIRO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestINSPIRO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestINSPIRO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestINSPIRO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestINSPIRO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestINSPIRO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestINSPIRO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestINSPIRO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestINSPIRO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestINSPIRO] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestINSPIRO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestINSPIRO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestINSPIRO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestINSPIRO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestINSPIRO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestINSPIRO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestINSPIRO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestINSPIRO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestINSPIRO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestINSPIRO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestINSPIRO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestINSPIRO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestINSPIRO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestINSPIRO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestINSPIRO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestINSPIRO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestINSPIRO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestINSPIRO] SET RECOVERY FULL 
GO
ALTER DATABASE [TestINSPIRO] SET  MULTI_USER 
GO
ALTER DATABASE [TestINSPIRO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestINSPIRO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestINSPIRO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestINSPIRO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestINSPIRO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestINSPIRO', N'ON'
GO
ALTER DATABASE [TestINSPIRO] SET QUERY_STORE = OFF
GO
USE [TestINSPIRO]
GO
/****** Object:  Table [dbo].[Table_Product]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Product](
	[ProductCode] [nchar](10) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPrice] [float] NULL,
	[ProductStock] [int] NULL,
 CONSTRAINT [PK_Table_Product] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TR_BUY]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TR_BUY](
	[TransNumber] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[DateOfTran] [datetime] NULL,
	[ProductCode] [nchar](10) NULL,
	[PriceSale] [float] NULL,
	[Qty] [int] NULL,
	[Total] [float] NULL,
	[TranStatus] [int] NULL,
 CONSTRAINT [PK_TR_BUY] PRIMARY KEY CLUSTERED 
(
	[TransNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Table_Product] ([ProductCode], [ProductName], [ProductPrice], [ProductStock]) VALUES (N'P001      ', N'Biskuit', 6000, 0)
INSERT [dbo].[Table_Product] ([ProductCode], [ProductName], [ProductPrice], [ProductStock]) VALUES (N'P002      ', N'Chips', 8000, 5)
INSERT [dbo].[Table_Product] ([ProductCode], [ProductName], [ProductPrice], [ProductStock]) VALUES (N'P003      ', N'Oreo', 10000, 5)
INSERT [dbo].[Table_Product] ([ProductCode], [ProductName], [ProductPrice], [ProductStock]) VALUES (N'P004      ', N'Tanggo', 12000, 5)
INSERT [dbo].[Table_Product] ([ProductCode], [ProductName], [ProductPrice], [ProductStock]) VALUES (N'P005      ', N'Cokelat', 15000, 3)
GO
INSERT [dbo].[TR_BUY] ([TransNumber], [DateOfTran], [ProductCode], [PriceSale], [Qty], [Total], [TranStatus]) VALUES (N'217098f4-3b73-4f0b-a449-b29f7b77f5de', CAST(N'2022-01-26T00:00:00.000' AS DateTime), N'P001      ', 6000, 1, 6000, 0)
INSERT [dbo].[TR_BUY] ([TransNumber], [DateOfTran], [ProductCode], [PriceSale], [Qty], [Total], [TranStatus]) VALUES (N'9fa7a298-5f14-4c77-abbd-ea4354db00f4', CAST(N'2022-01-26T00:00:00.000' AS DateTime), N'P004      ', 12000, 1, 12000, 0)
GO
ALTER TABLE [dbo].[TR_BUY] ADD  CONSTRAINT [DF_TR_BUY_TransNumber]  DEFAULT (newid()) FOR [TransNumber]
GO
/****** Object:  StoredProcedure [dbo].[InsertBuy]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBuy]
(
    @Product VARCHAR(50)
)
AS
BEGIN
 --   DECLARE @BuyDate DATE
	--DECLARE @BuyPrice float
 --   SET @BuyDate = GETDATE();
	--SET @BuyPrice = (select ProductPrice from Table_Product where ProductCode=@Product); 
	

	--IF NOT EXISTS(select [ProductCode] from TR_BUY where [ProductCode]=@Product and DateOfTran =@BuyDate)
 --   INSERT INTO TR_BUY ([DateOfTran], [ProductCode], [PriceSale], [Qty], [Total]) VALUES (@BuyDate,@Product,@BuyPrice,1,(@BuyPrice*1) )
    SELECT T.[ProductCode][kode],P.ProductName [Product], [PriceSale], [Qty], [Total]
	FROM TR_BUY T
	JOIN Table_Product P
	ON P.ProductCode=T.ProductCode
	where [TranStatus]=0.;
	
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProduct]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllProduct]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT [ProductCode], [ProductName], [ProductPrice], [ProductStock] from Table_Product
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOneProduct]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectOneProduct]
@pcode nvarchar(10)
AS
BEGIN
	DECLARE @BuyDate DATE
	DECLARE @BuyPrice float
    SET @BuyDate = GETDATE();
	SET @BuyPrice = (select ProductPrice from Table_Product where ProductCode=@pcode); 

	SET NOCOUNT ON;

	SELECT [ProductCode], [ProductName], [ProductPrice], [ProductStock] from Table_Product
	where [ProductCode]=@pcode

	INSERT INTO TR_BUY ([TransNumber],[DateOfTran], [ProductCode], [PriceSale], [Qty], [Total],[TranStatus]) VALUES (default,@BuyDate,@pcode,@BuyPrice,1,(@BuyPrice*1),0 )
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBuy]    Script Date: 1/26/2022 6:22:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBuy]
(
    @Product VARCHAR(50)
)
AS
BEGIN
 --   DECLARE @BuyDate DATE
	DECLARE @ProductStock int
	
	

	--IF NOT EXISTS(select [ProductCode] from TR_BUY where [ProductCode]=@Product and DateOfTran =@BuyDate)
 --   INSERT INTO TR_BUY ([DateOfTran], [ProductCode], [PriceSale], [Qty], [Total]) VALUES (@BuyDate,@Product,@BuyPrice,1,(@BuyPrice*1) )
 update TR_BUY
 set [TranStatus]=1
 where ProductCode=@Product and [TranStatus]=0

 SET @ProductStock = (select ISNULL(ProductStock,0) from Table_Product where ProductCode=@Product); 

 update Table_Product
 set ProductStock=@ProductStock-1
 where ProductCode=@Product

    SELECT T.[ProductCode][kode],P.ProductName [Product], [PriceSale], [Qty], [Total]
	FROM TR_BUY T
	JOIN Table_Product P
	ON P.ProductCode=T.ProductCode
	where [TranStatus]=1;
	
END
GO
USE [master]
GO
ALTER DATABASE [TestINSPIRO] SET  READ_WRITE 
GO
