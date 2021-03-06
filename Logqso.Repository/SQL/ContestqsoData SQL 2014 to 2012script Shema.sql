USE [master]
GO
/****** Object:  Database [ContestqsoData]    Script Date: 6/17/2017 11:06:27 AM ******/
CREATE DATABASE [ContestqsoData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContestqsoData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\ContestqsoData.mdf' , SIZE = 4208640KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContestqsoData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\ContestqsoData_log.ldf' , SIZE = 5605504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContestqsoData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContestqsoData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContestqsoData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContestqsoData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContestqsoData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContestqsoData] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContestqsoData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContestqsoData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContestqsoData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContestqsoData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContestqsoData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContestqsoData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContestqsoData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContestqsoData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContestqsoData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContestqsoData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContestqsoData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContestqsoData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContestqsoData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContestqsoData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContestqsoData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContestqsoData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContestqsoData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContestqsoData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContestqsoData] SET  MULTI_USER 
GO
ALTER DATABASE [ContestqsoData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContestqsoData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContestqsoData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContestqsoData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ContestqsoData]
GO
/****** Object:  User [jims9m8r]    Script Date: 6/17/2017 11:06:27 AM ******/
CREATE USER [jims9m8r] FOR LOGIN [jims9m8r] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jims9m8r]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jims9m8r]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoContacts]    Script Date: 6/17/2017 11:06:27 AM ******/
CREATE TYPE [dbo].[udt_QsoContacts] AS TABLE(
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NULL,
	[Frequency] [decimal](18, 2) NOT NULL,
	[CallsignId] [int] NOT NULL,
	[QsoDateTime] [datetime] NOT NULL,
	[RxRst] [smallint] NOT NULL,
	[TxRst] [smallint] NOT NULL,
	[QsoExchangeNumber] [smallint] NULL,
	[QsoModeTypeEnum] [int] NOT NULL,
	[QsoRadioTypeEnum] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoPointsMults]    Script Date: 6/17/2017 11:06:27 AM ******/
CREATE TYPE [dbo].[udt_QsoPointsMults] AS TABLE(
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QZoneMult] [bit] NOT NULL,
	[QCtyMult] [bit] NOT NULL,
	[QPrefixMult] [bit] NOT NULL,
	[QPts1] [bit] NOT NULL,
	[QPts2] [bit] NOT NULL,
	[QPts4] [bit] NOT NULL,
	[QPts8] [bit] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoStationNames]    Script Date: 6/17/2017 11:06:27 AM ******/
CREATE TYPE [dbo].[udt_QsoStationNames] AS TABLE(
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QStationName] [varchar](20) NULL,
	[Frequency] [decimal](18, 2) NOT NULL
)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CabrilloInfo](
	[ContestId] [varchar](35) NOT NULL,
	[CallSignId] [int] NOT NULL,
	[ClaimedScore] [int] NOT NULL,
	[Club] [varchar](20) NULL,
	[Operators] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[AddressCity] [varchar](100) NULL,
	[AddressState] [varchar](100) NULL,
	[AddressPostalCode] [varchar](50) NULL,
	[AddressCountry] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.CabrilloInfo] PRIMARY KEY CLUSTERED 
(
	[ContestId] ASC,
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CallInfo](
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NULL,
	[CallInfoId] [int] NOT NULL,
	[CallGroup] [int] NOT NULL,
	[UserName] [varchar](256) NOT NULL,
	[ContestId] [varchar](35) NOT NULL,
	[CallsignId] [int] NOT NULL,
	[SessionName] [varchar](256) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[QsoRadioTypeEnum] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CallInfo] PRIMARY KEY CLUSTERED 
