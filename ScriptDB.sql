USE [master]
GO
/****** Object:  Database [test_DB]    Script Date: 6/29/2021 12:17:22 AM ******/
CREATE DATABASE [test_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test_DB', FILENAME = N'C:\Users\bhy4u\test_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_DB_log', FILENAME = N'C:\Users\bhy4u\test_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [test_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [test_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test_DB] SET  MULTI_USER 
GO
ALTER DATABASE [test_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test_DB] SET QUERY_STORE = OFF
GO
USE [test_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [test_DB]
GO
/****** Object:  Table [dbo].[Concurrent_login_session]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concurrent_login_session](
	[log_sess_id] [int] IDENTITY(1,1) NOT NULL,
	[Hour] [datetime] NOT NULL,
	[Max_concurr_sessions] [int] NOT NULL,
	[sess_id] [int] NOT NULL,
 CONSTRAINT [PK_Concurrent_login_session] PRIMARY KEY CLUSTERED 
(
	[log_sess_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices_registration]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices_registration](
	[Device_reg_id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Month_id] [int] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Registered_users] [int] NOT NULL,
	[Users_reg_id] [int] NOT NULL,
 CONSTRAINT [PK_Devices_registrationn] PRIMARY KEY CLUSTERED 
(
	[Device_reg_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Month]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month](
	[Month_id] [int] IDENTITY(1,1) NOT NULL,
	[Month] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Month] PRIMARY KEY CLUSTERED 
(
	[Month_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Total_accumulated_duration]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Total_accumulated_duration](
	[sess_dur_id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Hour] [int] NOT NULL,
	[Total_session_duration_for_hour] [int] NOT NULL,
	[Total_session_duration] [int] NOT NULL,
 CONSTRAINT [PK_Total_accumulated_duration] PRIMARY KEY CLUSTERED 
(
	[sess_dur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unexpected_logged]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unexpected_logged](
	[unexpected_id] [int] IDENTITY(1,1) NOT NULL,
	[User_name] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Login_TS] [datetime] NOT NULL,
	[logged_id] [int] NOT NULL,
 CONSTRAINT [PK_Unexpected_logged] PRIMARY KEY CLUSTERED 
(
	[unexpected_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_devices_logged]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_devices_logged](
	[logged_id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NOT NULL,
	[Device_Name] [nvarchar](50) NOT NULL,
	[Login_TS] [datetime] NOT NULL,
 CONSTRAINT [PK_Users_devices_logged] PRIMARY KEY CLUSTERED 
(
	[logged_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_registration]    Script Date: 6/29/2021 12:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_registration](
	[User_reg_id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Month_id] [int] NOT NULL,
	[Registered_users] [int] NOT NULL,
 CONSTRAINT [PK_Users_registration_1] PRIMARY KEY CLUSTERED 
(
	[Month_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Concurrent_login_session] ON 

INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (2, CAST(N'2021-07-01T13:00:00.000' AS DateTime), 3, 1)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (3, CAST(N'2021-07-01T14:00:00.000' AS DateTime), 23, 2)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (4, CAST(N'2021-07-01T15:00:00.000' AS DateTime), 19, 3)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (5, CAST(N'2021-07-01T16:00:00.000' AS DateTime), 10, 4)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (7, CAST(N'2021-07-01T17:00:00.000' AS DateTime), 15, 5)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (8, CAST(N'2021-07-01T18:00:00.000' AS DateTime), 22, 6)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (9, CAST(N'2021-07-01T19:00:00.000' AS DateTime), 17, 7)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (10, CAST(N'2021-07-01T20:00:00.000' AS DateTime), 25, 8)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (11, CAST(N'2021-07-01T21:00:00.000' AS DateTime), 35, 9)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (12, CAST(N'2021-07-01T22:00:00.000' AS DateTime), 20, 10)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (13, CAST(N'2021-07-01T23:00:00.000' AS DateTime), 16, 11)
INSERT [dbo].[Concurrent_login_session] ([log_sess_id], [Hour], [Max_concurr_sessions], [sess_id]) VALUES (14, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 12, 12)
SET IDENTITY_INSERT [dbo].[Concurrent_login_session] OFF
GO
SET IDENTITY_INSERT [dbo].[Devices_registration] ON 

INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (1, 2020, 8, N'Laptop', 10, 23)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (2, 2020, 8, N'Mobile phone', 3, 23)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (3, 2020, 9, N'Laptop', 5, 24)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (4, 2020, 10, N'Laptop', 4, 25)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (5, 2020, 10, N'Mobile phone', 3, 25)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (6, 2020, 11, N'Laptop', 6, 26)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (7, 2020, 11, N'Mobile phone', 4, 26)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (8, 2020, 12, N'Laptop', 3, 27)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (9, 2020, 12, N'Mobile phone', 6, 27)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (10, 2021, 1, N'Laptop', 6, 28)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (11, 2021, 1, N'Mobile phone', 3, 28)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (12, 2021, 2, N'Laptop', 6, 29)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (13, 2021, 3, N'Laptop', 8, 30)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (14, 2021, 3, N'Mobile phone', 4, 30)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (15, 2021, 4, N'Laptop', 5, 31)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (16, 2021, 4, N'Mobile phone', 10, 31)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (17, 2021, 5, N'Laptop', 10, 32)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (18, 2021, 5, N'Tablet', 8, 32)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (19, 2021, 6, N'Laptop', 7, 33)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (20, 2021, 6, N'Tablet', 7, 33)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (21, 2021, 7, N'Laptop', 12, 34)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (22, 2021, 7, N'Mobile phone', 10, 34)
INSERT [dbo].[Devices_registration] ([Device_reg_id], [Year], [Month_id], [Type], [Registered_users], [Users_reg_id]) VALUES (23, 2021, 7, N'Tablet', 10, 34)
SET IDENTITY_INSERT [dbo].[Devices_registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Month] ON 

INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (1, N'January')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (2, N'February')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (3, N'March')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (4, N'April')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (5, N'May')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (6, N'June')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (7, N'July')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (8, N'August')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (9, N'September')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (10, N'October')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (11, N'November')
INSERT [dbo].[Month] ([Month_id], [Month]) VALUES (12, N'December')
SET IDENTITY_INSERT [dbo].[Month] OFF
GO
SET IDENTITY_INSERT [dbo].[Total_accumulated_duration] ON 

INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (1, CAST(N'2021-06-29' AS Date), 0, 500, 500)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (2, CAST(N'2021-06-29' AS Date), 1, 342, 842)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (3, CAST(N'2021-06-29' AS Date), 2, 100, 942)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (4, CAST(N'2021-06-29' AS Date), 3, 200, 1042)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (5, CAST(N'2021-06-29' AS Date), 4, 400, 1442)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (6, CAST(N'2021-06-29' AS Date), 5, 350, 1792)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (7, CAST(N'2021-06-29' AS Date), 6, 400, 2192)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (8, CAST(N'2021-06-29' AS Date), 7, 500, 2692)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (9, CAST(N'2021-06-29' AS Date), 8, 354, 3046)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (10, CAST(N'2021-06-29' AS Date), 9, 422, 3468)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (11, CAST(N'2021-06-29' AS Date), 10, 500, 3968)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (12, CAST(N'2021-06-29' AS Date), 11, 200, 4168)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (13, CAST(N'2021-06-29' AS Date), 12, 222, 4390)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (14, CAST(N'2021-06-29' AS Date), 13, 300, 4690)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (15, CAST(N'2021-06-29' AS Date), 14, 200, 4890)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (16, CAST(N'2021-06-29' AS Date), 15, 300, 5190)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (17, CAST(N'2021-06-29' AS Date), 16, 260, 5450)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (18, CAST(N'2021-06-29' AS Date), 17, 1200, 6470)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (19, CAST(N'2021-06-29' AS Date), 18, 2500, 8970)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (20, CAST(N'2021-06-29' AS Date), 19, 2000, 10970)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (21, CAST(N'2021-06-29' AS Date), 20, 1200, 12170)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (22, CAST(N'2021-06-29' AS Date), 21, 850, 13020)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (23, CAST(N'2021-06-29' AS Date), 22, 2473, 15493)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (24, CAST(N'2021-06-29' AS Date), 23, 154, 15643)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (25, CAST(N'2021-06-30' AS Date), 0, 100, 100)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (26, CAST(N'2021-06-30' AS Date), 1, 200, 300)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (27, CAST(N'2021-06-30' AS Date), 2, 350, 650)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (28, CAST(N'2021-06-30' AS Date), 3, 100, 750)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (29, CAST(N'2021-06-30' AS Date), 4, 200, 950)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (30, CAST(N'2021-06-30' AS Date), 5, 250, 1200)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (31, CAST(N'2021-06-30' AS Date), 6, 170, 1370)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (32, CAST(N'2021-06-30' AS Date), 7, 230, 1600)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (33, CAST(N'2021-06-30' AS Date), 8, 300, 1900)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (34, CAST(N'2021-06-30' AS Date), 9, 220, 2120)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (35, CAST(N'2021-06-30' AS Date), 10, 380, 2500)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (36, CAST(N'2021-06-30' AS Date), 11, 450, 2950)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (37, CAST(N'2021-06-30' AS Date), 12, 150, 3100)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (38, CAST(N'2021-06-30' AS Date), 13, 500, 3600)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (39, CAST(N'2021-06-30' AS Date), 14, 400, 4000)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (40, CAST(N'2021-06-30' AS Date), 15, 750, 4750)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (41, CAST(N'2021-06-30' AS Date), 16, 250, 5000)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (42, CAST(N'2021-06-30' AS Date), 17, 222, 5222)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (43, CAST(N'2021-06-30' AS Date), 18, 352, 5574)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (44, CAST(N'2021-06-30' AS Date), 19, 1255, 6829)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (45, CAST(N'2021-06-30' AS Date), 20, 1455, 8284)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (46, CAST(N'2021-06-30' AS Date), 21, 2018, 10302)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (47, CAST(N'2021-06-30' AS Date), 22, 750, 11052)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (48, CAST(N'2021-06-30' AS Date), 23, 1048, 12100)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (49, CAST(N'2021-07-01' AS Date), 0, 450, 450)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (50, CAST(N'2021-07-01' AS Date), 1, 200, 650)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (51, CAST(N'2021-07-01' AS Date), 2, 350, 1000)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (52, CAST(N'2021-07-01' AS Date), 3, 230, 1230)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (53, CAST(N'2021-07-01' AS Date), 4, 470, 1700)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (54, CAST(N'2021-07-01' AS Date), 5, 350, 2050)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (55, CAST(N'2021-07-01' AS Date), 6, 380, 2430)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (56, CAST(N'2021-07-01' AS Date), 7, 270, 2700)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (57, CAST(N'2021-07-01' AS Date), 8, 300, 3000)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (58, CAST(N'2021-07-01' AS Date), 9, 650, 3650)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (59, CAST(N'2021-07-01' AS Date), 10, 1350, 5000)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (60, CAST(N'2021-07-01' AS Date), 11, 2500, 7500)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (61, CAST(N'2021-07-01' AS Date), 12, 3000, 10500)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (62, CAST(N'2021-07-01' AS Date), 13, 3200, 13700)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (63, CAST(N'2021-07-01' AS Date), 14, 1350, 15050)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (64, CAST(N'2021-07-01' AS Date), 15, 1870, 16920)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (65, CAST(N'2021-07-01' AS Date), 16, 2500, 19420)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (66, CAST(N'2021-07-01' AS Date), 17, 1830, 21250)
INSERT [dbo].[Total_accumulated_duration] ([sess_dur_id], [Date], [Hour], [Total_session_duration_for_hour], [Total_session_duration]) VALUES (67, CAST(N'2021-07-01' AS Date), 18, 100, 21350)
SET IDENTITY_INSERT [dbo].[Total_accumulated_duration] OFF
GO
SET IDENTITY_INSERT [dbo].[Unexpected_logged] ON 

INSERT [dbo].[Unexpected_logged] ([unexpected_id], [User_name], [Country], [Login_TS], [logged_id]) VALUES (1, N'John Doe', N'Switzerland', CAST(N'2021-07-01T17:35:18.000' AS DateTime), 1)
INSERT [dbo].[Unexpected_logged] ([unexpected_id], [User_name], [Country], [Login_TS], [logged_id]) VALUES (2, N'Kathy Johnson', N'Turkey', CAST(N'2021-07-01T18:11:23.000' AS DateTime), 3)
INSERT [dbo].[Unexpected_logged] ([unexpected_id], [User_name], [Country], [Login_TS], [logged_id]) VALUES (3, N'Jack Greelish', N'England', CAST(N'2021-07-01T22:10:00.000' AS DateTime), 18)
SET IDENTITY_INSERT [dbo].[Unexpected_logged] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_devices_logged] ON 

INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (1, N'John Doe', N'John''s Laptop', CAST(N'2021-07-01T17:35:18.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (2, N'John Doe', N'John''s Mobile phone', CAST(N'2021-07-01T17:55:47.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (3, N'Kathy Johnson', N'My Macbook', CAST(N'2021-07-01T18:11:23.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (13, N'Kathy Johnson', N'My IPhone', CAST(N'2021-07-01T18:13:26.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (15, N'Jack Yanowski', N'Personal phone', CAST(N'2021-07-01T19:35:00.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (16, N'Tim Newman', N'My Laptop', CAST(N'2021-07-01T20:05:30.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (17, N'Jack Greelish', N'Jack''s Tablet', CAST(N'2021-07-01T21:50:00.000' AS DateTime))
INSERT [dbo].[Users_devices_logged] ([logged_id], [User_Name], [Device_Name], [Login_TS]) VALUES (18, N'Jack Greelish', N'Laptop Asus', CAST(N'2021-07-01T22:10:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users_devices_logged] OFF
GO
SET IDENTITY_INSERT [dbo].[Users_registration] ON 

INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (28, 2021, 1, 9)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (29, 2021, 2, 6)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (31, 2021, 3, 12)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (32, 2021, 4, 15)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (33, 2021, 5, 18)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (34, 2021, 6, 14)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (35, 2021, 7, 32)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (23, 2020, 8, 13)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (24, 2020, 9, 5)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (25, 2020, 10, 7)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (26, 2020, 11, 10)
INSERT [dbo].[Users_registration] ([User_reg_id], [Year], [Month_id], [Registered_users]) VALUES (27, 2020, 12, 9)
SET IDENTITY_INSERT [dbo].[Users_registration] OFF
GO
ALTER TABLE [dbo].[Concurrent_login_session]  WITH CHECK ADD  CONSTRAINT [FK_Concurrent_login_session_Total_accumulated_duration] FOREIGN KEY([sess_id])
REFERENCES [dbo].[Total_accumulated_duration] ([sess_dur_id])
GO
ALTER TABLE [dbo].[Concurrent_login_session] CHECK CONSTRAINT [FK_Concurrent_login_session_Total_accumulated_duration]
GO
ALTER TABLE [dbo].[Devices_registration]  WITH CHECK ADD  CONSTRAINT [FK_Devices_registration_Month] FOREIGN KEY([Month_id])
REFERENCES [dbo].[Month] ([Month_id])
GO
ALTER TABLE [dbo].[Devices_registration] CHECK CONSTRAINT [FK_Devices_registration_Month]
GO
ALTER TABLE [dbo].[Devices_registration]  WITH CHECK ADD  CONSTRAINT [FK_Devices_registration_Users_registration] FOREIGN KEY([Month_id])
REFERENCES [dbo].[Users_registration] ([Month_id])
GO
ALTER TABLE [dbo].[Devices_registration] CHECK CONSTRAINT [FK_Devices_registration_Users_registration]
GO
ALTER TABLE [dbo].[Unexpected_logged]  WITH CHECK ADD  CONSTRAINT [FK_Unexpected_logged_Users_devices_logged] FOREIGN KEY([logged_id])
REFERENCES [dbo].[Users_devices_logged] ([logged_id])
GO
ALTER TABLE [dbo].[Unexpected_logged] CHECK CONSTRAINT [FK_Unexpected_logged_Users_devices_logged]
GO
ALTER TABLE [dbo].[Users_registration]  WITH CHECK ADD  CONSTRAINT [FK_Users_registration_Month] FOREIGN KEY([Month_id])
REFERENCES [dbo].[Month] ([Month_id])
GO
ALTER TABLE [dbo].[Users_registration] CHECK CONSTRAINT [FK_Users_registration_Month]
GO
USE [master]
GO
ALTER DATABASE [test_DB] SET  READ_WRITE 
GO
