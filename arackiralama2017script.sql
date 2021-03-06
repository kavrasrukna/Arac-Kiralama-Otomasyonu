USE [master]
GO
/****** Object:  Database [arackiralama]    Script Date: 31.5.2022 20:08:14 ******/
CREATE DATABASE [arackiralama]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'arackiralama', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\arackiralama.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'arackiralama_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\arackiralama_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [arackiralama] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [arackiralama].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [arackiralama] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [arackiralama] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [arackiralama] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [arackiralama] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [arackiralama] SET ARITHABORT OFF 
GO
ALTER DATABASE [arackiralama] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [arackiralama] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [arackiralama] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [arackiralama] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [arackiralama] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [arackiralama] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [arackiralama] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [arackiralama] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [arackiralama] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [arackiralama] SET  ENABLE_BROKER 
GO
ALTER DATABASE [arackiralama] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [arackiralama] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [arackiralama] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [arackiralama] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [arackiralama] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [arackiralama] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [arackiralama] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [arackiralama] SET RECOVERY FULL 
GO
ALTER DATABASE [arackiralama] SET  MULTI_USER 
GO
ALTER DATABASE [arackiralama] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [arackiralama] SET DB_CHAINING OFF 
GO
ALTER DATABASE [arackiralama] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [arackiralama] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [arackiralama] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [arackiralama] SET QUERY_STORE = OFF
GO
USE [arackiralama]
GO
/****** Object:  User [HP_\RÜKNA]    Script Date: 31.5.2022 20:08:14 ******/
CREATE USER [HP_\RÜKNA] FOR LOGIN [HP_\RÜKNA] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [HP_\RÜKNA]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [HP_\RÜKNA]
GO
/****** Object:  Table [dbo].[arabalar1]    Script Date: 31.5.2022 20:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arabalar1](
	[aracno] [int] IDENTITY(1,1) NOT NULL,
	[aracmarka] [nvarchar](max) NOT NULL,
	[aracmodel] [nvarchar](max) NOT NULL,
	[aracozellik] [nvarchar](max) NOT NULL,
	[aracbakimgunu] [nvarchar](max) NOT NULL,
	[arackm] [nvarchar](max) NOT NULL,
	[hgs] [decimal](18, 0) NOT NULL,
	[gunluktutar] [decimal](18, 0) NOT NULL,
	[bayino] [int] NOT NULL,
 CONSTRAINT [PK_arabalar1] PRIMARY KEY CLUSTERED 
(
	[aracno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bayiler1]    Script Date: 31.5.2022 20:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bayiler1](
	[bayino] [int] IDENTITY(1,1) NOT NULL,
	[bayiadi] [nvarchar](max) NOT NULL,
	[bayiyetkilisi] [nvarchar](max) NOT NULL,
	[bayiadres] [nvarchar](max) NOT NULL,
	[bayitelefon] [nvarchar](max) NOT NULL,
	[bayiciro] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_bayiler1] PRIMARY KEY CLUSTERED 
(
	[bayino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanicilar1]    Script Date: 31.5.2022 20:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanicilar1](
	[kullanicino] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciadi] [nvarchar](max) NOT NULL,
	[sifre] [nvarchar](max) NOT NULL,
	[mail] [nvarchar](max) NOT NULL,
	[telefon] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_kullanicilar1] PRIMARY KEY CLUSTERED 
(
	[kullanicino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriler1]    Script Date: 31.5.2022 20:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriler1](
	[musterino] [int] IDENTITY(1,1) NOT NULL,
	[adsoyad] [nvarchar](max) NOT NULL,
	[telefon] [nvarchar](max) NOT NULL,
	[tckimlikno] [nvarchar](max) NOT NULL,
	[ehliyetdurumu] [nvarchar](max) NOT NULL,
	[adres] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_musteriler1] PRIMARY KEY CLUSTERED 
(
	[musterino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[odemeler1]    Script Date: 31.5.2022 20:08:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odemeler1](
	[odemeno] [int] IDENTITY(1,1) NOT NULL,
	[odemetutar] [decimal](18, 0) NOT NULL,
	[odemetarih] [nvarchar](max) NOT NULL,
	[vadefarki] [decimal](18, 0) NOT NULL,
	[musterino] [int] NOT NULL,
	[aracno] [int] NOT NULL,
 CONSTRAINT [PK_odemeler1] PRIMARY KEY CLUSTERED 
(
	[odemeno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[arabalar1] ON 

INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (3, N'fiat', N'Yeni Egea Sedan Easy 1.4 Fire 95 HP', N'manuel ve benzinli', N'pazartesi', N'500', CAST(1500 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (6, N'Renauld', N'Joy 1.0 Sce 65 bg', N'manuel ve benzin', N'salı', N'100', CAST(2000 AS Decimal(18, 0)), CAST(6000 AS Decimal(18, 0)), 4)
INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (8, N'Suzuki', N'Swift 1.2 Dualjet 12V Mild Hybrid CVT GL Techno Otomatik 83 PS 4X2', N'otomatik ve dizel', N'perşembe', N'250', CAST(3000 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), 5)
INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (10, N'Jeep', N'Renegade 1.3 150 hp DDCT Longitude Benzinli 4×2 Otomatik', N'otomatik ve benzinli', N'cuma', N'300', CAST(2300 AS Decimal(18, 0)), CAST(6000 AS Decimal(18, 0)), 6)
INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (14, N'Land Rover ', N'Range Rover SWB Vogue 2.0 PHEV404', N'otomatik ve benzinli', N'pazar', N'200', CAST(4000 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), 8)
INSERT [dbo].[arabalar1] ([aracno], [aracmarka], [aracmodel], [aracozellik], [aracbakimgunu], [arackm], [hgs], [gunluktutar], [bayino]) VALUES (16, N'Land Rover 1', N'Range Rover SWB Vogue 2.0 PHEV404', N'otomatik ve benzinli', N'Pazar', N'200', CAST(3500 AS Decimal(18, 0)), CAST(2500 AS Decimal(18, 0)), 8)
SET IDENTITY_INSERT [dbo].[arabalar1] OFF
GO
SET IDENTITY_INSERT [dbo].[bayiler1] ON 

INSERT [dbo].[bayiler1] ([bayino], [bayiadi], [bayiyetkilisi], [bayiadres], [bayitelefon], [bayiciro]) VALUES (1, N'kavraş', N'rükna kavraş', N'sancaktepe', N'021621569656', CAST(2500 AS Decimal(18, 0)))
INSERT [dbo].[bayiler1] ([bayino], [bayiadi], [bayiyetkilisi], [bayiadres], [bayitelefon], [bayiciro]) VALUES (4, N'şahinler', N'kübra şahin', N'çekmeköy', N'021659569865', CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[bayiler1] ([bayino], [bayiadi], [bayiyetkilisi], [bayiadres], [bayitelefon], [bayiciro]) VALUES (5, N'inallar', N'ali inal ', N'maltepe', N'02165696596', CAST(1500 AS Decimal(18, 0)))
INSERT [dbo].[bayiler1] ([bayino], [bayiadi], [bayiyetkilisi], [bayiadres], [bayitelefon], [bayiciro]) VALUES (6, N'bora', N'bora aktaş', N'sancaktepe', N'(021) 259-6596', CAST(2100 AS Decimal(18, 0)))
INSERT [dbo].[bayiler1] ([bayino], [bayiadi], [bayiyetkilisi], [bayiadres], [bayitelefon], [bayiciro]) VALUES (8, N'ateş', N'anıl ateş', N'üsküdar', N'02125696569', CAST(3000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[bayiler1] OFF
GO
SET IDENTITY_INSERT [dbo].[kullanicilar1] ON 

INSERT [dbo].[kullanicilar1] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (1, N'Rükna', N'1234', N'rukna@gmail.com', N'021256369859')
INSERT [dbo].[kullanicilar1] ([kullanicino], [kullaniciadi], [sifre], [mail], [telefon]) VALUES (6, N'Gülcan', N'1234', N'gulcan@gmail.com', N'(539) 659-8699')
SET IDENTITY_INSERT [dbo].[kullanicilar1] OFF
GO
SET IDENTITY_INSERT [dbo].[musteriler1] ON 

INSERT [dbo].[musteriler1] ([musterino], [adsoyad], [telefon], [tckimlikno], [ehliyetdurumu], [adres]) VALUES (3, N'mehmet öztürk', N'05369569856', N'78965696598', N'var', N'istanbul')
INSERT [dbo].[musteriler1] ([musterino], [adsoyad], [telefon], [tckimlikno], [ehliyetdurumu], [adres]) VALUES (4, N'çetin öz', N'05396598659', N'96596569896', N'var', N'istanbul')
INSERT [dbo].[musteriler1] ([musterino], [adsoyad], [telefon], [tckimlikno], [ehliyetdurumu], [adres]) VALUES (5, N'tuncay aktaş', N'05396598659', N'54986598759', N'yok', N'sancaktepe')
INSERT [dbo].[musteriler1] ([musterino], [adsoyad], [telefon], [tckimlikno], [ehliyetdurumu], [adres]) VALUES (6, N'ayşe çetin', N'05348956895', N'78596589456', N'var', N'ümraniye')
INSERT [dbo].[musteriler1] ([musterino], [adsoyad], [telefon], [tckimlikno], [ehliyetdurumu], [adres]) VALUES (7, N'şevval çelik', N'56985696596', N'56985696596', N'yok', N'üsküdar')
SET IDENTITY_INSERT [dbo].[musteriler1] OFF
GO
SET IDENTITY_INSERT [dbo].[odemeler1] ON 

INSERT [dbo].[odemeler1] ([odemeno], [odemetutar], [odemetarih], [vadefarki], [musterino], [aracno]) VALUES (4, CAST(5000 AS Decimal(18, 0)), N'10.02.2022', CAST(2500 AS Decimal(18, 0)), 3, 3)
INSERT [dbo].[odemeler1] ([odemeno], [odemetutar], [odemetarih], [vadefarki], [musterino], [aracno]) VALUES (5, CAST(2500 AS Decimal(18, 0)), N'05.06.2021', CAST(2000 AS Decimal(18, 0)), 4, 6)
INSERT [dbo].[odemeler1] ([odemeno], [odemetutar], [odemetarih], [vadefarki], [musterino], [aracno]) VALUES (6, CAST(6000 AS Decimal(18, 0)), N'02.01.2022', CAST(3000 AS Decimal(18, 0)), 5, 8)
INSERT [dbo].[odemeler1] ([odemeno], [odemetutar], [odemetarih], [vadefarki], [musterino], [aracno]) VALUES (7, CAST(7000 AS Decimal(18, 0)), N'10.06.2020', CAST(2000 AS Decimal(18, 0)), 6, 10)
INSERT [dbo].[odemeler1] ([odemeno], [odemetutar], [odemetarih], [vadefarki], [musterino], [aracno]) VALUES (8, CAST(4500 AS Decimal(18, 0)), N'06.08.2021', CAST(1000 AS Decimal(18, 0)), 7, 14)
SET IDENTITY_INSERT [dbo].[odemeler1] OFF
GO
/****** Object:  Index [IX_FK_bayilerarabalar]    Script Date: 31.5.2022 20:08:15 ******/
CREATE NONCLUSTERED INDEX [IX_FK_bayilerarabalar] ON [dbo].[arabalar1]
(
	[bayino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_arabalarodemeler]    Script Date: 31.5.2022 20:08:15 ******/
CREATE NONCLUSTERED INDEX [IX_FK_arabalarodemeler] ON [dbo].[odemeler1]
(
	[aracno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_musterilerodemeler]    Script Date: 31.5.2022 20:08:15 ******/
CREATE NONCLUSTERED INDEX [IX_FK_musterilerodemeler] ON [dbo].[odemeler1]
(
	[musterino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[arabalar1]  WITH CHECK ADD  CONSTRAINT [FK_bayilerarabalar] FOREIGN KEY([bayino])
REFERENCES [dbo].[bayiler1] ([bayino])
GO
ALTER TABLE [dbo].[arabalar1] CHECK CONSTRAINT [FK_bayilerarabalar]
GO
ALTER TABLE [dbo].[odemeler1]  WITH CHECK ADD  CONSTRAINT [FK_arabalarodemeler] FOREIGN KEY([aracno])
REFERENCES [dbo].[arabalar1] ([aracno])
GO
ALTER TABLE [dbo].[odemeler1] CHECK CONSTRAINT [FK_arabalarodemeler]
GO
ALTER TABLE [dbo].[odemeler1]  WITH CHECK ADD  CONSTRAINT [FK_musterilerodemeler] FOREIGN KEY([musterino])
REFERENCES [dbo].[musteriler1] ([musterino])
GO
ALTER TABLE [dbo].[odemeler1] CHECK CONSTRAINT [FK_musterilerodemeler]
GO
USE [master]
GO
ALTER DATABASE [arackiralama] SET  READ_WRITE 
GO