(
	[CallInfoId] ASC,
	[CallGroup] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CallSign](
	[CallSignId] [int] IDENTITY(1,1) NOT NULL,
	[Call] [varchar](20) NOT NULL,
	[Prefix] [varchar](10) NOT NULL,
	[ContinentEnum] [int] NOT NULL,
	[Accuracy] [int] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[GeoCodeChk] [bit] NULL,
 CONSTRAINT [PK_dbo.CallSign] PRIMARY KEY CLUSTERED 
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contest](
	[ContestId] [varchar](35) NOT NULL,
	[ContestName] [varchar](30) NOT NULL,
	[ContestTypeEnum] [int] NOT NULL,
	[QsoModeTypeEnum] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Contest] PRIMARY KEY CLUSTERED 
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContestType](
	[ContestTypeEnum] [int] NOT NULL,
	[ContestTypeEnumName] [varchar](20) NOT NULL,
	[QsoExchangeTypeEnum] [int] NOT NULL,
	[QsoExchangeName] [varchar](20) NOT NULL,
	[QsoMultName] [varchar](20) NOT NULL,
	[QsoMult2Name] [varchar](20) NULL,
	[ExtraDataName] [varchar](20) NULL,
 CONSTRAINT [PK_dbo.ContestType] PRIMARY KEY CLUSTERED 
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ContestYear] [datetime] NOT NULL,
	[CallsignId] [int] NOT NULL,
	[ContestId] [varchar](35) NOT NULL,
	[LogCategoryId] [int] NOT NULL,
	[QsoExchangeNumber] [smallint] NULL,
	[QsoDatabaseServerInstance] [varchar](100) NOT NULL,
	[QsoDatabaseInstance] [varchar](100) NOT NULL,
	[QsoDatabaseTableName] [varchar](100) NOT NULL,
	[WintestDataID] [int] NULL,
	[N1mmDataID] [int] NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCategory](
	[LogCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CatOperatorEnum] [int] NOT NULL,
	[CatOperatorOverlayEnum] [int] NOT NULL,
	[CatBandEnum] [int] NOT NULL,
	[CatPowerEnum] [int] NOT NULL,
	[CatAssistedEnum] [int] NOT NULL,
	[CatNoOfTxEnum] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LogCategory] PRIMARY KEY CLUSTERED 
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Qso]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Qso](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NULL,
	[Frequency] [decimal](18, 2) NOT NULL,
	[CallsignId] [int] NOT NULL,
	[QsoDateTime] [datetime] NOT NULL,
	[RxRst] [smallint] NOT NULL,
	[TxRst] [smallint] NOT NULL,
	[QsoExchangeNumber] [smallint] NULL,
	[QsoModeTypeEnum] [int] NOT NULL,
	[QsoRadioTypeEnum] [int] NOT NULL,
	[QZoneMult] [bit] NOT NULL,
	[QCtyMult] [bit] NOT NULL,
	[QPrefixMult] [bit] NOT NULL,
	[QPts1] [bit] NOT NULL,
	[QPts2] [bit] NOT NULL,
	[QPts4] [bit] NOT NULL,
	[QPts8] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Qso] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QsoExchangeAlpha](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QsoExhangeAlphaValue] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoExchangeAlpha] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExchangeNumber]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QsoExchangeNumber](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QsoExhangeNumberValue] [smallint] NOT NULL,
 CONSTRAINT [PK_dbo.QsoExchangeNumber] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QsoExchangeType](
	[QsoExchangeTypeEnum] [int] NOT NULL,
	[QsoExchangeTypeEnumName] [varchar](20) NULL,
 CONSTRAINT [PK_dbo.QsoExchangeType] PRIMARY KEY CLUSTERED 
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QsoExtraData](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QsoExtraDataValue] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoExtraData] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QsoModeType](
	[QsoModeTypeEnum] [int] NOT NULL,
	[QsoModeEnumName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoModeType] PRIMARY KEY CLUSTERED 
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QsoRadioType](
	[QsoRadioTypeEnum] [int] NOT NULL,
	[QsoRadioTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoRadioType] PRIMARY KEY CLUSTERED 
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Session](
	[SessionName] [varchar](256) NOT NULL,
	[UserName] [varchar](256) NOT NULL,
	[SessionDateTime] [datetime] NOT NULL,
	[CategorySettings] [xml] NULL,
	[FiltersSettings] [xml] NULL,
	[XaxisSettings] [xml] NULL,
	[YaxisSettings] [xml] NULL,
	[Subscription] [smallmoney] NULL,
 CONSTRAINT [PK_dbo.Session] PRIMARY KEY CLUSTERED 
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Spot]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Spot](
	[SpotId] [int] IDENTITY(1,1) NOT NULL,
	[ContestId] [varchar](35) NOT NULL,
	[CallSignId] [int] NOT NULL,
	[SpoterCallSignId] [int] NOT NULL,
	[SpotDateTime] [datetime] NOT NULL,
	[Frequency] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Spot] PRIMARY KEY CLUSTERED 
