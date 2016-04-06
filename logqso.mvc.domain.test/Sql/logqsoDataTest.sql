USE [LogqsoDataTest]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] DROP CONSTRAINT [FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] DROP CONSTRAINT [FK_dbo.UbnSummary_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] DROP CONSTRAINT [FK_dbo.UbnSummary_dbo.CallSign_CallsignId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station] DROP CONSTRAINT [FK_dbo.Station_dbo.Log_LogId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData] DROP CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]'))
ALTER TABLE [dbo].[QsoExchangeAlpha] DROP CONSTRAINT [FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] DROP CONSTRAINT [FK_dbo.Qso_dbo.Station_LogId_StationName]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] DROP CONSTRAINT [FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] DROP CONSTRAINT [FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] DROP CONSTRAINT [FK_dbo.Qso_dbo.Log_LogId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] DROP CONSTRAINT [FK_dbo.Qso_dbo.CallSign_CallsignId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK_dbo.Log_dbo.LogCategory_LogCategoryId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK_dbo.Log_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK_dbo.Log_dbo.CallSign_CallsignId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] DROP CONSTRAINT [FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContestType]'))
ALTER TABLE [dbo].[ContestType] DROP CONSTRAINT [FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest] DROP CONSTRAINT [FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest] DROP CONSTRAINT [FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.Station_LogId_StationName]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Session_SessionName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.Session_SessionName]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_LogId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
DROP INDEX [IX_LogId] ON [dbo].[Station]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CabrilloInfoID]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CabrilloInfoID')
DROP INDEX [IX_CabrilloInfoID] ON [dbo].[Log]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
DROP INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
DROP INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_Call]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
DROP INDEX [IX_Call] ON [dbo].[CallSign]
GO
/****** Object:  Index [IX_SessionName]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
DROP INDEX [IX_SessionName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
DROP TABLE [dbo].[UbnUniques]
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
DROP TABLE [dbo].[UbnSummary]
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
DROP TABLE [dbo].[UbnNotInLog]
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectExchange]
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectCall]
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
DROP TABLE [dbo].[UbnDupes]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoRadioType]
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoModeType]
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExtraData]
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeType]
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
DROP TABLE [dbo].[Qso]
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
DROP TABLE [dbo].[LogCategory]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
DROP TABLE [dbo].[ContestType]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
DROP TABLE [dbo].[Contest]
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
DROP TABLE [dbo].[CallSign]
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  User [jims9m8r]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
DROP USER [jims9m8r]
GO
USE [master]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 2/18/2016 12:16:49 AM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'LogqsoDataTest')
DROP DATABASE [LogqsoDataTest]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 2/18/2016 12:16:49 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'LogqsoDataTest')
BEGIN
CREATE DATABASE [LogqsoDataTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogqsoData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\LogqsoDataTest.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LogqsoData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\LogqsoDataTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [LogqsoDataTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogqsoDataTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogqsoDataTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogqsoDataTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogqsoDataTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LogqsoDataTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogqsoDataTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LogqsoDataTest] SET  MULTI_USER 
GO
ALTER DATABASE [LogqsoDataTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogqsoDataTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogqsoDataTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogqsoDataTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LogqsoDataTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LogqsoDataTest]
GO
/****** Object:  User [jims9m8r]    Script Date: 2/18/2016 12:16:49 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
CREATE USER [jims9m8r] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
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
GRANT CONNECT TO [jims9m8r] AS [dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CabrilloInfo](
	[CabrilloInfoId] [int] IDENTITY(1,1) NOT NULL,
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
	[CabrilloInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CallInfo](
	[CallInfoId] [int] NOT NULL,
	[CallGroup] [int] NOT NULL,
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NULL,
	[ContestId] [varchar](35) NOT NULL,
	[CallsignId] [int] NOT NULL,
	[UserName] [varchar](256) NOT NULL,
	[SessionName] [varchar](256) NOT NULL,
	[Disabled] [bit] NOT NULL,
	[QsoRadioTypeEnum] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CallInfo] PRIMARY KEY CLUSTERED 
(
	[CallInfoId] ASC,
	[CallGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CallSign](
	[CallSignId] [int] IDENTITY(1,1) NOT NULL,
	[Call] [varchar](20) NOT NULL,
	[Continent] [int] NOT NULL,
	[Accuracy] [int] NOT NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[GeoCodeChk] [bit] NULL,
 CONSTRAINT [PK_dbo.CallSign] PRIMARY KEY CLUSTERED 
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Log](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[ContestYear] [datetime] NOT NULL,
	[CallsignId] [int] NOT NULL,
	[ContestId] [varchar](35) NULL,
	[LogCategoryId] [int] NOT NULL,
	[QsoExchangeNumber] [smallint] NULL,
	[QsoDatabaseServerInstance] [varchar](100) NOT NULL,
	[QsoDatabaseInstance] [varchar](100) NOT NULL,
	[QsoDatabaseTableName] [varchar](100) NOT NULL,
	[CabrilloInfoID] [int] NULL,
	[WintestDataID] [int] NULL,
	[N1mmDataID] [int] NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LogCategory](
	[LogCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CatOperator] [int] NOT NULL,
	[CatOperatorOverlay] [int] NOT NULL,
	[CatBand] [int] NOT NULL,
	[CatPower] [int] NOT NULL,
	[CatAssisted] [int] NOT NULL,
	[CatNoOfIx] [int] NOT NULL,
 CONSTRAINT [PK_dbo.LogCategory] PRIMARY KEY CLUSTERED 
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Qso](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NULL,
	[Frequency] [decimal](18, 2) NOT NULL,
	[CallsignId] [int] NOT NULL,
	[QsoDateTime] [datetime] NOT NULL,
	[RxRst] [tinyint] NOT NULL,
	[TxRst] [tinyint] NOT NULL,
	[QsoExchangeNumber] [smallint] NULL,
	[QsoModeTypeEnum] [int] NOT NULL,
	[QsoRadioTypeEnum] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Qso] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QsoExchangeType](
	[QsoExchangeTypeEnum] [int] NOT NULL,
	[QsoExchangeTypeEnumName] [varchar](20) NULL,
 CONSTRAINT [PK_dbo.QsoExchangeType] PRIMARY KEY CLUSTERED 
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QsoModeType](
	[QsoModeTypeEnum] [int] NOT NULL,
	[QsoModeEnumName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoModeType] PRIMARY KEY CLUSTERED 
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[QsoRadioType](
	[QsoRadioTypeEnum] [int] NOT NULL,
	[QsoRadioTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.QsoRadioType] PRIMARY KEY CLUSTERED 
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Station]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Station](
	[LogId] [int] NOT NULL,
	[StationName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_dbo.Station] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnDupes](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnDupes] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnIncorrectCall](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[CorrectCall] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UbnIncorrectCall] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnIncorrectExchange](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[CorrectExchange] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UbnIncorrectExchange] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnNotInLog](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnNotInLog] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnSummary](
	[CallsignId] [int] NOT NULL,
	[ContestId] [varchar](35) NOT NULL,
	[ContestYear] [datetime] NOT NULL,
	[LogCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnSummary] PRIMARY KEY CLUSTERED 
(
	[CallsignId] ASC,
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 2/18/2016 12:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbnUniques](
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UbnUniques] PRIMARY KEY CLUSTERED 
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201602170611010_InitialDatabaseCreation', N'Logqso.mvc.DataModel.LogData.Migrations.LogDataDB.Configuration', 0x1F8B0800000000000400ED5D5B73DB38967EDFAAFD0F2A3DEDCE745BB133E9E94ED933E5D88EC7D58EED584EA7F3A4A225D8E13645AA492A63EFD6FEB27DD89FB47F61C13B2EE7E0424214954EF9C522800F97F3E1E0760EF07FFFF3BF877F7F5A06A32F244EFC283C1AEFEFBD188F48388F167EF878345EA70FDFFF38FEFBDFFEF55F0ECF16CBA7D12F55BC97593C9A324C8EC69FD374F57A3249E69FC9D24BF696FE3C8E92E821DD9B47CB89B78826072F5EFC34D9DF9F100A31A658A3D1E1ED3A4CFD25C97FD09F27513827AB74ED05EFA2050992F23B0D99E6A8A32B6F499295372747E3CBE8F1F724DA5B7E99EF9D7AA99727D8A31FB31FE3D171E07BB44C53123C8C475E1846A997D212BFFE9090691A47E1E374453F78C1DDF38AD0780F5E9090B226AF9BE8A6957A7190556AD224ACA0E6EB248D969680FB2FCB569A88C95BB5F5B86E45DA8E67B4BDD3E7ACD6795B1E8D4FBCFBD80F82E8227C88C62331C3D727419C45563777F325D963F1BE1B41A9BEABE9435996FD7D373A5907E93A26472159A7B14763DCACEF037FFE3379BE8B7E23E151B80E02B61AB422348CFB403FDDC4D18AC4E9F32D79002A77B1188F263CC64404A92190F445535C84E9CB83F1E88A16CABB0F48CD1EA6D9A6691493731292D84BC9E2C64B531253E15F2C48DEFE5249C47C038FF68AC5744E5174B9EA90D6F71502253EEDCDE3D13BEFE992848FE9E7A3F101EDBE6FFD27B2A83E94A01F429FF67D9A268DD7DA3CAE575935A3385166E422A7E3C52226496FF99CE4A242F3DA7799D7943287F495D94D94A45E70429329727CE5B22523AAE8635563B6C8ED70D268338D8E0B824EFAAD02A8755CF17300FAAD2888ACDBD0E8E771B45EB5D1844D4E9DF4515384920A7484DEABBF9E85EBA53D6614A624499BA201F47AF9CA885E2D6A93F88F61D756A1B39238FB4FA5D85EFDB0891A4C69E7A454DD4EE6A77E92C5AE1BEF4D1405C40BAD71682FEC2A8169A10F74EDE04225BE4FA25B6FE147592E05DF999E2007EA2A72E57DF11FF3C203E49C52728E47B724C823249FFD15D3E3B2FE3C6B62BD8DA3E56D14309DBD0E9C4DA3753CCF5A26C262DC79F123492D4A57745A4DE1AA4850D98A3045D1CA08B6256345A02E1E1F1328231B012F2817CBB6B465075617B48E0494B10CC38B5745B02E59B5665196AC8A0495AC085394AC8C0095CC6A72507400178B9F026B101383693930B519EAA746839AC3050FCDB3BBDE6D316FF0435A407E2E527D6D3517399ECFD7B1377FE620CFABAFC58CDB7674A32D9CAE9BA9FA694439623026868F2D929D93282BE4C9E7DFA441B95DEFAA34B883CE55406DBF6F35D34DEBAEB5BD996A91B3667EF37263FD8CE60DCE77A4304B6C3A7666F2C7E6527C98FD9C304E29C3C89DDFB45AF3DB12ED2C5C38C33A9EA7FE17623D6DD64DC6F0194F3995E2E23123B61C2C0FDA409C1633B34AA0CA6272F1E46232C16831D938DDA6176C9339538259A2A128C2A67FB554871B510C427A370B3B7BE574F634FFEC858FA88292C3DBE7B1AD3ABEA3FCDA66DE077DACDACF9E68DFC97AD9463253A93C96222AB597EB2A29BEA4FEA068981A04E376528752F9BAAB440172EB6A11ECD5B6AAB167D5E1564DB6654633683B614505370446F013D1166CD8D82CB74CDFD320694307666FCD091F6ABC211042D8E56DC108979BC80AF42191A2DEC7ECCE87126AEB54E00E606C59B0D5D39BAD1F5A395B4E9FD0848F51FC3C25694AABA0B22FA0FF3A984CBEF5839412ACB7FC7EF59EFCFE72FBD46B6ED3F57D328FFD55718C503281CCFDA5178C473731FDAF3469FB713C9ACEBD8C14076DD54F7558E140FD1409B7AE7ECAA35303E301EE84D456510DED84D6CD70446BE5820BF4D33079E048AE0E8F898A65E927E2C50E94BE1BDB0D877BFA5A2B876AA0EA5A6676D368BDBC273103B7FF8341EA8CA2F75E42A624FE42E28B3049BD70AEEA97A6E66BF615A98A328842DC65C9342A6A43A5E06C554F057EA8937EF4730A6795B04C79B5BF5C9A245318A9B0E6C7C0E61665FD8C8FD4EC688961D2369614C1DA4A45654353A0CBE633EC77A4481B309AC981657B19E6335C969656328C36428BC3C5E18BC40481C562C35B1C1391042D5419CA1727FF0816A4086969FB8297A289C017A4FA0E96A50EECB405CB49C5C9ECA5821BC22C861D225BCC66CC475897C62F6965422F58C5D6DFDB1D8135E9AFE9281D78CF187C19DC3697375EB810A1B36F6DF16EA27F12A929F28FAD1BE23849FC24255231ABEF6D71AFA2EB878B2711B5F86A8069B31DEA681774EB9D9496E12A325A72B65C9494197033DAAFDAA2F86D4C7E5F93B0B13AD3EF7F6C69B1544C95DDECDADD3EDD26B5E9DE9BE7D41EE1AE3342E785D4268F75B66F654EF30167C8EC7769A6C305BA3611CAC011F32021082C97CE2C485334B55D79990168522E8661A5EB6048AE30D7CEC0014B6DE633581E27F6D94C173B0E569F3DC7260339E6B731B19F31316FF7A6D97FF182750F5643AA1E89D19DA3C72C8FC8F15E0A873A801CA97B4F28AD909CF58212EF5B0FE8B107946D3E68FA976504A9CF84C1B4672374A2FC87FBF074BDCAF66B5AD29D02946CAFA0BE317D134CB791E845388F62BA30490BAF1F1792E520BF49B81F5D76C24AD1E9297F2B3655A3AD634655B0DF58D52BAB1A696E8D5957517A117639E3E70855A17DE3D1B6C79FE97AB9F43A1C7E70622DC1B62E557687CE40B45D9C18876738D12E672766245DAC32DA6DAA35A403F7D6806069920EC5717916CDE2CB47D272A8B2801B3AA066B240CEA9E118AAB2EA4EAD6DB414A5F8EF6B572B9F126CEB5AEA0F36F6AC978C4C854B8E2E92B781F7D8DC3D6824E679B45C46E15E86C05F9AC449B688D556AC54B92E481C3C535DCCB601DF66EF4876DA51D5ECF8F2727F3CCAF7338EC6FB52034B910FEAC8B2A99014F9651DF9A5DCEE450B2B5A5D3EEAE8DCF022E456DBFED6B8E16F8D5BFD761D626D2E46CDFC2FEBB87F51C79DCE6EEAA8AF5A8852B899A37B0762F1B62A44CAF2BA655EA81BF1EAD854DED36353799F7D3015F7F1D454D8C76F31598B31AF4FEA983FB4608570B98A392B1EA3E831A072F4E910794EA23F7340DF8D98E0FE88703EFB10FE1646FF0C4DE9703EABAF563463C5F9EC963CE6E77866DC389F4DD7F7319F444392F3D91D5B030D51CE67D96D94F35C786684A1454A6342528C36727CDAEE5480649EB2B5F8AB2E557DDB6899E0476D4562B2F493A61E3FA913FCF276F6960A6FD1884E23ECCCE3AA89AC15F445F83EFECFAB8872BB4EF4BDB6D26FBC054D70B96E92685B37DFD9A0593549B402BCCABB47155DCB9093F439BAFF8F26819680B7EB444CA3E5F92F3F8B49F65B0E52DCBD154E86290671BB33BDF71F3F1A4FF4DE7FBCF9D578A2F77EFF8717A60AE6F6C3F4F4D7134CC1984E0B79F31A17B3421671AB629A4EDF184BE9A3A988DE5DFC7A766A2CA2BBBB4F5D05245F70E0424822EA560505D88F99894DB68A31132293EE5DB6AFD6696D2519283B58D37288839994EBA6DA1757E79767B3EB1BE3BEF4E1F2EE828DAFE94E27FF383BF9F9F2FABC5397C20CBE5D4A8D01DEAAF0AEAEAFCE4CE7D0B5F4662797C7D3E9C589B5D867B7D7D73F5F9C61D237954E6333EF422415DAAE74A2199D01BC33ED40B31F99B89ACE33FB0B135733D79C1D307135D3D8D9FEAB26AE66963CDB6770FFDA8E1EAC07840B823478BB42917F5C9CFFC3942197D71F4D09F2FEF6A6AB62E5FD485C488745DC15F964DA737AC7CC123532A25A7A26A5693913617D6E5CB47F83B72BADCF0E799A86BFFB786DDA393E5C5D5EBCBB600564D445287DA3B99FB73673FEC15F39CFE77A162E46DAFBE71B1F86E6518F6C0FDA5FD1B6F6D3E7A3F19FA4EAA880AB533A01B83854E581F7F9F252E0EBF094042425A3E379F1B8D38997CCBD05703F062D02FFE5963C9038730FCC9E610913CA183F4CE553313F9CFB2B2FD0155F48881A08C057826705ACB312434EC98A849923A34E36A665408D1426755642E3E9DAEA70C2904DC341C5558928694CEE4D64E8C35EF86A414D831B17790F1EFE1EC5C171555F1F13C680DB005DE8AB17A6C362F5C768EE6A660DC7E07B9A2506B7602F78BBB359DF180C63A13A18E936F56DC86D580A09CA51517A6426EB6EA7E30FE87FE7849990E71EAF4F1B9FC0A13213A883A1B2525D3FDA8A9980A01C15A50F668AEF0BE9E78BA29D9AAB79A860DCA6E7FA00D88814DE4233399B83F262E95C823EB9C779FA6A8902FBFE3A6221E837CC2B47C62979B07C84AA61A89494B7F1B6E326243157A5E993A7D59DBB5A16490F893962A7F8FE18835BDF073C584E0A85372180E246E0764C1404E3A00CBDF2AFBC7740CF13F1260257FC136E3160F957DD89C0C3BED8DB93B7EA3AF2882F84890C91AB5D6179E397BBB6E41C2F8C9ECBDB033FA57B09311EE19714363CCA9DCCCCA9895E6BC8519EBD337153FCC44A62B619A87A9CDD8A76581B5B17E374AB6CD26C8BC3F74A7664D12EEE834325EF710B1C92C34EEC7EB357842A5981AF76DB70CC7A8DEB583F6D6B990A34E52EAC50C59B5B55B205FDE23AB10572A1E3111B57BD21EA25A0FC86931FFCE6526BD601627152881ED8C75D19871105BE3F8EDBB0B0E11D78E39CD148E8444941D9F7389C418DB913C39970219F922D9A83851684D9E50305A4FC86DB53CE0E1310C1382A467F0CD4EFE38A11DD717087376EB11AF4BE678B496787B66BDF27FA9DB2F7D0759D9DF8B7CDAD3120FFA1EE8A010DFF756E88BDCFDF56504DEFDFF30F2D28970A4E3514540C5863EA3B41EBC50157FB0E14B05C0E70B5ED946D4F3CAA5FC750C9507E2A635B6C92DEE5D0EB4187A412DBA13F5E89F51E3AB544A7B9FC7253C5F8A6B8E417B4C42C3DF10C463C4D36668AC9DD408A96C0700604DDE9B321DEA9C4D25B69FBE22A7B09AF9240E08DBC0247EB9BA3EDF909DDE7DB1F3781DC07CA4B400C5F1327A19BE730DE28AFA16BA8C35EC768BEF650DD5FB71327588A0AF4B8F3A790D14E6C0002D70C9A30063FDDEACEC61DB4E7C48B6F4402274765B8783A97A15F1E9A1C9CE9EE9574C8C75D3E4D5357C370AC7474A8A6169993B238E769712965D637688AC62DBAB81EF4F40DE015FB2121A5636C52DEAC2B522C439C9214309D198F9A4B3041132489AE225665A207E054410618C5780F6214413A8C4A4DCB1055881942B1E78EA114A11A24C9C94F429362E8119B532908AD09D52331470B101413ACC1AACD7825983A448750EDB2C80855880621DF319252E75FF5291B250A2134A1FA36859BD28629E526848A2A651413CC7AD108E3D5C11AACE61D1709A709D263082F87405842140BCCE6C501256E134D8FDDBC20004136A17AA47A1A0001D5817A9CFA566908A70E147098014656D8CC25E44C3C417523EB456EDA827BFDD7F560870969043571F31790C01161C257D7A429145EE550A3983AA1F39532704367AB878F33C6B040ABE9069CD68DC73930E38D86FB3943B5023D9DE546326920D0B5D9ACBD3B340A3722E38D825AC18035816C615A360A6404C3B3059D50B46814D16D53A970A00D01444B081B02EDD58DB0FAD7376A9756E0A7588AA6C02D54E06A80862AAD1B05B451E13982CF143B344F3D7554B40CE8DB065743F46E6BDD1EA23B1B0384CD76BBB44235FD55B502643782145E301F69DF0A82E508DB0AC88CDDBE15241F1DA015D47E3C5CE1514F1EA6F0C0744E8D01CE4C14EBE6B6AD80CFD170DF13A0E4F8CCCCACE6BDCCC7583F07ACC2DAE1017284B0AD6E1FE38168AE8F5418DD98944A0DED495A561CDA76E421D035B17D037016E340ED718B72F1A053C96F60198EA7DF2CBF45C367A4D266B342CC3ADAB2EABDCE0425BB5BBC054C663EA875AE7D1BF439D5616D3E9106D00FED9051A865B57B1BCB0BF34244C101B687925EE2AD0F2D951A6F33A86EA39615ACEDDE903AC27671524925CB38CB9A4AF66C1B9128688D05F35863B5253212B7DB827732C0FD503DE8C6A820D9FE60AD82DA07C985872C84C4D6407673D5601B6B05F09D43B921B44629D8D9A86AB0C73755B5689B1DFAA19715D56DA29DE82A4C23BAB5481FB35FEC1547659B98CD8535C7F49DDA662313E4EA1DC2FAC8B70E3B9C4CE79FC9D22B3F1C4E68943959A56B2F28DE88AC02DE79AB951F3E264DCAF2CB68BAF2E6D902FEFBE978F4B40CC2E468FC394D57AF279324874EF696FE3C8E92E821CDEE489E788B6872F0E2C54F93FDFDC9B2C098CCB9814B3CA0AE734AA3D87B244268469A0579EBC7499AA99E7B2FBBD7F964B194A23507DCC86148950F70862DCBAE3A24A91265FFD7E3F5EFE8E39B2AD4A651DFD27A2E332383ACCA04DB0190925380E9DC0BBC587A3596BF50E3240AD6CBD0ECB20D056AE0F94BB298CE6911054C2EC406717D2F22655FCC11AAD726121E86F96C8E55BFF2C522D51FAD714EA80C41AC22C01A2F9B6F1110B00CB146CC9E5BCB6C4916302C1B6C5FFBEA313AA801AA30C0CE7522F408B1234EA49E282845B1771BF6FD72CBD261BF87118DFA3C9614EFEF450AB9AF37DF2D7A65F59CAC0C567EB6C06A0CF2382CDC4E4F5DAECACA542C18667D8AA3654FE8154E722C56F3D51C89BB228D0553DE9D86E39DFA49F6C2B050CBE6AB39526922CEC2A0AE8468ED587F42AE762A47431C4F76936541F54EB45BD511C89AA2838E80100D75049C54D57BA648EFC12CC8D568328EAD66C8DFDC953543F9D962CC29DF6B15469BFAAB458FA19C4ED7E280D87CB5E97BE12304D57C36C73A2751360C9F7CFE8D0763BF0FA79FA0EBCCB6DD040634E92558CA5E86AB2291AC38B9006B3C586F4A81560A99BF4043D0C7EADB35705C3A3EC4D90A8DDCF9C0D0C1069963D225348CC805D8288ED4FF22CE7ECB6F43EB50C8D145B74E05819A772C3875DF041692A21D8E8F60D541E4273E844EA27F03C4085F2EBB1468D7B1D701A080B8006BBC0314F0C016B1DE3F962185A0C17446BD9966CB0EA90136E8945A8401101CEFA468A421895E718ADE5EEC18A899C8F1D47D0FF8655254BC7CE090C4AA320D682F5714D54CB08AE49B5B5B9B2083C2154207235DDCB0B3A56011400399A229FBDA5872BEE585CCEEC5409B6D85E2AC8BB6579A9D3E895B0C62A839F25B3F48499CC0C052A039EEAFDE938FA00A41E6989F70CC4F6D31A7EBFB641EFBABC26483131717329C8E8B1A2CB5EDB830A049C7C5520E71DF754BE2CAAC899C890A00331013986A93222AD7959F8817830BCE22605B071C2EF7B2049F75A1D554EEEC3826BBB25D67CF0CE30BDF32D80ABBB20D9892F80B892FC224F5C2B93C6FC1A2B5CA4B9B4B47FCBBEC04089C7E01316C78C73F7C819A0B008F62E0A81FFD9C6859C9445021C81CF36A7FB98400D9EF4352890AE3A2F6AA110335539178EA3E3B3F4D55D9684873BC26A015DE35EDC781F78CC2D6E156E86FBC50D2CAE5472B9C9BE89FA2A66BBE5A211DD35976928AC7C45C80155EF1CCBD84567D1E4CB7824D5CDB2FD3DBADCEAD16E5D99D6E82C286AF791BE284125D51C5E4F73509C55357E6F3B6663EC57808AC4CB90073BCDBA7DB4438A62E3F9963DCC91877B6181B9E316D6A537037CD3D24AF804DECF483C8765BFD08C4D0B5515E83A602BF78C11A3A1090620C8B1F959F845B6E20A8A6BC4093EF0427CAD26384E08307C386FAEE22674CC0100D5880271D0A03B62725FE562897D252229B494D033114E9E13B4ECC7D5BFC9E137A11D740D850DFE5B5114660E896ACC061768419CD8D69003BB0EBD4B6CB90FA6A3697C4C040CDF880A71E0A0DB627AECAFBCEA5B4104C3361A18977EF10C0F57147977DC5ED31ACBA1AD125C3104C3386A189FF10DA40727515A3D4B9975FEADFB5AB6BE966CAF9BFE6F5CEBC59F3FA26A5CBABE8775A44198F68E37CF11799CFE9F43949C972AF3870FE3D38097C92B9325411DE79A1FF9099A246BF91F0687CF062FF603C3A0E7C2F297C934B8FDAD7E285CC462EB6FB2F33175BB2584EC4E4F68EBA194A922CB849284371E0E04870B2FD993C8B6286DE0D50F9A21E4E4490434957F2E9B3A21D8DFDACC5F38E724EC26CCF9F2C6EBC3425316DC68BEC5EEDDCFFF26A1D04D961D9D1F8C10B12F91616A5F32B9391354EE6E05AA4FFE2C574CA4375E63BEFE992848FE9E78C122C647EF5B60691F17555C15AE3D69EAF9B402D7C6071E4FDD6C8A533EC26A05987581CFF55EB36A9DC62DB63B3AA54D373211F53D35E8B7B9522D141BF5193FEDDE4D4A1CB3505680F528E6E0C807469FE45B8204F47E3FFCA53BC1E5DFC3ACB13CD98F395EF46D7311D065E8F5E8CFEDBBA08DC398DC0914E85D9CF0AD3490731F349FB82D589F9D6610AF4F2552BA157D3653BA135293B49AB31AB54E8CF573FD8B380B5FDB46F6C2639DADC6D8AD5B8271765BAF7EDFB987C1A64273931BD85FCAC1427F0DC95B1E2845D6DCD54E154E6B3F3694EBE45674CAB8BA4587DBC1EDD512DA1542366D937DEBFED5575E3F7DB41DDD71EBF05C6431079A9AD56647C7D3BA0B04EBE60DFEA320D001FCB322333B68560C06574B4E8A8F359C75A05723B5E72DE8996430A9FBCD3B8229DC55BEB483679D70909EBC65B1464417FA7F96F4B34CE85B72356E5C36B3A16D97618D92DC7AAD360E60EC65D07947E374E6BE72AF6BD06741BB4A6AB08D1B5F7F0EEB4AE2BDC38D66E02F9C00EDA6478111C6DDB431BF721A59FAA593F327048D5F7251D3DBBB3BDCF2685FD408D9B5365DF65D494E8A0D46E7C73A2926CDA0F71B7346E40A51D9B510BE26B9F0EEBA8FEDA10746F346B3E853FA3BEE5540BE28E8BDA0DAFE19D4D7764C7C802F06919D80E07922B646B24C1FDB135CE274738BC9F6301932CE97A771985E4D99122065D05CD3A01727E067517DC605BDF5DDA6F646E6CF37223EA483290E8208536ADEA7C67863D64EFAC2FB6BC39DAEB7EB1D9560D677060DD3B9AC4CE9627A5093FA3A884B98049BD141E8EC62764A625979D1C379605E3E6E8360FD1DDD1B677B0A9312698C84DF09004E7822638AC63A421888D86455E3837D5B4B88D8F91C6457AACFB3D71C625B1CB31A4EC82D809ADF03EEC0451FA1D76C268DC0D3BC1547E86A620366BBB964B3AC824CADD94A1CC00D7EFDFCEA53B9F4B33CE88E59489CC7DDAD4994516FD2FC94DABF67FA43A63EE659807BB3795E27C1A3BCE0B4BAFC60285AEB79EDB30F2CE05C8262642433936D985636EB583E1B035A859135E450E56B5ADB42F94F97EDBC582E420D9D37629E266F88D19836106EF29D9072D60BFC36153A2B3589D359DC2F9EF8FDC84D0E611E34D58C08425B1FF6DE93DFDBBA3E5ADDEF3EE9B5800B1346E7C1B150DEC04F74796884DEB815E69E6468C981F9A6333B16D2FAD0668D5ECF010602B5BDE3624051DDBBEF570B9F198772099AE936D42230FA1324F51D611CA52E42F64361F33A3237F15F8739AEDD1785FF27ABC0E4F49405232CA2CEEB2CD94132F997BF2EB3659D117AA32E4CE2862198A8F7C19FE244153619238DBDBCD7C73C284CE7B7DD9C7F026F6C3B9BFF202B1DE424454E7616F241D4E6A6831E494AC4898ED3A8BF534CD13D5B3931A5A68655D5B708F866A38D4D8078A6678289BC478AC40A5B07EB8C5186C72F462BF6F8461CA3643846E60D766C738E52B2FADF3EF8F7D33DCE0B6938C37CB36A8149BD2639612D6BEB363CF2E57F9F6C82ADC5E92D365751C418F35DFBF5256A1ED8348577B41E0865865906F1FACAA675BA03B4D2B417E4D532D7B35D1EB444B95659FEC511821735AA98924A82526E0AB2513DE488878F5578C6E8A582639F7C92FD840BB116715CE4AB3FEF6D5120A7FCFC7CA4E7D7334D264DA2B8340EB668641D575332C83AA6FBCF45EECEDED4B02DC3213D007628C8DB56101AAEED7DE146B1C16B00786D1D2CE149709B1BC6022F1DC6003ACB8969D22B050F9EF0D6D3A61554424A3BE20C98A3DF075839A2C81E7347AE4C30E6C5DF6C99DFE372CCD39B3E5BDCA9C2FEE165FC35118BD2F9D8C45BEE555532671DC009D93551D479059F3FD2B5315EA37822C2DF137C21E6D8E3D30882ECF9C8F31B8CEC8ACD085E5FA573450C0CFE80C70A0C884BE5B9BBFFD11679B9BBEA6041AC6866FC9A2DDDAADEB95485BDCA3B3A0D210B6E7322EF5B7AFD21F0986BE9B624A93DDDB48A13593ACA6ACA6A13BAF802CA6A13D4D7CD09C7AE244C9CC21D2C242B9ED1C3D1C28C1BE0621CEDD6B263BCD5AF563CD10C4BB9621466265A0C1F0D67692623A4D809F46D8943ED1BD0DB8A122F6C5B2D22D69E30CABDCD32476D5017F4066E12F0BEE2EAB1A7786DD383260DC2FD852B09FBF9A7D21E5EB4903DC1E62B934785BAEAD11A9F743095B1A6DF96C8261D16E1D516C8B51DB3BB0B06456FFE71667FCEB5635C38597A82472950F660187FAE351E345041A4F14AF5A1D8D17F7D92CACF046E26348332F31B7CA4E07C8A90A8273A9420D7228866C30872208CBA108D5E550A97239832A04C4AF02CDE08BED5F2C8B2254914D11419395E477236527C580B29422E9B36D4E4AA02C9B5024BB26823E2B66331DCA8B09463263626872AB4D22A58CEA10288F3A50075F6D7DC8F05508085F056AE0F37D1D093AFF0AC1E6017AC8669C82A09B50248B26825ED2B08051B9DA748F72C741D53FCA289A0E52C632C9B95E8DC2B9D6C1688E750C4D6EF5E51C724E4D10944B13AACF81BFC302CC498882E428C4B2C8B9B97F40997B134D5702EC5D62A814F5AD0460E64D28926713419F553D238372AA03918CEA707D3E951736984F1D88E453870BF930931D79DAD02CE3474C3C610281ACF591D57E5D2F7C0620A5646730754A707632E1AB635255856F2D546953575C6CA3951D19F3BA68467368A52B61A82621AD9B8473F8C49B02F70BED5A7478912FA77558656EAE835759619F8159AEF012C726547D5659749553767178A3A15D61FBEDDFA04F97AAAE2A9B09D4A084172F3A85DD4ED5EB09AFA2D688F30DE494C49416994A6FA99AD5C45B554DF818103A0465AB094FE97BADA6E498015453EDBC211457DE87288B8CEF2F889B655C4268B6D4B69AF8AC03F7477034E1D860B570458B5ACD3BD1B19BAB12B76284ABA5D851C4765EF9A2624BD21EAAC8192603F5C30D971D9191596557638BA36A69663A4AEB5CA7B39C8D565139E2AB6D471D0FF69BABA662D8432D1A9D8C789BA9526337872814C0A8CE5615F4548DDAD40BA9096C0AD6A93216B26C4737D93809E69DC688C95602D8729ADB2814D7D3F0E65FCB6AB3D6325895518B9AEED51576279BAA62BB8EF6D584CC37809A6AAD3C1C8D7DF2CE5A9E56B167D6ADCAF8EC4C678BE06492D67375353337938373A7133897D5AF6E67ACCF6AEBB0C349B13D5A7EA03FD328F61E4936530992FCEBE1E4761D66D77816BF4E49660653431C52CC90CCB9B3E13A4EB664AA4EAA85125551846B27DF91D45BD0DE7B1CA7FE83374F69F03C5B528754CBE7D7851F8DCF96F76471115EAFD3D53A7BE1852CEF03AE31B2A36E55FE8713A9CC87D7F9DB7B898B2AD062FAD9CDA7D7E19BB51F2CEA72BF056ECD4420B233F4F295A04C9669F65AD0E3738D741585864065F3D547FF7764B90A2858721D4EBDEC156AFBB27D48C82579F4E6CFF4FB177F913D7F8181E805C137FBE1A9EF3DC6DE3229319AF4F427E5F062F9F4B7FF07E59C5BB707880100, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[CabrilloInfo] ON 

INSERT [dbo].[CabrilloInfo] ([CabrilloInfoId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (1, 15000060, N'EA Contest Clib', N'EA9LZ, W7EJ, M0DRX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([CabrilloInfoId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (2, 10000060, N'EA Contest Clib', N'EA9IE', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CabrilloInfo] OFF
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 1, 1, N'STN2', N'CQWWSSB2014', 1, N'default', N'default_cn2r_cn3a_cn2aa', 0, 1)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 2, 2, N'STN1', N'CQWWSSB2014', 2, N'default', N'default_cn2r_cn3a_cn2aa', 0, 2)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 3, 3, NULL, N'CQWWSSB2014', 3, N'default', N'default_cn2r_cn3a_cn2aa', 0, 3)
SET IDENTITY_INSERT [dbo].[CallSign] ON 

INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (1, N'cn2r', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (2, N'cn3a', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (3, N'cn2aa', 5, -4, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[CallSign] OFF
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQ1602003', N'Cq160 Ssb 2003 ', 3, 1, CAST(N'2003-02-22 00:00:00.000' AS DateTime), CAST(N'2003-02-23 23:59:59.000' AS DateTime), 0)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2001', N'Cqwpx Ssb 2001', 2, 1, CAST(N'2001-03-24 00:00:00.000' AS DateTime), CAST(N'2001-03-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2002', N'Cqwpx Ssb 2002', 2, 1, CAST(N'2002-03-30 00:00:00.000' AS DateTime), CAST(N'2002-03-31 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2003', N'Cqwpx Ssb 2003', 2, 1, CAST(N'2003-03-29 00:00:00.000' AS DateTime), CAST(N'2003-03-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2004', N'Cqwpx Ssb 2004', 2, 1, CAST(N'2004-03-27 00:00:00.000' AS DateTime), CAST(N'2004-03-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2005', N'Cqwpx Ssb 2005', 2, 1, CAST(N'2005-03-26 00:00:00.000' AS DateTime), CAST(N'2005-03-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2006', N'Cqwpx Ssb 2006', 2, 1, CAST(N'2006-03-25 00:00:00.000' AS DateTime), CAST(N'2006-03-26 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2007', N'Cqwpx Ssb 2007', 2, 1, CAST(N'2007-03-24 00:00:00.000' AS DateTime), CAST(N'2007-03-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2008', N'Cqwpx Ssb 2008', 2, 1, CAST(N'2008-03-29 00:00:00.000' AS DateTime), CAST(N'2008-03-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2009', N'Cqwpx Ssb 2009', 2, 1, CAST(N'2009-03-28 00:00:00.000' AS DateTime), CAST(N'2009-03-29 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2010', N'Cqwpx Ssb 2010', 2, 1, CAST(N'2010-03-27 00:00:00.000' AS DateTime), CAST(N'2010-03-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2011', N'Cqwpx Ssb 2011', 2, 1, CAST(N'2011-03-26 00:00:00.000' AS DateTime), CAST(N'2011-03-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2012', N'Cqwpx Ssb 2012', 2, 1, CAST(N'2012-03-24 00:00:00.000' AS DateTime), CAST(N'2012-03-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2013', N'Cqwpx Ssb 2013', 2, 1, CAST(N'2013-03-30 00:00:00.000' AS DateTime), CAST(N'2013-03-31 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2014', N'Cqwpx Ssb 2014', 2, 1, CAST(N'2014-03-29 00:00:00.000' AS DateTime), CAST(N'2014-03-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2015', N'Cqwpx Ssb 2015', 2, 1, CAST(N'2015-03-28 00:00:00.000' AS DateTime), CAST(N'2015-03-29 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWPXSSB2016', N'Cqwpx Ssb 2016', 2, 1, CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2002', N'Cqww Cw 2002', 1, 2, CAST(N'2002-11-23 00:00:00.000' AS DateTime), CAST(N'2002-11-24 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2003', N'Cqww Cw 2003', 1, 2, CAST(N'2003-11-29 00:00:00.000' AS DateTime), CAST(N'2003-11-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2004', N'Cqww Cw 2004', 1, 2, CAST(N'2004-11-27 00:00:00.000' AS DateTime), CAST(N'2004-11-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2005', N'Cqww Cw 2005', 1, 2, CAST(N'2005-11-26 00:00:00.000' AS DateTime), CAST(N'2005-11-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2006', N'Cqww Cw 2006', 1, 2, CAST(N'2006-11-25 00:00:00.000' AS DateTime), CAST(N'2006-11-26 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2007', N'Cqww Cw 2007', 1, 2, CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-11-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2008', N'Cqww Cw 2008', 1, 2, CAST(N'2008-11-29 00:00:00.000' AS DateTime), CAST(N'2008-11-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2009', N'Cqww Cw 2009', 1, 2, CAST(N'2009-11-28 00:00:00.000' AS DateTime), CAST(N'2009-11-29 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2010', N'Cqww Cw 2010', 1, 2, CAST(N'2010-11-27 00:00:00.000' AS DateTime), CAST(N'2010-11-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2011', N'Cqww Cw 2011', 1, 2, CAST(N'2011-11-26 00:00:00.000' AS DateTime), CAST(N'2011-11-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2012', N'Cqww Cw 2012', 1, 2, CAST(N'2012-11-24 00:00:00.000' AS DateTime), CAST(N'2012-11-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2013', N'Cqww Cw 2013', 1, 2, CAST(N'2013-11-23 00:00:00.000' AS DateTime), CAST(N'2013-11-24 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2014', N'Cqww Cw 2014', 1, 2, CAST(N'2014-11-29 00:00:00.000' AS DateTime), CAST(N'2014-11-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2015', N'Cqww Cw 2015', 1, 2, CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-11-29 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB1999', N'Cqww Ssb 1999', 1, 1, CAST(N'1999-10-30 00:00:00.000' AS DateTime), CAST(N'1999-10-31 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2002', N'Cqww Ssb 2002', 1, 1, CAST(N'2002-10-26 00:00:00.000' AS DateTime), CAST(N'2002-10-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2003', N'Cqww Ssb 2003', 1, 1, CAST(N'2003-10-25 00:00:00.000' AS DateTime), CAST(N'2003-10-26 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2004', N'Cqww Ssb 2004', 1, 1, CAST(N'2004-10-30 00:00:00.000' AS DateTime), CAST(N'2004-10-31 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2005', N'Cqww Ssb 2005', 1, 1, CAST(N'2005-10-29 00:00:00.000' AS DateTime), CAST(N'2005-10-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2006', N'Cqww Ssb 2006', 1, 1, CAST(N'2006-10-28 00:00:00.000' AS DateTime), CAST(N'2006-10-29 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2007', N'Cqww Ssb 2007', 1, 1, CAST(N'2007-10-27 00:00:00.000' AS DateTime), CAST(N'2007-10-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2008', N'Cqww Ssb 2008', 1, 1, CAST(N'2008-10-25 00:00:00.000' AS DateTime), CAST(N'2008-10-26 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2009', N'Cqww Ssb 2009', 1, 1, CAST(N'2009-10-24 00:00:00.000' AS DateTime), CAST(N'2009-10-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2010', N'Cqww Ssb 2010', 1, 1, CAST(N'2010-10-30 00:00:00.000' AS DateTime), CAST(N'2010-10-31 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2011', N'Cqww Ssb 2011', 1, 1, CAST(N'2011-10-29 00:00:00.000' AS DateTime), CAST(N'2011-10-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2012', N'Cqww Ssb 2012', 1, 1, CAST(N'2012-10-27 00:00:00.000' AS DateTime), CAST(N'2012-10-28 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2013', N'Cqww Ssb 2013', 1, 1, CAST(N'2013-10-26 00:00:00.000' AS DateTime), CAST(N'2013-10-27 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2014', N'Cqww Ssb 2014', 1, 1, CAST(N'2014-10-25 00:00:00.000' AS DateTime), CAST(N'2014-10-26 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2015', N'Cqww Ssb 2015', 1, 1, CAST(N'2015-10-23 00:00:00.000' AS DateTime), CAST(N'2015-10-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'RUSDXC2005', N'Russian DX 2005', 4, 3, CAST(N'2005-03-19 12:00:00.000' AS DateTime), CAST(N'2005-03-20 11:59:59.000' AS DateTime), 0)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (1, N'CQWW', 1, N'Zone', N'ZnMlt', N'CtyMlt', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (2, N'CQWPX', 1, N'Rx #', N'PfxMlt', N'', N'Prefix')
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (3, N'CQ160', 2, N'Cty/St/Pv', N'Cty/St/Pv-Mlt', N'', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (4, N'RUSDXC', 3, N'Obl/#', N'OblMlt', N'CtyMlt', NULL)
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (1, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 1, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', 1, NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (2, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 2, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', NULL, NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (3, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 3, N'CQWWSSB2015', 6, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[LogCategory] ON 

INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (1, 3, 0, 1, 2, 2, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (2, 3, 0, 1, 2, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (3, 3, 0, 1, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (4, 3, 0, 1, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (5, 2, 0, 1, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (6, 2, 0, 1, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (7, 2, 0, 1, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (8, 2, 0, 1, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (9, 2, 0, 1, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (10, 2, 0, 1, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperator], [CatOperatorOverlay], [CatBand], [CatPower], [CatAssisted], [CatNoOfIx]) VALUES (11, 2, 0, 1, 4, 2, 2)
SET IDENTITY_INSERT [dbo].[LogCategory] OFF
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 1, N'STN1', CAST(14208.00 AS Decimal(18, 2)), 2, CAST(N'2015-10-23 00:00:01.000' AS DateTime), 59, 59, 33, 1, 1)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 2)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 3, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 3)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (2, 1, N'STN2', CAST(14278.00 AS Decimal(18, 2)), 3, CAST(N'2015-10-23 00:00:01.000' AS DateTime), 59, 59, 33, 1, 1)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (2, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 3, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 2)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (3, 2, N'STN1', CAST(14290.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 1)
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (1, N'QsoExchangeNumber')
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (2, N'QsoExchangeAlpha')
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (3, N'QsoExchangeMixed')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (1, N'SSB')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (2, N'CW')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (3, N'MIXED')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (4, N'RTTY')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (1, N'R1')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (2, N'R2')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (3, N'Run')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (4, N'Mult')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (5, N'S_P')
INSERT [dbo].[Session] ([SessionName], [UserName], [SessionDateTime], [CategorySettings], [FiltersSettings], [XaxisSettings], [YaxisSettings], [Subscription]) VALUES (N'default_cn2r_cn3a_cn2aa', N'default', CAST(N'2016-02-16 22:11:36.207' AS DateTime), N'<CatDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><CatOpr>ALL</CatOpr><CatAssist>ALL</CatAssist><CatBnd>ALL</CatBnd><CatTx>ALL</CatTx><CatPwr>ALL</CatPwr></CatDefault>', N'<FiltDefaullt xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><FiltBnd>ALL</FiltBnd><FiltCont>ALL</FiltCont><FiltPref /><FiltCQZoneVal>ALL</FiltCQZoneVal></FiltDefaullt>', N'<XaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><XaxisDurationTime>48</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>', N'<YaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>', NULL)
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN3')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN4')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN2')
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[CallInfo]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CallInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SessionName]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
CREATE NONCLUSTERED INDEX [IX_SessionName] ON [dbo].[CallInfo]
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Call]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Call] ON [dbo].[CallSign]
(
	[Call] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
CREATE NONCLUSTERED INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CabrilloInfoID]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CabrilloInfoID')
CREATE NONCLUSTERED INDEX [IX_CabrilloInfoID] ON [dbo].[Log]
(
	[CabrilloInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Log]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Log]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[Log]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Qso]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[Qso]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
CREATE NONCLUSTERED INDEX [IX_LogId] ON [dbo].[Station]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[UbnSummary]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/18/2016 12:16:50 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum] FOREIGN KEY([QsoRadioTypeEnum])
REFERENCES [dbo].[QsoRadioType] ([QsoRadioTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Session_SessionName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Session_SessionName] FOREIGN KEY([SessionName])
REFERENCES [dbo].[Session] ([SessionName])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Session_SessionName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Session_SessionName]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CallInfo_dbo.Station_LogId_StationName] FOREIGN KEY([LogId], [StationName])
REFERENCES [dbo].[Station] ([LogId], [StationName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] CHECK CONSTRAINT [FK_dbo.CallInfo_dbo.Station_LogId_StationName]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contest_dbo.ContestType_ContestTypeEnum] FOREIGN KEY([ContestTypeEnum])
REFERENCES [dbo].[ContestType] ([ContestTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest] CHECK CONSTRAINT [FK_dbo.Contest_dbo.ContestType_ContestTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum] FOREIGN KEY([QsoModeTypeEnum])
REFERENCES [dbo].[QsoModeType] ([QsoModeTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Contest]'))
ALTER TABLE [dbo].[Contest] CHECK CONSTRAINT [FK_dbo.Contest_dbo.QsoModeType_QsoModeTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContestType]'))
ALTER TABLE [dbo].[ContestType]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum] FOREIGN KEY([QsoExchangeTypeEnum])
REFERENCES [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContestType]'))
ALTER TABLE [dbo].[ContestType] CHECK CONSTRAINT [FK_dbo.ContestType_dbo.QsoExchangeType_QsoExchangeTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID] FOREIGN KEY([CabrilloInfoID])
REFERENCES [dbo].[CabrilloInfo] ([CabrilloInfoId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.CabrilloInfo_CabrilloInfoID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.CallSign_CallsignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.Contest_ContestId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Log_dbo.LogCategory_LogCategoryId] FOREIGN KEY([LogCategoryId])
REFERENCES [dbo].[LogCategory] ([LogCategoryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Log_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_dbo.Log_dbo.LogCategory_LogCategoryId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.CallSign_CallsignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.Log_LogId] FOREIGN KEY([LogId])
REFERENCES [dbo].[Log] ([LogId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.Log_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum] FOREIGN KEY([QsoModeTypeEnum])
REFERENCES [dbo].[QsoModeType] ([QsoModeTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.QsoModeType_QsoModeTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum] FOREIGN KEY([QsoRadioTypeEnum])
REFERENCES [dbo].[QsoRadioType] ([QsoRadioTypeEnum])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.QsoRadioType_QsoRadioTypeEnum]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Qso_dbo.Station_LogId_StationName] FOREIGN KEY([LogId], [StationName])
REFERENCES [dbo].[Station] ([LogId], [StationName])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Qso_dbo.Station_LogId_StationName]') AND parent_object_id = OBJECT_ID(N'[dbo].[Qso]'))
ALTER TABLE [dbo].[Qso] CHECK CONSTRAINT [FK_dbo.Qso_dbo.Station_LogId_StationName]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]'))
ALTER TABLE [dbo].[QsoExchangeAlpha]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]'))
ALTER TABLE [dbo].[QsoExchangeAlpha] CHECK CONSTRAINT [FK_dbo.QsoExchangeAlpha_dbo.Qso_QsoNo_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData] CHECK CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Station_dbo.Log_LogId] FOREIGN KEY([LogId])
REFERENCES [dbo].[Log] ([LogId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.Log_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [FK_dbo.Station_dbo.Log_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.CallSign_CallsignId] FOREIGN KEY([CallsignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.CallSign_CallsignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.Contest_ContestId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId] FOREIGN KEY([LogCategoryId])
REFERENCES [dbo].[LogCategory] ([LogCategoryId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]') AND parent_object_id = OBJECT_ID(N'[dbo].[UbnSummary]'))
ALTER TABLE [dbo].[UbnSummary] CHECK CONSTRAINT [FK_dbo.UbnSummary_dbo.LogCategory_LogCategoryId]
GO
USE [master]
GO
ALTER DATABASE [LogqsoDataTest] SET  READ_WRITE 
GO
