USE [master]
GO
/****** Object:  Database [Assignment2_HuynhAnhVu]    Script Date: 2/6/2021 7:16:50 PM ******/
CREATE DATABASE [Assignment2_HuynhAnhVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2_HuynhAnhVu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_HuynhAnhVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_HuynhAnhVu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_HuynhAnhVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2_HuynhAnhVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET QUERY_STORE = OFF
GO
USE [Assignment2_HuynhAnhVu]
GO
/****** Object:  Table [dbo].[tblQuestionChoices]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestionChoices](
	[choiceID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NULL,
	[isRight] [bit] NOT NULL,
	[answer] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[choiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestions]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestions](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[questionName] [varchar](max) NOT NULL,
	[subjectID] [varchar](20) NULL,
	[createDate] [date] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizDetail]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizDetail](
	[quizDetailID] [int] IDENTITY(1,1) NOT NULL,
	[quizID] [int] NULL,
	[userAnswer] [int] NULL,
	[questionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizs]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizs](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](320) NULL,
	[subjectID] [varchar](20) NULL,
	[quizDate] [datetime] NOT NULL,
	[numOfQuestion] [int] NOT NULL,
	[numOfCorrect] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubjects]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubjects](
	[subjectID] [varchar](20) NOT NULL,
	[subjectName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 2/6/2021 7:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[fullName] [varchar](50) NOT NULL,
	[email] [varchar](320) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[roleID] [varchar](10) NULL,
	[status] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblQuestionChoices] ON 

INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (1, 1, 1, N'speeding up the operation and processing of the computer.')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (2, 1, 0, N' the cache is responsible for slowing down computer operations and processing.')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (3, 1, 0, N'storing most of the computer''s data.')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (4, 1, 0, N'restoring the original settings of the computer.')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (5, 2, 1, N'Access time is fixed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (6, 2, 0, N'Access time is variable')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (7, 2, 0, N'Memory is organized into units of data called records')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (8, 2, 0, N'Access must be made in a specific linear sequence')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (9, 3, 1, N'How much? How fast? How expensive?')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (10, 3, 0, N'How much? How far? How expensive?')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (11, 3, 0, N'How much? How long? How expensive?')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (12, 3, 0, N'How many? How fast? How expensive?')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (13, 4, 1, N'Registers, cache, main memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (14, 4, 0, N'Registers, cache, DVD-RAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (15, 4, 0, N'CD-ROM, cache, main memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (16, 4, 0, N'Registers, cache, magnetic tape')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (17, 5, 1, N'Read Address')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (18, 5, 0, N'Read Assignments')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (19, 5, 0, N'Remember Address')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (20, 5, 0, N'Remember Assignments')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (21, 6, 1, N'Information decays naturally or is lost when electrical power is switched off')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (22, 6, 0, N'May be either volatile or nonvolatile')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (23, 6, 0, N'Once recorded, information remains without deterioration until deliberately changed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (24, 6, 0, N'A place to store all computer data')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (25, 7, 1, N'Location')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (26, 7, 0, N'Access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (27, 7, 0, N'Hierarchy')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (28, 7, 0, N'Tag')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (29, 8, 1, N'Disk cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (30, 8, 0, N'Latency')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (31, 8, 0, N'Virtual address')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (32, 8, 0, N'Miss')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (33, 9, 1, N'to minimize the average time in accessing data in main memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (34, 9, 0, N'to minimize the average time in processing information of the CPU')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (35, 9, 0, N'to increase the capacity of main memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (36, 9, 0, N'to increase the efficiency of the graphics processor')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (37, 10, 1, N'Tag')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (38, 10, 0, N'Cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (39, 10, 0, N'Hit')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (40, 10, 0, N'Locality')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (41, 11, 1, N'Split cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (42, 11, 0, N'Logical cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (43, 11, 0, N'Unified cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (44, 11, 0, N'Physical cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (45, 12, 1, N'Virtual addresses')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (46, 12, 0, N'Physical addresses')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (47, 12, 0, N'Random addresses')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (48, 12, 0, N'None of the above')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (49, 13, 1, N'Miss')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (50, 13, 0, N'Hit')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (51, 13, 0, N'Line')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (52, 13, 0, N'Tag')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (53, 14, 1, N'Write through')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (54, 14, 0, N'Write back')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (55, 14, 0, N'LRU')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (56, 14, 0, N'Unified cache')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (57, 15, 1, N'Direct mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (58, 15, 0, N'Associative mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (59, 15, 0, N'Set associative mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (60, 15, 0, N'None of the above')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (61, 16, 1, N'Memory cycle time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (62, 16, 0, N'Latency')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (63, 16, 0, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (64, 16, 0, N'Transfer rate')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (65, 17, 1, N'Word transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (66, 17, 0, N'Block transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (67, 17, 0, N'Set transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (68, 17, 0, N'Associative transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (69, 18, 1, N'Access time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (70, 18, 0, N'Memory cycle time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (71, 18, 0, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (72, 18, 0, N'Transfer rate')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (73, 19, 1, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (74, 19, 0, N'Physical access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (75, 19, 0, N'Associative')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (76, 19, 0, N'Sequential access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (77, 20, 1, N'Bytes')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (78, 20, 0, N'Hertz')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (79, 20, 0, N'Nanos')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (80, 20, 0, N'LOR')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (81, 21, 1, N'Buffer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (82, 21, 0, N'Flash memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (83, 21, 0, N'Hamming code')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (84, 21, 0, N'RamBus')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (85, 22, 1, N'800 to 1600')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (86, 22, 0, N'600 to 1200')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (87, 22, 0, N'1000 to 2000')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (88, 22, 0, N'1500 to 3000')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (89, 23, 1, N'200 to 600')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (90, 23, 0, N'400 to 1066')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (91, 23, 0, N'600 to 1400')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (92, 23, 0, N'800 to 1600')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (93, 24, 1, N'RDRAM > DDR > SDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (94, 24, 0, N'SDRAM > RDRAM > DDR')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (95, 24, 0, N'SDRAM > DDR > RDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (96, 24, 0, N'RDRAM > SDRAM > DDR')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (97, 25, 1, N'DDR3')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (98, 25, 0, N'CDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (99, 25, 0, N'RDRAM')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (100, 25, 0, N'All of the above')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (101, 26, 1, N'DDR2')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (102, 26, 0, N'RDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (103, 26, 0, N'CDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (104, 26, 0, N'DDR3')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (105, 27, 1, N'Linux, NetWare, UNIX, Windows')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (106, 27, 0, N'Linux, Macintosh, MS-DOS, Windows 2000/XP')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (107, 27, 0, N'IBM OS/390, UNIX')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (108, 27, 0, N'IRIX, UNICOS')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (109, 28, 1, N'DDR2')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (110, 28, 0, N'RDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (111, 28, 0, N'CDRAM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (112, 28, 0, N'DDR3')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (113, 29, 1, N'Direct mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (114, 29, 0, N'Associative mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (115, 29, 0, N'Set associative mapping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (116, 29, 0, N'None of the above')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (117, 30, 1, N'Memory cycle time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (118, 30, 0, N'Latency')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (119, 30, 0, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (120, 30, 0, N'Transfer rate')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (121, 31, 1, N'Word transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (122, 31, 0, N'Block transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (123, 31, 0, N'Set transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (124, 31, 0, N'Associative transfer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (125, 32, 1, N'Access time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (126, 32, 0, N'Memory cycle time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (127, 32, 0, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (128, 32, 0, N'Transfer rate')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (129, 33, 1, N'Direct access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (130, 33, 0, N'Associative')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (131, 33, 0, N'Physical access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (132, 33, 0, N'Sequential access')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (133, 34, 1, N'Linux, NetWare, UNIX, Windows')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (134, 34, 0, N'Linux, Macintosh, MS-DOS, Windows 2000/XP')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (135, 34, 0, N'IBM OS/390, UNIX')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (136, 34, 0, N'IRIX, UNICOS')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (137, 35, 1, N'Embedded')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (138, 35, 0, N'Real-time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (139, 35, 0, N'Hybrid')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (140, 35, 0, N'Interactive')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (141, 36, 1, N'kernel')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (142, 36, 0, N'center')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (143, 36, 0, N'manager')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (144, 36, 0, N'core')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (145, 37, 1, N'thread')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (146, 37, 0, N'miniprocess')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (147, 37, 0, N'program')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (148, 37, 0, N'subprocess')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (149, 38, 1, N'No preemption')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (150, 38, 0, N'Mutual exclusion')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (151, 38, 0, N'Resource holding')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (152, 38, 0, N'Circular wait')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (153, 39, 1, N'Mutual exclusion')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (154, 39, 0, N'Circular wait')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (155, 39, 0, N'No preemption')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (156, 39, 0, N'Resource holding')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (157, 40, 1, N'multiprocessing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (158, 40, 0, N'shared processing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (159, 40, 0, N'divided processing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (160, 40, 0, N'uniprocessing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (161, 41, 1, N'synchronization')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (162, 41, 0, N'processing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (163, 41, 0, N'communication')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (164, 41, 0, N'math')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (165, 42, 1, N'critical region')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (166, 42, 0, N'segment')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (167, 42, 0, N'semaphore')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (168, 42, 0, N'line')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (169, 43, 1, N'starvation')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (170, 43, 0, N'synchronization')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (171, 43, 0, N'deadlock')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (172, 43, 0, N'an error')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (173, 44, 1, N'SIGNAL')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (174, 44, 0, N'TS')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (175, 44, 0, N'STOP')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (176, 44, 0, N'WAIT')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (177, 45, 1, N'P and V')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (178, 45, 0, N'test and set')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (179, 45, 0, N'WAIT and SIGNAL')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (180, 45, 0, N'check and update')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (181, 46, 1, N'0')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (182, 46, 0, N'-100')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (183, 46, 0, N'100')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (184, 46, 0, N'9999')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (185, 47, 1, N'mutual exclusion')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (186, 47, 0, N'signal exclusion')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (187, 47, 0, N'mutual execution')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (188, 47, 0, N'mutex execution')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (189, 48, 1, N'Three')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (190, 48, 0, N'Two')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (191, 48, 0, N'One')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (192, 48, 0, N'Four')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (193, 49, 1, N'Courtois')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (194, 49, 0, N'Parnas')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (195, 49, 0, N'Heymans')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (196, 49, 0, N'Hoare')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (197, 50, 1, N'data area')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (198, 50, 0, N'processor registers')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (199, 50, 0, N'program counter')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (200, 50, 0, N'status')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (201, 51, 1, N'Variable time quantum per queue')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (202, 51, 0, N'No movement between queues')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (203, 51, 0, N'Aging')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (204, 51, 0, N'Movement between queues')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (205, 52, 1, N'High-priority')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (206, 52, 0, N'Moving-priority')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (207, 52, 0, N'Variable-priority')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (208, 52, 0, N'Low-priority')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (209, 53, 1, N'virtual memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (210, 53, 0, N'virtual paging')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (211, 53, 0, N'memory demand')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (212, 53, 0, N'virtual demand')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (213, 54, 1, N'FIFO')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (214, 54, 0, N'TRU')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (215, 54, 0, N'LRU')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (216, 54, 0, N'LIFO')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (217, 55, 1, N'pages')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (218, 55, 0, N'blocks')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (219, 55, 0, N'sets')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (220, 55, 0, N'frames')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (221, 56, 1, N'overlays')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (222, 56, 0, N'overmaps')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (223, 56, 0, N'undermaps')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (224, 56, 0, N'underlays')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (225, 57, 1, N'None of others')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (226, 57, 0, N'coordinate how the different types of memory are used')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (227, 57, 0, N'manage swapping between main memory and disk, when main memory is to small to hold all the processes')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (228, 57, 0, N'allocate and release areas of main memory to processes')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (229, 58, 1, N'1')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (230, 58, 0, N'3')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (231, 58, 0, N'4')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (232, 58, 0, N'2')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (233, 59, 1, N'2')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (234, 59, 0, N'1')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (235, 59, 0, N'3')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (236, 59, 0, N'4')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (237, 60, 1, N'0')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (238, 60, 0, N'1')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (239, 60, 0, N'5')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (240, 60, 0, N'-1')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (241, 61, 1, N'Each program to be processed was loaded in its entirety into memory and allocated as much contiguous space in memory as it needed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (242, 61, 0, N'Each program to be processed was loaded into secondary storage, then swapped into memory in parts')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (243, 61, 0, N'Each program to be processed was partially loaded into memory, then granted more memory as needed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (244, 61, 0, N'Each program to be processed was allocated a portion of memory and could negotiate with other programs to access more memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (245, 62, 1, N'static')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (246, 62, 0, N'sized')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (247, 62, 0, N'direct')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (248, 62, 0, N'complete')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (249, 63, 1, N'Virtual memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (250, 63, 0, N'Multithreading')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (251, 63, 0, N'Segmenting')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (252, 63, 0, N'Shared memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (253, 64, 1, N'main memory is used more efficiently')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (254, 64, 0, N'multiple programs can run at the same time')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (255, 64, 0, N'every program will be able to run')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (256, 64, 0, N'secondary storage is accessed more quickly')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (257, 65, 1, N'Noncontiguous storage')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (258, 65, 0, N'Add-on storage')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (259, 65, 0, N'Contiguous storage')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (260, 65, 0, N'Fragmented storage')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (261, 66, 1, N'Directories')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (262, 66, 0, N'Data files')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (263, 66, 0, N'Programs')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (264, 66, 0, N'Databases')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (265, 67, 1, N'unstructured sequence of bytes, record sequence, tree')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (266, 67, 0, N'unstructured sequence of bytes, text, tree')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (267, 67, 0, N'unstructured sequence of bytes, random, tree')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (268, 67, 0, N'unstructured sequence of bytes, binary sequence, tree')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (269, 68, 1, N'physical')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (270, 68, 0, N'software')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (271, 68, 0, N'electronic')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (272, 68, 0, N'data')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (273, 69, 1, N'sequential, direct, or indexed sequential')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (274, 69, 0, N'sequential, random, or indirect')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (275, 69, 0, N'indexed direct, indexed indirect, or random')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (276, 69, 0, N'sequential, indirect, or direct')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (277, 70, 1, N'boot block')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (278, 70, 0, N'super block')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (279, 70, 0, N'free block')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (280, 70, 0, N'MBR')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (281, 71, 1, N'file')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (282, 71, 0, N'field')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (283, 71, 0, N'directory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (284, 71, 0, N'record group')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (285, 72, 1, N'identify the directory in which the file is stored')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (286, 72, 0, N'identify the file size')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (287, 72, 0, N'identify the file owner')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (288, 72, 0, N'identify the type of file')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (289, 73, 1, N'folders')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (290, 73, 0, N'volumes')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (291, 73, 0, N'files')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (292, 73, 0, N'databases')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (293, 74, 1, N'file can''t be expanded unless there is empty space available immediately following it')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (294, 74, 0, N'it is difficult to find information in files')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (295, 74, 0, N'it is hard to implement and manage')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (296, 74, 0, N'it is an efficient use of space')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (297, 75, 1, N'Regular, Directories, Character Special, Block Special')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (298, 75, 0, N'Regular, Binary, Character Special, CD-ROM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (299, 75, 0, N'Regular, Directories, Character Special')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (300, 75, 0, N'Regular, Directories, Character Special, Device Driver')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (301, 76, 1, N'hashing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (302, 76, 0, N'grouping')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (303, 76, 0, N'translation')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (304, 76, 0, N'lookup')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (305, 77, 1, N'Comparable interface its compareTo method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (306, 77, 0, N'Comparable interface its compare method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (307, 77, 0, N'Comparable interface its equals method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (308, 77, 0, N'Compare interface its compareTo method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (309, 78, 1, N'java.io.RandomAccessFile')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (310, 78, 0, N'java.io.FileStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (311, 78, 0, N'java.io.File')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (312, 78, 0, N'java.io.FileInputStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (313, 79, 1, N'System.gc();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (314, 79, 0, N'System.free();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (315, 79, 0, N'System.setGarbageCollection();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (316, 79, 0, N'System.out.gc();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (317, 80, 1, N'Comparable')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (318, 80, 0, N'Sortator')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (319, 80, 0, N'Sortable')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (320, 80, 0, N'Comparator')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (321, 81, 1, N'A final object cannot ve reassigned a now address in memory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (322, 81, 0, N'A final object''s data cannot be changed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (323, 81, 0, N'A final class can be subclassed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (324, 81, 0, N'A final method cannot be overloaded')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (325, 82, 1, N'FileOutputStream- ObjectOutputStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (326, 82, 0, N'FileReader - ObjectOutputStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (327, 82, 0, N'File - ObjectOutputStream - FileOutputStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (328, 82, 0, N'File - ObjectOutputStream - Writer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (329, 83, 1, N'createNewFile()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (330, 83, 0, N'newFile()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (331, 83, 0, N'There is no such method. Just do File f = new File ("filename.txt"); then the newfile, named filename.txt will be created')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (332, 83, 0, N'makeNewFile()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (333, 84, 1, N'final')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (334, 84, 0, N'transient')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (335, 84, 0, N'private')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (336, 84, 0, N'static')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (337, 85, 1, N'A method with the same name completely replaces the functionality of a method earlier in the hierarchy')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (338, 85, 0, N'A method with the same name but different parameters gives multiple uses for the same method name')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (339, 85, 0, N'A class is prevented from accessing methods in its immadiate ancestor')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (340, 85, 0, N'A class with the same name replaces the functionality if a class defined earlier in the hierarchy')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (341, 86, 1, N'A protected method may only be accessed by classes or interfaces of the same package or by subclasses of the class in which it is declared')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (342, 86, 0, N'A protected method may only be accessed by classes of the same package or by subclasses of the class in which it is declared')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (343, 86, 0, N'A protected method may only be accessed by the class in which it is declared or by the subclasses of that class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (344, 86, 0, N'A protected method may only be accessed by classes or interfaces of the same package')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (345, 87, 1, N'A collection of one or more statements enclosed in braces')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (346, 87, 0, N'a way of setting the value of a variable')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (347, 87, 0, N'a way of declaring variables')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (348, 87, 0, N'A statement involving if and else')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (349, 88, 1, N'String objects are constants. StringBuffer objects are not')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (350, 88, 0, N'StringBuffer objects are constants. String objects are not')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (351, 88, 0, N'Both String and StringBuffer pbject are constants')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (352, 88, 0, N'Both String and StringBuffer pbject are not constants')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (353, 89, 1, N'In its most common form, an interface is a group of related methods with empty bodies')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (354, 89, 0, N'An interface is an abstract class with no date')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (355, 89, 0, N'An interface is a class that has method implementations with no data')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (356, 89, 0, N'An interface is a class that has at least one abstract method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (357, 90, 1, N'If a checked exception may be thrown within the body of a method, the method must either catch the exception or declare it in its throws clause')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (358, 90, 0, N'If a checked exception may be thrown within the body of a method, the method must catch the exception')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (359, 90, 0, N'If a checked exception may be thrown within the body of a method, the method must declare it in its throwns clause')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (360, 90, 0, N'If a checked exception may be thrown within the body of a method, the method mus tcatch the exception and eclare it in its throws clause')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (361, 91, 1, N'String [] contents = myFile.list();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (362, 91, 0, N'StringBuider [] contents = newFile.list();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (363, 91, 0, N'The File class does not provide a way to list the contents of a directory')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (364, 91, 0, N'File [] contents = myFile.list();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (365, 92, 1, N'attribute')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (366, 92, 0, N'Method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (367, 92, 0, N'Operation')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (368, 92, 0, N'Message')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (369, 93, 1, N'when an Object Output Stream serializes an object that contains references to another object, every references object is not serialized along with the original object')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (370, 93, 0, N'The process of writing an object is called serialization')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (371, 93, 0, N'When an object is serialized, it will probably be deserialized by a different JVM')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (372, 93, 0, N'To serialize an object, firts create an instance to java.io.ObjectOutputStream.')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (373, 94, 1, N'A reference')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (374, 94, 0, N'A class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (375, 94, 0, N'An interface')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (376, 94, 0, N'A variable of primitive type')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (377, 95, 1, N'Math')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (378, 95, 0, N'String')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (379, 95, 0, N'Svstem')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (380, 95, 0, N'Runtime')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (381, 96, 1, N'Comparable interface and its compareTo method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (382, 96, 0, N'Comparable interface and its compare method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (383, 96, 0, N'Comparable interface and its equals method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (384, 96, 0, N'Compare interface and its CompareTo method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (385, 97, 1, N'FileReader')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (386, 97, 0, N'InputStreamReader')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (387, 97, 0, N'FileInputStream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (388, 97, 0, N'FileWriter')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (389, 98, 1, N'public void xyz(float f)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (390, 98, 0, N'public int xyz(float f)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (391, 98, 0, N'private int xyz(float f)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (392, 98, 0, N'private void xyz(float f)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (393, 99, 1, N'Binary high-level stream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (394, 99, 0, N'Binary low-level stream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (395, 99, 0, N'Character stream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (396, 99, 0, N'Object stream')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (397, 100, 1, N'Construction')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (398, 100, 0, N'Polymorphism')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (399, 100, 0, N'Persistence')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (400, 100, 0, N'Data abstraction')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (401, 101, 1, N'All the others')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (402, 101, 0, N'prim = new Integer(9);')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (403, 101, 0, N'prim = wrapped;')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (404, 101, 0, N'wrapped = prim;')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (405, 102, 1, N'bytecode')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (406, 102, 0, N'binary code')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (407, 102, 0, N'machine code')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (408, 102, 0, N'cpu instruction')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (409, 103, 1, N'All methods in an abstract class must be declared as abstract')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (410, 103, 0, N'If a class has any abstract methods it must be declared abstract itself')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (411, 103, 0, N'When applied to a class, the final modifier means it cannot be sub-classed')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (412, 103, 0, N'None of others')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (413, 104, 1, N'To check whether the file denoted by the abstract pathname is a directory or not, call the isDirectory() method of the File class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (414, 104, 0, N'To change the current working directory, call the cd() method of the File class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (415, 104, 0, N'To change the current working directory, call the changeWorkingDirectory() method of the File class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (416, 104, 0, N'To change the current working directory, call the setWorkingDirectory() method of the File class')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (417, 105, 1, N'Unicode characters are all 16 bits')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (418, 105, 0, N'UTF characters are all 16 bits')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (419, 105, 0, N'UTF characters are all 24 bits')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (420, 105, 0, N'Bytecode characters are all 16 bits')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (421, 106, 1, N'java.lang')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (422, 106, 0, N'java.util')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (423, 106, 0, N'java.pack')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (424, 106, 0, N'java.io')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (425, 107, 1, N'All of the methods in an interface are implicitly abstract')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (426, 107, 0, N'A method in an interface can access class level varriables')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (427, 107, 0, N'All of the variables in an interface are implicitly static')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (428, 107, 0, N'All of the variables in an interface are impicitly final')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (429, 108, 1, N'When the type of x is Object')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (430, 108, 0, N'When the tyoe if x is an array')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (431, 108, 0, N'Always')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (432, 108, 0, N'Never')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (433, 109, 1, N'pbulic static void main(String[] args)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (434, 109, 0, N'public static void main()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (435, 109, 0, N'public void main(String [] arg)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (436, 109, 0, N'Public static int main(String [] arg)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (437, 110, 1, N'java.lang.Number')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (438, 110, 0, N'java.lang.Integer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (439, 110, 0, N'java.lang.Wrapper')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (440, 110, 0, N'java.lang.Object')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (441, 111, 1, N'super();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (442, 111, 0, N'makeSuper();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (443, 111, 0, N'call();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (444, 111, 0, N'invokeSuper();')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (445, 112, 1, N'Atribute')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (446, 112, 0, N'Method')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (447, 112, 0, N'Event')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (448, 112, 0, N'Message')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (449, 113, 1, N's.indexOf(''v'');')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (450, 113, 0, N'charAt(2);')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (451, 113, 0, N'indexOf(s,''v'');')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (452, 113, 0, N'mid(2, s);')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (453, 114, 1, N'An object reference can cast to an interface reference when the object implements all methods of the referenced interface')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (454, 114, 0, N'An object reference cannot be cast to an interface reference')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (455, 114, 0, N'An object reference can cast to an interface reference when the object implements the reference interface')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (456, 114, 0, N'An object reference can always be cast to an interface reference')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (457, 115, 1, N'Abstraction')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (458, 115, 0, N'Inheritance')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (459, 115, 0, N'Overloading')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (460, 115, 0, N'Polymorphism')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (461, 116, 1, N'HashSet')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (462, 116, 0, N'HashMap')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (463, 116, 0, N'HashTree')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (464, 116, 0, N'HashList')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (465, 117, 1, N'A class inherits constructors from its supperclasses when the program points out that')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (466, 117, 0, N'A class inherits constructors from its direct superclass only')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (467, 117, 0, N'A class inherits constructors from its superclasses')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (468, 117, 0, N'A class does not inherit constructors from any of ots superclasses')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (469, 118, 1, N'Package declarations, imports, Class/interface/enum definitions')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (470, 118, 0, N'Imports, package declarations, classes/interfaces/enums')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (471, 118, 0, N'Classes/interfaces/enums, Imports, package declarations')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (472, 118, 0, N'Imports must come first; order for package declarations and Class/interface/enum definitions is not significant')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (473, 119, 1, N'exists()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (474, 119, 0, N'isExists()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (475, 119, 0, N'canExists')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (476, 119, 0, N'doExists()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (477, 120, 1, N'Checked exceptions')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (478, 120, 0, N'Errors other than asserition errors')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (479, 120, 0, N'Asserition errors')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (480, 120, 0, N'Runtime exceptions')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (481, 121, 1, N'canRead()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (482, 121, 0, N'checkRead()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (483, 121, 0, N'read()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (484, 121, 0, N'isRead()')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (485, 122, 1, N'Whenever x and y are bytes, shorts, chars or ints')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (486, 122, 0, N'when neither x nor y is a float or a double')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (487, 122, 0, N'Always')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (488, 122, 0, N'Whenever x and y are byte, shorts, chars, ints or longs')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (489, 123, 1, N'Have the class declare that it implements java.io.Serializable. There are no methods in the interface')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (490, 123, 0, N'No interfaces need to be implemented. All class can be serialized')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (491, 123, 0, N'Have the class declare that it implements java.io.Externalizable, which defines two methods: readObject and writeObject')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (492, 123, 0, N'Have the class declare that it implements jave.io.Serializable, which defines two methods: readObject and writeObject')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (493, 124, 1, N'Specification')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (494, 124, 0, N'Iterative development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (495, 124, 0, N'System Testing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (496, 124, 0, N'Design')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (497, 125, 1, N'Waterfall, Iterative development, Component-based software engineering')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (498, 125, 0, N'Waterfall, Iterative development, Agile development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (499, 125, 0, N'Waterfall, Component-based software engineering, Agile development')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (500, 125, 0, N'Waterfall, Iterative development, Extreme programming development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (501, 126, 1, N'A simplified representation of a software process, presented from a specific perspective')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (502, 126, 0, N'A simplified representation in a waterfall')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (503, 126, 0, N'A simplified representation in a step by step of a software process')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (504, 126, 0, N'A simplified representation in a cycle of a software process')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (505, 127, 1, N'Integration and testing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (506, 127, 0, N'Design')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (507, 127, 0, N'Specification')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (508, 127, 0, N'Development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (509, 128, 1, N'A set of activities whose goal is the development or evolution of software')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (510, 128, 0, N'A set of steps whose goal is the development or evolution of software')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (511, 128, 0, N'A set of models whose goal is the development or evolution of software')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (512, 128, 0, N'A set of cycles whose goal is the development or evolution of software')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (513, 129, 1, N'Specification')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (514, 129, 0, N'Development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (515, 129, 0, N'Integration and testing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (516, 129, 0, N'Design')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (517, 130, 1, N'Specification')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (518, 130, 0, N'Design')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (519, 130, 0, N'Development')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (520, 130, 0, N'Integration and testing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (521, 131, 1, N'The heterogeneity challenge, the delivery challenge, the trust challenge')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (522, 131, 0, N'The heterogeneity challenge, the trust challenge, the life time challenge')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (523, 131, 0, N'The delivery challenge, the trust challenge, the life time challenge')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (524, 131, 0, N'The heterogeneity challenge, the delivery challenge, the life time challenge')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (525, 132, 1, N'The explicit recognition of risk in the Spiral model')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (526, 132, 0, N'The goal of Objective setting phase')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (527, 132, 0, N'The goal of Development and validation phase')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (528, 132, 0, N'The goal of Planning phase')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (529, 133, 1, N'Report that recommends whether or not to continue development project')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (530, 133, 0, N'User requirement document')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (531, 133, 0, N'Stakeholders list')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (532, 133, 0, N'Project plan')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (533, 134, 1, N'Dynamic perspective, Static perspective, Practice perspective')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (534, 134, 0, N'Dynamic perspective, Static perspective, Deployment perspective')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (535, 134, 0, N'Dynamic perspective, Static perspective, Behavior perspective')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (536, 134, 0, N'Dynamic perspective, Static perspective, Iterative perspective')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (537, 135, 1, N'Phase are more closely related to business rather than technical concerns')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (538, 135, 0, N'The goal of Inception phase')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (539, 135, 0, N'The construction phase is essentially concerned with system design, programming and testing')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (540, 135, 0, N'System design with re-use')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (541, 136, 1, N'The software system is large and that is need developed at several sites')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (542, 136, 0, N'Adding some new features to a system')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (543, 136, 0, N'Un-stable requirement systems')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (544, 136, 0, N'The software system is small, unclear requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (545, 137, 1, N'Because the requirements of software projects are not the same')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (546, 137, 0, N'Because the requirements of software projects should document in multi languages')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (547, 137, 0, N'Because the requirements of software projects are the same')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (548, 137, 0, N'Because the requirements of software projects are always complex')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (549, 138, 1, N'Sets out the breakdown of the project into activities and identifies the milestones and deliverables associated with each activity')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (550, 138, 0, N'Sets out the breakdown of the project into smaller activities')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (551, 138, 0, N'Sets out the breakdown of the project into smaller tasks')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (552, 138, 0, N'Sets out the breakdown of the project into smaller functional')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (553, 139, 1, N'Feasibility study report document')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (554, 139, 0, N'Requirements document')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (555, 139, 0, N'Requirements analysis document')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (556, 139, 0, N'Requirements elicitation document')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (557, 140, 1, N'Minimize task dependencies to avoid delays caused by one task waiting for another to complete')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (558, 140, 0, N'All tasks are organized concurrently')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (559, 140, 0, N'Maximize task dependencies to avoid delays caused by one task waiting for another to complete')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (560, 140, 0, N'All tasks are organized sequence')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (561, 141, 1, N'Deliverables are project results delivered to customers')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (562, 141, 0, N'Deliverables are the output of project design')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (563, 141, 0, N'Deliverables are the output of project planning')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (564, 141, 0, N'Deliverables are the output of project implementation')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (565, 142, 1, N'Testable, complete, clear, inconsistent, unambiguous')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (566, 142, 0, N'Testable, complete, clear, consistent, ambiguous')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (567, 142, 0, N'Testable, incomplete, clear, consistent, unambiguous')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (568, 142, 0, N'Testable, complete, clear, consistent, unambiguous')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (569, 143, 1, N'Product requirements; Organizational requirements; External requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (570, 143, 0, N'Organizational requirements; External requirements; Non-Functional Requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (571, 143, 0, N'Organizational requirements; External requirements; System Requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (572, 143, 0, N'User requirements; Organizational requirements; External requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (573, 144, 1, N'Should include both a definition of user requirements and a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (574, 144, 0, N'Should include HOW the system will be implemented in a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (575, 144, 0, N'Should NOT include a definition of user requirements in a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (576, 144, 0, N'Requirement document should set of WHAT the system should do and HOW it should do')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (577, 145, 1, N'Should include both a definition of user requirements and a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (578, 145, 0, N'Should NOT include a definition of user requirements in a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (579, 145, 0, N'Should include HOW the system will be implemented in a specification of the system requirements')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (580, 145, 0, N'Requirement document should set of WHAT the system should do and HOW it should do')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (581, 146, 1, N'There shall be a standard user interface to all database that shall be base on the Z39.50 standard')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (582, 146, 0, N'Students can reserve a library item online')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (583, 146, 0, N'The staff member should be able to issue a library item by scanning the bar codes of the library item and the student card')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (584, 146, 0, N'The user should be able to search for a library item by specifying a key word')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (585, 147, 1, N'The user interface shall be implemented as simple HTML without frames')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (586, 147, 0, N'An article information shall include Author, Title, Description and other related information')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (587, 147, 0, N'The system shall be able to search either all of the initial set of databases or select a sub set from it,')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (588, 147, 0, N'The system shall provide appropriate viewers for the user to read documents in the document store')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (589, 148, 1, N'Describe how a system responses to external and internal events; It shows system states and events that cause transition from one state to another')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (590, 148, 0, N'State machine used to define the boundaries of the system, validate system requirement')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (591, 148, 0, N'State machine used to help the analyst to understand the functionality of the system, communicating with customer')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (592, 148, 0, N'State machine used in showing the data exchange between a system and other systems in its environment')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (593, 149, 1, N'DFD is used to showing the data exchange between a system and other systems in its environment')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (594, 149, 0, N'DFD is used to illustrate the sequence of steps that must be performed in order to complete a task')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (595, 149, 0, N'DFD is used to showing all of system''s functionalities available')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (596, 149, 0, N'DFD is used to describing all of the things that can be done with a database system')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (597, 150, 1, N'Generalization')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (598, 150, 0, N'Association')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (599, 150, 0, N'Aggregation')
GO
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (600, 150, 0, N'Composition')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (601, 151, 1, N'Should use sequence diagram to illustrate the sequence of steps that must be performed in order to complete a task')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (602, 151, 0, N'Should use sequence diagram to represent exception behavior (when errors happen)')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (603, 151, 0, N'Should use sequence diagram to describing branching behaviors of the TCP/IP network protocol')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (604, 151, 0, N'Should use sequence diagram to represent all of the people who might use the functionalities of the system')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (605, 152, 1, N'Performance, Security, Safety, Availability, Maintainability')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (606, 152, 0, N'Performance, Security, Safety, Availability, Easy deploy')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (607, 152, 0, N'Performance, Efficiency, Safety, Availability, Maintainability')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (608, 152, 0, N'Performance, Security, Safety, Availability, Easy implement')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (609, 153, 1, N'The architectural design is normally expressed as a block diagram presenting an overview of the system structure')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (610, 153, 0, N'The architectural design is normally expressed as a sequence diagram presenting an overview of the system structure')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (611, 153, 0, N'The architectural design is normally expressed as a use case diagram presenting an overview of the system structure')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (612, 153, 0, N'The architectural design is normally expressed as a state diagram presenting an overview of the system structure')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (613, 154, 1, N'System organisation; decomposition styles; Control styles')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (614, 154, 0, N'System organisation; decomposition styles; Procedure styles')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (615, 154, 0, N'System organisation; decomposition styles; Object oriented program')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (616, 154, 0, N'System organisation; decomposition styles; Logical styles')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (617, 155, 1, N'Generalization')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (618, 155, 0, N'Aggregation')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (619, 155, 0, N'Association')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (620, 155, 0, N'Composition')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (621, 156, 1, N'Be dependent on particular programming language')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (622, 156, 0, N'Support higher-level development concepts')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (623, 156, 0, N'Provide users a ready-to-use, expressive visual modeling language so they can develop and exchange meaningful models')
INSERT [dbo].[tblQuestionChoices] ([choiceID], [questionID], [isRight], [answer]) VALUES (624, 156, 0, N'Integrate best practices and methodologies')
SET IDENTITY_INSERT [dbo].[tblQuestionChoices] OFF
GO
SET IDENTITY_INSERT [dbo].[tblQuestions] ON 

INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (1, N'The cache is responsible for...?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (2, N'Choose the wrong answer Method of Accessing Units of Data have...?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (3, N'Design constraints on a computer''s memory can be summed up by three questions:', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (4, N'We was learned about diagram Memory Hierarchy. In inboard memory have:', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (5, N'What is RA mean?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (6, N'What is Volatile memory?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (7, N'__________ refers to whether memory is internal or external to the computer.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (8, N'A portion of main memory used as a buffer to hold data temporarily that is to be read out to disk is referred to as a _________', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (9, N'The cache memory is used by the computer''s central processing unit (CPU) for what?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (10, N'A line includes a _________ that identifies which particular block is currently being stored.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (11, N'The key advantage of the __________ design is that it eliminates contention for the cache between the instruction fetch/decode unit and the execution unit.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (12, N'A logical cache stores data using __________', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (13, N'In reference to access time to a two-level memory, a _________ occurs if an accessed word is not found in the faster memory?', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (14, N'When using the __________ technique all write operations made to main memory are made to the cache as well.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (15, N'__________ is the simplest mapping technique and maps each block of main memory into only one possible cache line.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (16, N'The ________ consists of the access time plus any additional time required before a second access can commence.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (17, N'The transfer between CPU and Cache is ______________', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (18, N'For random-access memory, __________ is the time from the instant that an address is presented to the memory to the instant that data have been stored or made available for use.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (19, N'individual blocks or records have a unique address based on physical location with __________', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (20, N'Internal memory capacity is typically expressed in terms of ______', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (21, N'The ________ enables the RAM chip to preposition bits to be placed on the databus as rapidly as possible.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (22, N'A DDR3 module transfers data at a clock rate of __________ MHz.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (23, N'Theoretically, a DDR module can transfer data at a clock rate in the range of __________ MHz.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (24, N'Compare transfer rate of SDRAM, RDRAM, DDR.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (25, N'________ increases the prefetch buffer size to 8 bits.', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (26, N'__________ increases the data transfer rate by increasing the operational frequency of the RAM chip and by increasing the prefetch buffer from 2 bits to 4 bits per chip', N'CEA201', CAST(N'2021-01-28' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (27, N'____ operating systems are typically used for a network platform.', N'OSG202', CAST(N'2021-01-29' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (28, N'_______ can send data to the processor twice per clock cycle', N'CEA201', CAST(N'2021-01-30' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (29, N'__________ is the simplest mapping technique and maps each block of main memory into only one possible cache line.', N'CEA201', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (30, N'The ________ consists of the access time plus any additional time required before a second access can commence.', N'CEA201', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (31, N'The transfer between CPU and Cache is ______________', N'CEA201', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (32, N'For random-access memory, __________ is the time from the instant that an address is presented to the memory to the instant that data have been stored or made available for use.', N'CEA201', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (33, N'individual blocks or records have a unique address based on physical location with __________', N'CEA201', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (34, N'____ operating systems are typically used for a network platform.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (35, N'The type of system designed to perform one specific function is ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (36, N'The name for the core part of an operating system is____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (37, N'___ is a portion of a process that can run independently.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (38, N'____ allows a resource to be held by a process as long as it is needed.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (39, N'___ is the act of allowing only one process to have access to a dedicated resource.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (40, N'Parallel processing is also called ____', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (41, N'The need for algorithms to resolve conflicts between processors is called process ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (42, N'A ____ of processing must be handled as a unit.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (43, N'A problem with test-and-set is that when many processes are waiting to enter a critical region, ____ could occur because the processes gain access in an arbitrary fashion.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (44, N'____ sets the process''s process control block (PCB) to the blocked state and links it to the queue of processes waiting to enter this particular critical region.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (45, N'The two operations identified by Dijkstra to be performed on a semaphore are ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (46, N'When using a semaphore, a value of ____ indicates that a critical region is in use.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (47, N'Operations on semaphore s enforce the concept of ____, which is necessary to avoid having two operations attempt to execute at the same time.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (48, N'____ semaphores are used in the producer and consumer problem.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (49, N'____ proposed the readers and writers problem', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (50, N'Each active thread in a process shares the ____ and the resources allocated to its process.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (51, N'____ allows for faster turnaround of CPU-bound jobs.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (52, N'_ jobs are treated like all the others once they are in the system.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (53, N'One of the most important innovations of demand paging was that it made ____ feasible.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (54, N'The ____ policy is based on the theory that the best page to remove is the one that has been in memory the longest.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (55, N'With demand paging, jobs are divided into equally sized ____ that initially reside in secondary storage.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (56, N'During the second generation, programmers started dividing their programs into sections that resembled working sets, really segments, originally called roll in/roll out and now is called ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (57, N'Which of these statements about Memory Manager are not true?', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (58, N'Assume that four page frames are available and are numbered 1-4. Pages A-D have been loaded into page frames 1-4 in order. Assume that page E is requested.The page frame to be loaded into (the FIFO algorithm is applied) is ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (59, N'Assume that four page frames are available and are numbered 1-4. Pages A-D have been loaded into page frames 1-4 in order. The program has accessed the pages in the following order: B, D, A, C. Assume that page E is requested. The ____ page frame will be loaded when the LRU algorithm is used.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (60, N'When using the clock replacement policy, a page with a reference bit of ____ is replaced.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (61, N'The following,____, describes the first memory allocation scheme.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (62, N'Fixed partitions are also called ____ partitions.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (63, N'____ gives users the appearance that their programs are being completely loaded in main memory during their entire processing time', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (64, N'The primary advantage of storing programs in noncontiguous locations is that ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (65, N'_ allocation allows files to use any storage space available on the disk.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (66, N'__ are special files with listings of filenames and their attributes.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (67, N'the file''s structure includes _______', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (68, N'The File Manager is in charge of the system''s ____ components.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (69, N'On magnetic disks, files can be organized in one of three ways; ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (70, N'The `1^(st)` block in each partition is called ______', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (71, N'A ____ is a group of related records that contains information to be used by specific application programs to generate reports.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (72, N'The purpose of an extension is to ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (73, N'Many computer users and some operating systems call subdirectories as ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (74, N'The primary disadvantage of contiguous storage is that ____.', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (75, N'The file''s type includes ______', N'OSG202', CAST(N'2021-02-05' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (76, N'When using random access files, the program used to store the data follows a set of instructions, called a ____ algorithm, that transforms each key into a number, the record''s logical address', N'CEA201', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (77, N'In order for objects in a List to be sorted, those objects must implement which interface method?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (78, N'which of the following classes supports developers to get the pointer if a file?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (79, N'which of the following is the correct syntax for suggesting that the JVM performs garbage collection?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (80, N'when creating your own class and you want to make it directly support sorting, which interface must it implement?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (81, N'Which of the following statements is true?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (82, N'To write object to an object file. The right order of object creations is:', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (83, N'Which of the following methods of the java.io.File can be used to create a new file?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (84, N'which of the following modifiers does not allow a variable to be modified its value once it was initialized?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (85, N'which of the following most closely dexcribes the process of overriding?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (86, N'select the most correct statement:', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (87, N'A compound statement is:', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (88, N'Select correct statement', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (89, N'Select a correct statement about interfaces', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (90, N'Select the most correct statement', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (91, N'how do you use the File class to list the contents of a directory?', N'CEA201', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (92, N'a(n) ____ is a characteristic that describes an object', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (93, N'select INCORRECT statement about serialization.', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (94, N'which of the following may appear on the left-hand side of an instanceof operator?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (95, N'all the method of the ___ class are static', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (96, N'In order for objects in a List to be sorted, those object must implement which interface and method?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (97, N'which of these class is used to read characters in a file?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (98, N'which of the following may override a method whose signature is void xyz(float f)?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (99, N'in which stream, data unit is primitive data type or string?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
GO
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (100, N'____ is the process of identifying and grouping attributes and actions related to a particular entity as relevant to the application at hand', N'CEA201', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (101, N'suppose prim is an int and wrapped is an Interger. Which of the following are legal Java statements?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (102, N'when you compile a program written in the Java programming language, the compiler converts the human-readable source file info platform-independent code that a Java Virtual Machine can understand. What is this platform-independent code called?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (103, N'which of the following statements is INCORRECT?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (104, N'which of the statements below is true?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (105, N'which of the statement below is true?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (106, N'The pack provides some of the most useful Java class that are frequently needed in all types of applications', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (107, N'which of the following statements is INCORRECT?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (108, N'Suppose the declared type of x is a class, and the declared type of y is an interface. When is the assignment x = y; legal?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (109, N'Which of the following signtures is valid for the main() method entry point of an application?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (110, N'All of the numeric wrapper classes in the java.lang package are subclasses of the abstract class .....', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (111, N'which of the following statements can be used to call a constructor of the super class from its sub-class?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (112, N'A(n) _____ is a characteristic that describes an object', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (113, N'if you wanted to find out where the position of the letter v (ire return 2) int the string s containing "Java", which of the following could you use?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (114, N'select the correct statement:', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (115, N'The process of identifying common features of objects and methods is', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (116, N'which of the following collections supports accessing elements through keys and values?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (117, N'which of the following is true?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (118, N'if all three top-level elements occur in a source file, they must appear in which orfer?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (119, N'which of the following methods of the java.io.File can be used to check whether a file exists or not?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (120, N'which of the following should always be caught?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (121, N'Which of the following methods of the java.io.File can be used to check whether a file can be read or not?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (122, N'When is x & y an int?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (123, N'what interface can be implemented in order to create a class that can be serialized?', N'PRO192', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (124, N'In Iterative development approach, which phase takes the least cost?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (125, N'What are generic software process models?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (126, N'What is a software process model?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (127, N'In Waterfall approach, which phase takes the most cost?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (128, N'What is a software process?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (129, N'In Waterfall approach, which phase takes the least cost?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (130, N'In Component-based software engineering approach, which phase takes the least cost?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (131, N'What are the key challenges facing software engineering in the 21st century?', N'CEA201', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (132, N'What is the main difference between the Spiral model and other software processes models?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (133, N'What is the output of Feasibility study phase in the requirements engineering process?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (134, N'In contrast, the RUP (Rational Unified Process) is normally described from which types of perspectives?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (135, N'What is the main difference between the RUP (Rational Unified Process) and other software processes models?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (136, N'The Waterfall approach is the BEST approach to development software when __', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (137, N'Why many software projects are ''one-off'' projects?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (138, N'What is the BEST way to do work breakdown structure?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (139, N'What is the output of the first milestone in software requirement engineering process?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (140, N'Which is the BEST principle of project scheduling?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (141, N'What are deliverables?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (142, N'What are good attributes of requirements?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (143, N'Which are types of non-functional requirement?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (144, N'What is the BEST way to write requirement document?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (145, N'What is the BEST way to write requirement document?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (146, N'Which of the following requirement statements belongs to domain requirements?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (147, N'Which of the following requirement statements belongs to non-functional requirements?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (148, N'When should you use state machine model?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (149, N'data exchange between a system and other systems in its environment When should you use data flow diagrams (DFD)?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (150, N'Another name for inheritance is ___', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (151, N'When should you use sequence diagram?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (152, N'Which non-functional system requirements that the software system architecture may depend on?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (153, N'What is the correct statement about software architectural design?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (154, N'What are three general architectural styles?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (155, N'Another name for .. . is a...] relationship is ___', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
INSERT [dbo].[tblQuestions] ([questionID], [questionName], [subjectID], [createDate], [status]) VALUES (156, N'Which is NOT a primary goal in the design of the UML?', N'SWE102', CAST(N'2021-02-06' AS Date), 0)
SET IDENTITY_INSERT [dbo].[tblQuestions] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'SD', N'Student')
GO
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName]) VALUES (N'CEA201', N'Computer Organization and Architecture')
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName]) VALUES (N'OSG202', N'Operating Systems')
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName]) VALUES (N'PRO192', N'Object-Oriented Programming')
INSERT [dbo].[tblSubjects] ([subjectID], [subjectName]) VALUES (N'SWE102', N'Introduction to Software Engineering')
GO
INSERT [dbo].[tblUsers] ([fullName], [email], [password], [roleID], [status]) VALUES (N'Administrator', N'admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'AD', N'Admin')
INSERT [dbo].[tblUsers] ([fullName], [email], [password], [roleID], [status]) VALUES (N'Huynh Anh Vu', N'vuha@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'SD', N'NEW')
GO
ALTER TABLE [dbo].[tblQuestionChoices]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestions] ([questionID])
GO
ALTER TABLE [dbo].[tblQuestions]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuizDetail]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestions] ([questionID])
GO
ALTER TABLE [dbo].[tblQuizDetail]  WITH CHECK ADD FOREIGN KEY([quizID])
REFERENCES [dbo].[tblQuizs] ([quizID])
GO
ALTER TABLE [dbo].[tblQuizs]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblQuizs]  WITH CHECK ADD FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubjects] ([subjectID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment2_HuynhAnhVu] SET  READ_WRITE 
GO