(
	[SpotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Station]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Station](
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Station] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbnDupes](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnDupes] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UbnIncorrectCall](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[CorrectCall] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.UbnIncorrectCall] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UbnIncorrectExchange](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[CorrectExchange] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.UbnIncorrectExchange] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbnNotInLog](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnNotInLog] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UbnSummary](
	[CallsignId] [int] NOT NULL,
	[ContestId] [varchar](35) NOT NULL,
	[ContestYear] [datetime] NOT NULL,
	[LogCategoryId] [int] NOT NULL,
	[DuplicateCount] [int] NOT NULL,
	[Claimed160Qso] [smallint] NULL,
	[Claimed160Points] [int] NULL,
	[Claimed160Countries] [smallint] NULL,
	[Claimed160Zones] [smallint] NULL,
	[Claimed80Qso] [smallint] NULL,
	[Claimed80Points] [int] NULL,
	[Claimed80Countries] [smallint] NULL,
	[Claimed80Zones] [smallint] NULL,
	[Claimed40Qso] [smallint] NULL,
	[Claimed40Points] [int] NULL,
	[Claimed40Countries] [smallint] NULL,
	[Claimed40Zones] [smallint] NULL,
	[Claimed20Qso] [smallint] NULL,
	[Claimed20Points] [int] NULL,
	[Claimed20Countries] [smallint] NULL,
	[Claimed20Zones] [smallint] NULL,
	[Claimed15Qso] [smallint] NULL,
	[Claimed15Points] [int] NULL,
	[Claimed15Countries] [smallint] NULL,
	[Claimed15Zone3] [smallint] NULL,
	[Claimed10Qso] [smallint] NULL,
	[Claimed10Points] [int] NULL,
	[Claimed10Countries] [smallint] NULL,
	[Claimed10Zones] [smallint] NULL,
	[ClaimedTotalQSO] [int] NULL,
	[ClaimedCountries] [smallint] NULL,
	[ClaimedZones] [smallint] NULL,
	[ClaimedTotalPoints] [int] NULL,
	[ClaimedScore] [int] NULL,
	[Final160Qso] [smallint] NULL,
	[Final160Points] [int] NULL,
	[Final160Countries] [smallint] NULL,
	[Final160Zones] [smallint] NULL,
	[Final80Qso] [smallint] NULL,
	[Final80Points] [int] NULL,
	[Final80Countries] [smallint] NULL,
	[Final80Zones] [smallint] NULL,
	[Final40Qso] [smallint] NULL,
	[Final40Points] [int] NULL,
	[Final40Countries] [smallint] NULL,
	[Final40Zones] [smallint] NULL,
	[Final20Qso] [smallint] NULL,
	[Final20Points] [int] NULL,
	[Final20Countries] [smallint] NULL,
	[Final20Zones] [smallint] NULL,
	[Final15Qso] [int] NULL,
	[Final15Points] [int] NULL,
	[Final15Countries] [int] NULL,
	[Final15Zones] [int] NULL,
	[Final10Qso] [smallint] NULL,
	[Final10Points] [int] NULL,
	[Final10Countries] [smallint] NULL,
	[Final10Zones] [smallint] NULL,
	[FinalTotalQSO] [int] NULL,
	[FinalCountries] [smallint] NULL,
	[FinalZones] [smallint] NULL,
	[FinalTotalPoints] [int] NULL,
	[FinalScore] [int] NULL,
 CONSTRAINT [PK_dbo.UbnSummary] PRIMARY KEY CLUSTERED 
(
	[CallsignId] ASC,
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UbnUniques](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnUniques] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CabrilloInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId] FOREIGN KEY([CallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CabrilloInfo] CHECK CONSTRAINT [FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]
GO
ALTER TABLE [dbo].[CabrilloInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CabrilloInfo_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CabrilloInfo] CHECK CONSTRAINT [FK_dbo.CabrilloInfo_dbo.Contest_ContestId]
GO
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId]
GO
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId]
GO
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum] FOREIGN KEY([QsoRadioTypeEnum])
REFERENCES [dbo].[QsoRadioType] ([QsoRadioTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Session_SessionName] FOREIGN KEY([SessionName])
REFERENCES [dbo].[Session] ([SessionName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Session_SessionName]
GO
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Station_LogId_StationName] FOREIGN KEY([LogId], [StationName])
REFERENCES [dbo].[Station] ([LogId], [StationName])
GO
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Station_LogId_StationName]
GO
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contest_dbo.ContestType_ContestTypeEnum] FOREIGN KEY([ContestTypeEnum])
REFERENCES [dbo].[ContestType] ([ContestTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contest] CHECK CONSTRAINT [FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]
GO
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum] FOREIGN KEY([QsoModeTypeEnum])
REFERENCES [dbo].[QsoModeType] ([QsoModeTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contest] CHECK CONSTRAINT [FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]
GO
ALTER TABLE [dbo].[ContestType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum] FOREIGN KEY([QsoExchangeTypeEnum])
REFERENCES [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContestType] CHECK CONSTRAINT [FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.CallSign_CallsignId]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.Contest_ContestId]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.LogCategory_LogCategoryId] FOREIGN KEY([LogCategoryId])
REFERENCES [dbo].[LogCategory] ([LogCategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.LogCategory_LogCategoryId]
GO
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
GO
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.CallSign_CallsignId]
GO
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.Log_LogId] FOREIGN KEY([LogId])
REFERENCES [dbo].[Log] ([LogId])
GO
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.Log_LogId]
GO
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum] FOREIGN KEY([QsoModeTypeEnum])
REFERENCES [dbo].[QsoModeType] ([QsoModeTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]
GO
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum] FOREIGN KEY([QsoRadioTypeEnum])
REFERENCES [dbo].[QsoRadioType] ([QsoRadioTypeEnum])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.Station_LogId_StationName] FOREIGN KEY([LogId], [StationName])
REFERENCES [dbo].[Station] ([LogId], [StationName])
GO
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.Station_LogId_StationName]
GO
ALTER TABLE [dbo].[QsoExchangeAlpha]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
ALTER TABLE [dbo].[QsoExchangeAlpha] CHECK CONSTRAINT [FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]
GO
ALTER TABLE [dbo].[QsoExchangeNumber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
ALTER TABLE [dbo].[QsoExchangeNumber] CHECK CONSTRAINT [FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]
GO
ALTER TABLE [dbo].[QsoExtraData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
ALTER TABLE [dbo].[QsoExtraData] CHECK CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]
GO
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.CallSign_CallSignId] FOREIGN KEY([CallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.CallSign_CallSignId]
GO
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.CallSign_SpoterCallSignId] FOREIGN KEY([SpoterCallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
GO
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]
GO
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.Contest_ContestId]
GO
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Station_dbo.Log_LogId] FOREIGN KEY([LogId])
REFERENCES [dbo].[Log] ([LogId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [FK_dbo.Station_dbo.Log_LogId]
GO
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.CallSign_CallsignId]
GO
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.Contest_ContestId]
GO
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId] FOREIGN KEY([LogCategoryId])
REFERENCES [dbo].[LogCategory] ([LogCategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogs]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_GetContestLogs] 
	@Logid1	int,
	@logid2	int,
	@logid3 int,
	 @FreqLow decimal = null,
	 @FreqHigh decimal = null,
	 @ContinentEnum int  = null,
	 @Country varchar(10) = null,
	 @Zone smallint = null,

	 @StartTime datetime = null,
	 @Endtime datetime = null,
	 @StartDay int = null,
	 @EndDay int = null,
	 @Radio1 int = null,
	 @Radio2 int = null,
	 @Radio3 int = null,
	 @Station1 varchar(20) = null,
	 @Station2 varchar(20) = null,
	 @Station3 varchar(20) = null

AS 
	BEGIN

    SET NOCOUNT ON
	DECLARE @restore tinyint = @@DATEFIRST
	SET DATEFIRST 6
    Select  DATEPART(dw,q.[QsoDateTime]) as W, cast(cast(q.QsoDateTime As time) as smalldatetime)   as Time,
	 CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup,
	   q.QsoNo,q.LogId, c.Call, q.Frequency as Freq,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S,
		(Select Cast(count(*) as bit)
			from UbnUniques as Uniques
			where q.LogId = Uniques.LogId and q.QsoNo = Uniques.QsoNo
		) as U,
		(Select Cast(count(*) as bit)
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as B,
		(Select badCall.CorrectCall
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as BC,
		(Select Cast(count(*) as bit)
			from UbnNotInLog as nil
			where q.LogId = nil.LogId and q.QsoNo = nil.QsoNo
		) as N,
		(Select Cast(count(*) as bit)
			from UbnDupes as dupes
			where q.LogId = dupes.LogId and q.QsoNo = dupes.QsoNo
		) as D,
		(Select Cast(count(*) as bit)
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as X,
		(Select badX.CorrectExchange
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as XC

	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone))
		 AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	 ORDER BY W, Time, CGroup ASC, q.QsoNo




--Uniques
	  Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time,
	  CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup,  u.LogId, u.QsoNo
	 From UbnUniques u
	 INNER JOIN Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) 
		AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, u.QsoNo

	--Nils
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 
	CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN  Qso q on n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone))
		 AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, n.QsoNo

	--Dupes
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 
	CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup, d.LogId, d.QsoNo
	 From UbnDupes d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone))
		 AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)


	ORDER BY  Time, CGroup, d.QsoNo

	--Bad Call
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 
	CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) 
		AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)
	ORDER BY  Time, CGroup, d.QsoNo

		--Bad Exchange
	Select cast(cast(q.QsoDateTime As time) as smalldatetime) as Time, 
	CASE q.LogId
		WHEN @Logid1 THEN 1
		WHEN @Logid2 THEN 2
		WHEN @Logid3 THEN 3
		END AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
	 where (	(q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) OR
				(q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) OR
			    (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )
			) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) 
		AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)	

	ORDER BY  Time, CGroup, d.QsoNo

	SET DATEFIRST @restore

  END
  
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogsUnion]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_GetContestLogsUnion] 
	@Logid1	int,
	@logid2	int,
	@logid3 int,
	 @FreqLow decimal = null,
	 @FreqHigh decimal = null,
	 @ContinentEnum int  = null,
	 @Country varchar(10) = null,
	 @Zone smallint = null,

	 @StartTime datetime = null,
	 @Endtime datetime = null,
	 @StartDay int = null,
	 @EndDay int = null,
	 @Radio1 int = null,
	 @Radio2 int = null,
	 @Radio3 int = null,
	 @Station1 varchar(20) = null,
	 @Station2 varchar(20) = null,
	 @Station3 varchar(20) = null

AS 
	BEGIN

    SET NOCOUNT ON
	DECLARE @restore tinyint = @@DATEFIRST
	SET DATEFIRST 6
	Select  DATEPART(dw,q.[QsoDateTime]) as W, cast(cast(q.QsoDateTime As time) as smalldatetime)   as Time,
	1 AS CGroup,
		   q.QsoNo,q.LogId, c.Call, q.Frequency as Freq,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S,
		(Select Cast(count(*) as bit)
			from UbnUniques as Uniques
			where q.LogId = Uniques.LogId and q.QsoNo = Uniques.QsoNo
		) as U,
		(Select Cast(count(*) as bit)
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as B,
		(Select badCall.CorrectCall
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as BC,
		(Select Cast(count(*) as bit)
			from UbnNotInLog as nil
			where q.LogId = nil.LogId and q.QsoNo = nil.QsoNo
		) as N,
		(Select Cast(count(*) as bit)
			from UbnDupes as dupes
			where q.LogId = dupes.LogId and q.QsoNo = dupes.QsoNo
		) as D,
		(Select Cast(count(*) as bit)
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as X,
		(Select badX.CorrectExchange
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as XC
	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) )  AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)



	 UNION ALL
    
	
	Select  DATEPART(dw,q.[QsoDateTime]) as W, cast(cast(q.QsoDateTime As time) as smalldatetime)   as Time,
	2 AS CGroup,
		   q.QsoNo,q.LogId, c.Call, q.Frequency as Freq,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S,
		(Select Cast(count(*) as bit)
			from UbnUniques as Uniques
			where q.LogId = Uniques.LogId and q.QsoNo = Uniques.QsoNo
		) as U,
		(Select Cast(count(*) as bit)
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as B,
		(Select badCall.CorrectCall
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as BC,
		(Select Cast(count(*) as bit)
			from UbnNotInLog as nil
			where q.LogId = nil.LogId and q.QsoNo = nil.QsoNo
		) as N,
		(Select Cast(count(*) as bit)
			from UbnDupes as dupes
			where q.LogId = dupes.LogId and q.QsoNo = dupes.QsoNo
		) as D,
		(Select Cast(count(*) as bit)
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as X,
		(Select badX.CorrectExchange
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as XC

	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where (q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		((@StartDay is null) or (DATEPART(dw,q.[QsoDateTime]) BETWEEN @StartDay AND @EndDay)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

    
	UNION ALL

	Select  DATEPART(dw,q.[QsoDateTime]) as W, cast(cast(q.QsoDateTime As time) as smalldatetime)   as Time,
	3 AS CGroup,
		   q.QsoNo,q.LogId, c.Call, q.Frequency as Freq,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S,
				(Select Cast(count(*) as bit)
			from UbnUniques as Uniques
			where q.LogId = Uniques.LogId and q.QsoNo = Uniques.QsoNo
		) as U,
		(Select Cast(count(*) as bit)
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as B,
		(Select badCall.CorrectCall
			from UbnIncorrectCall as badCall
			where q.LogId = badCall.LogId and q.QsoNo = badCall.QsoNo
		) as BC,
		(Select Cast(count(*) as bit)
			from UbnNotInLog as nil
			where q.LogId = nil.LogId and q.QsoNo = nil.QsoNo
		) as N,
		(Select Cast(count(*) as bit)
			from UbnDupes as dupes
			where q.LogId = dupes.LogId and q.QsoNo = dupes.QsoNo
		) as D,
		(Select Cast(count(*) as bit)
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as X,
		(Select badX.CorrectExchange
			from UbnIncorrectExchange as badX
			where q.LogId = badX.LogId and q.QsoNo = badX.QsoNo
		) as XC

	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) )  AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)


	 ORDER BY W, Time, CGroup ASC, q.QsoNo


	 --SET DATEFIRST @restore


--Uniques
	  Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 1 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 INNER JOIN Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		((@StartDay is null) or (DATEPART(dw,q.[QsoDateTime]) BETWEEN @StartDay AND @EndDay)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	 Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 2 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 inner join Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		((@StartDay is null) or (DATEPART(dw,q.[QsoDateTime]) BETWEEN @StartDay AND @EndDay)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL
	 
	--Uniques
	 Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time,  3 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 INNER JOIN  Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3))  ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		((@StartDay is null) or (DATEPART(dw,q.[QsoDateTime]) BETWEEN @StartDay AND @EndDay)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, u.QsoNo

	--Nils
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 1 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN  Qso q on n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	 Select cast(cast(q.QsoDateTime As time) as smalldatetime) as Time, 2 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN Qso q on n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	 Select cast(cast(q.QsoDateTime As time) as smalldatetime) as Time,  3 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN Qso q ON n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where(q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, n.QsoNo

	--Dupes
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 1 AS CGroup, d.LogId, d.QsoNo
	 From UbnDupes d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 2 AS CGroup, d.LogId, d.QsoNo
	 From UbnDupes d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid2 AND ((@Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)
	UNION ALL

	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 3 AS CGroup, d.LogId, d.QsoNo
	 From UbnDupes d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, d.QsoNo

	--Bad Call
	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 1 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 2 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid2 AND ((@Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL

	Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 3 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	ORDER BY  Time, CGroup, d.QsoNo

	--Bad Exchange

	 Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time, 1 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q  on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid1 AND ((@Radio1 is null or q.QsoRadioTypeEnum = @Radio1) AND
						(@Station1 is null or q.StationName = @Station1) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)
	
	UNION ALL

	 Select cast(cast(q.QsoDateTime As time) as smalldatetime)  as Time,  2 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid2 AND (( @Radio2 is null or q.QsoRadioTypeEnum = @Radio2) AND
						(@Station2 is null or q.StationName = @Station2) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)

	UNION ALL
	

	Select cast(cast(q.QsoDateTime As time) as smalldatetime) as Time, 3 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where (q.LogId = @Logid3 AND ((@Radio3 is null or q.QsoRadioTypeEnum = @Radio3) AND
						(@Station3 is null or q.StationName = @Station3) ) ) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
		--Days are Not Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay = @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)  >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				OR
	 			  (cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )
				)
			) 
		)
		AND
		--Days are Equal
	 	((@StartTime is null or @StartDay is null or ( @StartDay <> @EndDay ) )  
			OR
				((cast(cast(q.QsoDateTime As time) as smalldatetime)   >= 
					(@StartTime) AND (DATEPART(dw,q.[QsoDateTime]) = @StartDay) 
				AND
	 			(cast(cast(q.QsoDateTime As time) as smalldatetime)  <= 
					(@Endtime) AND (DATEPART(dw,q.[QsoDateTime]) = @EndDay)   )  
				)  
			) 
		)


ORDER BY  Time, CGroup, d.QsoNo

SET DATEFIRST @restore

  END

GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoInsertContacts]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_QsoInsertContacts](@InsertContacts udt_QsoContacts READONLY)
AS   
    SET NOCOUNT ON  
    INSERT INTO dbo.Qso  
           (QsoNo  
		   ,LogId
		   ,StationName
		   ,Frequency
		   ,CallsignId
		   ,QsoDateTime
		   ,RxRst
		   ,TxRst
		   ,QsoExchangeNumber
		   ,QsoModeTypeEnum
		   ,QsoRadioTypeEnum 
           ,QZoneMult  
           ,QCtyMult  
           ,QPrefixMult  
           ,QPts1  
           ,QPts2  
           ,QPts4  
           ,QPts8)  
        SELECT *, 0, 0, 0,  0,  0,  0,  0    
        FROM  @InsertContacts;  

GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdatePointsMults]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_QsoUpdatePointsMults](@UpdatedQsoPointsMult udt_QsoPointsMults READONLY)
AS UPDATE dbo.Qso
   SET 
   Qso.QZoneMult = ec.QZoneMult,
   Qso.QCtyMult = ec.QCtyMult,
   Qso.QPrefixMult = ec.QPrefixMult,
   Qso.QPts1 = ec.QPts1,
   Qso.QPts2 = ec.QPts2,
   Qso.QPts4 = ec.QPts4,
   Qso.QPts8 = ec.QPts8
  FROM Qso INNER JOIN @UpdatedQsoPointsMult AS ec
   ON Qso.QsoNo = ec.QsoNo AND Qso.LogId = ec.LogId;

GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdateStationNames]    Script Date: 6/17/2017 11:06:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames](@UpdatedQsoStationName udt_QsoStationNames READONLY)
AS UPDATE dbo.Qso
   SET 
   Qso.StationName = ec.QStationName,
   Qso.Frequency = ec.Frequency
  FROM Qso INNER JOIN @UpdatedQsoStationName AS ec
   ON Qso.QsoNo = ec.QsoNo AND Qso.LogId = ec.LogId;

GO
USE [master]
GO
ALTER DATABASE [ContestqsoData] SET  READ_WRITE 
GO
