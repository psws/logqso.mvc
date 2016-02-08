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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station] DROP CONSTRAINT [FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup]
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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CallInfo_dbo.CallSign_CallsignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CallInfo]'))
ALTER TABLE [dbo].[CallInfo] DROP CONSTRAINT [FK_dbo.CallInfo_dbo.CallSign_CallsignId]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_LogId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
DROP INDEX [IX_LogId] ON [dbo].[Station]
GO
/****** Object:  Index [IX_CallInfo_CallInfoId_CallInfo_CallGroup]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_CallInfo_CallInfoId_CallInfo_CallGroup')
DROP INDEX [IX_CallInfo_CallInfoId_CallInfo_CallGroup] ON [dbo].[Station]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CabrilloInfoID]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CabrilloInfoID')
DROP INDEX [IX_CabrilloInfoID] ON [dbo].[Log]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
DROP INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
DROP INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_Call]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
DROP INDEX [IX_Call] ON [dbo].[CallSign]
GO
/****** Object:  Index [IX_SessionName]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
DROP INDEX [IX_SessionName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
DROP TABLE [dbo].[UbnUniques]
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
DROP TABLE [dbo].[UbnSummary]
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
DROP TABLE [dbo].[UbnNotInLog]
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectExchange]
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectCall]
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
DROP TABLE [dbo].[UbnDupes]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoRadioType]
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoModeType]
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExtraData]
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeType]
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
DROP TABLE [dbo].[Qso]
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
DROP TABLE [dbo].[LogCategory]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
DROP TABLE [dbo].[ContestType]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
DROP TABLE [dbo].[Contest]
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
DROP TABLE [dbo].[CallSign]
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  User [jims9m8r]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
DROP USER [jims9m8r]
GO
USE [master]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 2/4/2016 10:00:39 AM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'LogqsoDataTest')
DROP DATABASE [LogqsoDataTest]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 2/4/2016 10:00:39 AM ******/
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
/****** Object:  User [jims9m8r]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[CallInfo]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[CallSign]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[Contest]    Script Date: 2/4/2016 10:00:40 AM ******/
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
 CONSTRAINT [PK_dbo.Contest] PRIMARY KEY CLUSTERED 
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[LogCategory]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[Qso]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[Station]    Script Date: 2/4/2016 10:00:40 AM ******/
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
	[CallInfo_CallInfoId] [int] NULL,
	[CallInfo_CallGroup] [int] NULL,
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
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 2/4/2016 10:00:40 AM ******/
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
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 2/4/2016 10:00:40 AM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201602040906179_InitialDatabaseCreation', N'Logqso.mvc.DataModel.LogData.Migrations.LogDataDB.Configuration', 0x1F8B0800000000000400ED5DDB72DBB8967D9FAAF907959E66FA745B9173D2A73B659F538EEDB85DEDD889E5743A4F2A5A821D4E53A4425239F64CCD97CDC37CD2FCC280775CF6C68584283A9DF28B45000B1BC0C2C66D6FE0FFFEE77F0FFEF1B00A465F489CF85178389EEE3D1B8F48B888967E787F38DEA4773FFC34FEC7DFFFF55F0E4E97AB87D16F55BCE7593C9A324C0EC79FD274FD723249169FC8CA4BF656FE228E92E82EDD5B44AB89B78C26FBCF9EFD3C994E2784428C29D6687470BD09537F45F21FF4E771142EC83ADD78C19B684982A4FC4E436639EAE8D25B9164ED2DC8E1F822BAFF9C447BAB2F8BBD132FF5F2047BF463F6633C3A0A7C8FCA3423C1DD78E48561947A2995F8E5FB84CCD2380AEF676BFAC10B6E1ED784C6BBF38284942579D944372DD4B3FDAC5093266105B5D82469B4B2049C3E2F6B6922266F55D7E3BA16693D9ED2FA4E1FB352E77579383EF66E633F08A2F3F02E1A8FC40C5F1E077116595DDDCD97648FC5FB7E04A5FABEA60F6559F6F7FDE87813A49B981C866493C61E8DF176731BF88B5FC9E34DF407090FC34D10B0C5A005A161DC07FAE96D1CAD499C3E5E933BA070E7CBF168C2634C44901A02495F54C579983EDF1F8F2EA950DE6D406AF630D5364BA3989C9190C45E4A966FBD3425316DFCF325C9EB5F9244CC37F068AF58CE16144597AB0E69735B2150E2D3DE3C1EBDF11E2E48789F7E3A1CEFD3EEFBDA7F20CBEA4309FA3EF469DFA769D278A3CDE36A9D15338A1365462E723A5A2E6392F496CF71DE54685E539779CD2873485F99BD8D92D40B8E6932458E2F5CD66444157DACAACC16B91D4C1A6DA6D17141D049BF5500B58E2B7E0E40BF1582C8BA0D8D7E16479B751B4DD8E4D4491F35229454A023F45EFDF534DCACEC31A3302549DA8806D0EBF90B237AB5284DE2DF875D6B85CE4AE2EC3F95627BF1E3364A30A39D93527537999FF84916BBAEBC575114102FB4C6A1BDB06B0BCC0A7DA0AB87562AF1D2FBE2DFE7F0007D66943EE3D13509F208C9277FCDF489ACC7CD9B58AFE368751D054C77AC03E7B368132F32D9232CC68D17DF93D442BAA25B6984AB2241B215610AD1CA08B69295A4554B564702242BC370C9AA08D69255F374A564552448B2224C215919A1A564899168894AB6442B5C024A67355C178477B11C29B0063154CFCAA1A2CDE03B331A661C2E41689EDD35618B91DC0FA980FCECA0FADA6A7670B4586C626FF1C8419E555F8B39B0ED78436B38DD3493E7938872C460940AEF5B243B235126E4F1A73FA461B25DEFAA34B683CE5540EDBE6F351340EBAEB5BBB96391B366C6F17C6BFD8CE69DE55AF429A1B7716196D8EF927C9904624B61F6B3B438A50C23377E536BCD6F4BB4D370D91E4B376DCAF0E0B1B69CF470F198D1560E96C75B208EED7C80690AA5985C3C594C261815938DD36D62C0569933F595251A8A0A6B7A464B45B6952E2DA477B348B2572BA70F8B4F5E788FAA1639BC7D1EBB2AE31BCAAF5DE6BDBF9515B0A8781F68DFC97A59BFCB6D81222AB597EB2A29BEA4FEA068981A04E3765287927CDD55A200B973B508F66A5BD5D8B3EA70AB26DB32A319B49DB0A2821B0223F829640B366C6D7E5AA6EF699034A643BD15D69D0A25D4CE69C0ED5BDB5260A79BDE3BDFEB77B67E3AA609EFA3F87146D2941641752C4BFF75306F78ED072925586FF9FDEE3DF8FDE5F6B1D7DC669BDB6411FBEB6227BA640259F82B2F188FDEC6F4BFD212E8A7F168B6F03252ECB7553FD57EB703F55324DCB9FA294F9C0CCE5CB983255B4535B4832D37C3112D950B2ED04FC3E481A37675B8975FAC403E122F76A0F4DD1C793BDC78D51E0E5703555799D9FD81CDEA96C40CDCF44783D419456FBD84CC48FC85C4E761927AE142D52F4DAD7EEC0B52893208216EB2641A15B525293813BF13811FEAA41FFC9CC259212C535E4E572B93640ACB01D66A13D8C7A0AC9FF3919ACD0B314CDAB19022589B0EA80C1B0A74D9A681FD8E88B4054B861C583662603EC3B2B4345D60B4112A0E178717890902C562C35B9C0810D83C20432E437971F28FA02045885323850C16B24F60BF83B2B8B14AE05AC5C9ECA5821BC22C861D225BCC66CC475897160A6965792C1813D6DFDB9D7634E9AFE8281D788F187C19DC3697575EB814A1B36F6DF1DE46FF245255E41F5B57C45192F8494A2431ABEF6D712FA3ABBBF30711B5F86A8069B311EA680374E79D94CA7019192D395B2E4ACA0CB819EDD76588296E27C5E4F386848D69907EFF63478BA562AAEC66D7EEFAE13AA9EDAB5E3DA6F608379D113A2FA4B6B9837FED2DFD08031702DB5B89A866C8341F7086CC7E97663A5CA06B6B900C1CB104118240B97416201AD1EA4A57C9C6449284ABC330E99A082E2D7E3370C0D897F90CCAA332F1B519F9981A713204D67843180B858ED862B073D9CF15E843DA7965F4EE51B0FEE4393619C83187408E3FC34429AFF7A6DA7FF3824D0F56432A358DE9408E1EF33C22A70CA570482BCA91BADBCE945648CE7A4189F7AD07F4D803CA3A1F34FD4B1941EA336130EDD9089D28FFFE363CD9ACB34DBC9674A70025DB2BA86F4CDF06D36D5AF43C5C44315DADA685BF8E8B96E520BFB5703FBAEC986D45A7A61FADD8548DB68E1955C17E6355AFAC6A5A7367CCBA8CD2F3B08BE10747A80AED1B8F763DFECC36AB95D7E1448C6BD6126CE7ADCA6EDB1A346D17F7C3E159D3B4CBD9896D5117539D763BAD0DE9C00D5720589AA443715C1A28B0F8B29D821CAA14704B560B4C1688F1021C4325ABCE94C1464B518A7FDEB85AF994603BD7527FB2B167B362DA54B830E83C791D78F7CD3D7E46CDBC8856AB28DCCB10F80B88B8962D62B56D56AA5C97240E1EA92E66EB80AFB337243B02AB4A767471311D8FF2FD8CC3F154AA6029F27E1D59B61F93223FAF233F97EBBDA86155ADF3173174AF75166FA7B54EABA6AE9967EA6ABC3C326D9DD99169D39CBEC7DA45127456C7FCAB26E6EB3AE60B75CCABE33AE68F2D5821DCA561CE8AFB28BA0F683BFA54AF9E91E82F1CD0F72326B83F229CCDDF877F84D13F43533A9CCDEBBBEDCC587136BF26F7F989A01937CEE6B3CD6DCC27D190E46C7EC396404394B379761DE0226F3C33C25091D2986403324C1B393EAD77DA807429CA96E26FBA54F5758F65829FB40589C9CA4F9A72FCAC4EF0DBEBF96BDA78CBA6E9348D9DF96E3591B50D7D1EBE8BFFF332A2DCAE13FDA02DF42B6F49135C6C9A24DADACD97C334AB2689B6012FF3EE5145D732E4387D8C6EFFA349A025E0F52611D36879FEDBAF629269CB418ABBECC0C930C520EE767AF0EEC307E3D9C1BB0F6F7F379E1DBC9BFEF8CC54C15CBF9F9DFC7E8C2918A366920C753A379380B8D3669ACD5E19B7D207D3267A73FEFBE9897113DDDC7CECDA40B257BC8B46125177DA5080259A59B3C9A614668DC8A47B936DC6749B908BA6CE0E16421CE26026E5BAA9F6F9E5D9C5E9FCEAAD715F7A7F7173CEC6D774A7E35F4E8F7FBDB83AEBD4A530D37197ADC600EFB4F12EAF2E4F4DE7D075EBCD8F2F8E66B3F363EB669F5F5F5DFD7A7E8AB5BE69EB34D6F72E9AA4427B2A9D684E67006F4C3BD0FC2726AEA6F3CCFFCAC4D5CC35E7FB4C5CCD34763E7DD1C4D5CC92E75306F76FEDE8C1FA52B8204883F75428F2CBF9D92FA60CB9B8FA604A9077D76FBB2A56DE23C545EBB0884FA57D32ED39BB6166899A36A25A7A2EA569391361BD775CD47F83F7546A9F1DF234157FF3E1CAB473BCBFBC387F73CE3650CBE9BC60D3EC622ECF41EEB499AE8D37CDAF8D77CCAF37C65B6ED9DD79A643DC6CFE161BE1E0A6A49A285AF879A330E71FFCE5F07C7EA7E172A4BD29BE31786F1EC8C8CAE1AF697BF8E9E3E1F83BA9202AE0EA944E002E0E5579E0292F2F05BE0A4F484052323A5A140F251D7BC9C25B0297A65011F82FD7E48EC499CF68F6A449985056F9612A9F8AF9E1C25F7B814E7C21216A20005FE69D09586725869C90350933EF565DDB98CA801A294CEAAC84CAD3D5D5C184219B86838AAB1251D298DC9BC8D087BDF0D5829A06372EF2EE1EFC3D8A83E3AABE3C268C017774BAD057DF980EC5EA8FD1DCD5CC1A8EC1F7344B0C6EC15EF07667B3BE3118C6426530D26DEADB90DBB0146A2847A2F4C84CD60753C71FD029D3093321774E5E9F368EA243652650064365A5BA7EB41533818672244A1FCC145F02D2CF17453B3557F350C1B84DCFF501B01111DE4233399B83F2CDD259823EB9575D70ABE588F4F09323EE89EF4531B8F5E5BB83E59E20BC49CB2BAEDF6DC73EA1611CC8D02BFF4A277F3D4F44B77F57FC13AE0C60F9575D40C0C33EDBDB93F7493AF28817C2A40D917B54E1F6C66F526DC939BE317A967707FC4C8C099AD83014A4920ADB9CA5DF89DB63C665972E40C4C4C36F436CA4CB1D97CCBB257A7F225799ECE58CDBEA9B9824661B4CAAC7B3ADBA1C56C7D6629CECA827717756AA9B1DDF656DC5A2A7B8B70A49DEE3B62AD40E4F624795BD8B54C90A7C05D58663D6EB26C7FA69574B1FA02A9FC2AA47BC2256D5B6A0AF5527B6406E593C62E3FE3544BD04C86F38F1C3AF48B5661DD02C4E84E8817DDCDD741851E08BEAB81D421BDE8157DB198D844E9414947D8FC31954994F6238136EFE53B245B359DD82304F79931A91BFEF0D6AA4619ECEE6F43BF16A480D61807B22BB7250BE599287642E691C280BA51218B6BFF286C6363C945AC795203D3151B74BF80EBA17B413FF76B92D08E43FD41D41A0E2BFBECDC0E61107D5F4FE1DFFA28372A9E054434162C01A53DF095A2F0EB8D277A080E572802B6DA76C7BE291763FF9027C9363576CEABEF1DC8554623DF4C72BB1DC43A796E853975F98A918DF1417C782D67DA5A39ED5E905988D9962723790A21218CE80A07B62B6C43B55B3F4266D5F5C652F76551208BCE555E0687D1BB13D3FA13B62FBE32690FB40790934C3D7C449E836338C37CAABCD1AEAB057FC99AF3D5477A23D89132C45017ADCF953B4D193D80004AEAE33610C7EBAD59D8D4FD0461017DF88044E8ECAF0E6E92C43BF3C343938D3DD55E8908F4FF9344D5D0CC3B1D2D1A19ABAC99CC8E29CA7C5458759DFA0291AAFE9E2CAC993578043E6FB84943E9949795BAB48B10C714652C074663C6A2E56044D9024BA8A5895F117805305196014E33D885104E9302A352D4354216608C59E3B8652846A9024C731094D8AA1476C4EA520B4265483549B1D4B2875880EA1DA199111AA100D42BECB23A5CEBFEA53368A0F426842F5350AD7A4494AE67006826082CD99526E42A8A8524631C1AC178D305E1DACC16ADE0691709A203D86F01A05842544B1C06C6EB157E236D1F4D8CDADF4106413AA47AAA70110501DA8C7A96F2A8670EA40018719606485CD5C6CCDC4135437B25EE4A62DB827795D0E769890465013D77101091C11267C714DAA42E1A90C558AA963335F2803D766B678F838630C0BD49A6EC0695D799C532C5E69B8EF2C542AD07B56AE24930A02DD65CDEABB43A57023325E29A8150C5812C816A665A54046303C5BD009458B4A115D01950A07DA1040B484B021D05EDD08AB7F7DA576A9857A9EA5A805D0710D165E745D6B5D0BA2AF1A03844D0DBBD442355754D502641881082FD847B4AF05C13482AD05647ADBBD1612936A482CEA21715611C9766B4272C7012A42EDB2C3498F3AED30C203333735063809512C91DBD6023E1DC3DD4C00C9F1499859C97B997AB12E0D5881B52301E4F3605BDC3E54BF68998F1418DD8394A486B61F2D0B0EED30F210E852DABE0238E370A0F4B8F1B878A6A9E437B07AC7D36F97DFA28D335268B3092066086D59F45E277D92892D5E0388192E24BF6C886B5F07B2E52D8F81EFDEB4AB05C54C07B5FE94E456CC6F4C8ADDCBACA6B12444141C606628E925DED0D052A9F1E681EA3A6A5940D58C0D3781932455CDD34C4ADACFEC0C34BC8279AC31D01219899B68C19B16E0D6A71E746B5490CC7CB05A414D8164E1216320B136908D5B35D8D66A017C264FAE08ADFD09760CAA1AECF1FD532DDA76877EE8613E759D6827BA0A2B886E35D2C7EC177B04505927667361CD897CA7BAD9CA04B97AC6AE3EDDADC30E26B3C527B2F2CA0F07131A6541D6E9C60B8A2706AB8037DE7AED87F74993B2FC329AADBD45B682FF61361E3DAC8230391C7F4AD3F5CBC924C9A193BD95BF88A324BA4BB36B7827DE329AEC3F7BF6F3643A9DAC0A8CC9821BB8C4B3E83AA7348ABD7B228466A45992D77E9CA499EAB9F5B2DB838F972B295A73968D9C7B54F900C7D572DB55E72155A2ECFF7ABCFE8CBEDDA8426D2AF5352DE72AB327C88A4CB01D00293905982DBCC08BA54747F9BB338EA360B30ACDEED550A0069EBF22CBD9828A2860722136889B5B1129FB628E50BD3B91F030CC6773ACFABD2F16A9FE688D734CDB10C42A02ACF1B2F9160101CB106BC4ECE1B5CC6C6409C3B2C1F6A5AF9EA5832AA00A034C5A27428F103BE244EA898252147BB761DF2FF72C1DF67B18D1A8CF6349F1FE5EA490FB7AF3DDA25756AF91CA60E5670BACC6F68EC3C24DF2D4725506A5A26098A1298E963DA657F8C3B158CD577324EE2638164C79451C8E77E227D903B542299BAFE648A535380B837A0DA2A5635D07B9D2A97C0A77DA9391997F879E0C211AF66438A98AE33384E39849B71A4DC6B1EDBFF91BB972FF2D3F5B8C0CE5FBAAC298507FB5E035655EBA1187ADE6AB4D0F09EF21A8E6B339D61989B2C1F2F8D31F3C18FB7D38FD045D0DB6ED2630A0492FC152F632A8148964F5C60558E335FEFE00267E19008EFB4EBCD182C59502ADD47B9CADA3C88D0F287836C81C932E7461442E60685D01391AE8D61D2050F32E01A7EE9B7A4252B4ABF011ACA82DBFC020D05BFF448311BE2CBB1468D7253701A03AB8006BBC7D1470DF16B1DE9F952185A0C17446BDC563CB0EA90136E8945A8401101CEFA468A42135BDE294BA7DB363A0664D8EA7EE7BA82E93A2CDCB070EA6597123C3964D8A001A34279AB2AFA5BDF34D0764E62606DA2C198BD3065A5F69B6FF2F2E1FC55073E4D77E9092388181A54073DCDFBD071F411582CC313FE2981FDB62CE36B7C922F6D7C5A139D75C5CC8703A2E6A32D2B6E3C280261D174BF96DE7AB6EAECC9EC35953016006CD04A6DA6613952B8F8FC48BC1254911B0AB2D6697FB148283B0506B2ADF611C935DFB6CB21742F1A551196C855D9DCECE48FC85C4E761927AE1429EB660D15AE5A5CDA523FE4DB6070FCEBE801836BCE35F19400F6C81170870D40F7E4EB44C3211540832C7BC9CAE561020FB7D482A5161DED15E3562A0662A124FDD67E7A7A9AA5372698ED704B4C2BBA2FD38F01E51D83ADC0AFD95174A5AB9FC6885933F7B2F01955FAD90AA27DA25B026C00AAF78725C42AB3E0FA65BC14686ED17E8ED16E6560BF2EC022D4161C3776A0D714289AEA862F2794342F1448DF9BCAB994F311E022B532EC01CEFFAE13A118E20CB4FE6183732C68D2DC696674CDBDA3612AEA01680351754EF52CDA87C36DAEB1B14D54CF128926FAF0D4C90C179A9103AA4D6E5ADEEB7B1D30F22DB6DF52310431F6BF2123405F8CD0B36D08180146358FCA8FC10DC72034135E5059AFC4970A2941E23041F3C1836D4D7003963028668C0023CE95018B0BB56E22F5872D95A4A64B356D3400CA5F5F0FD44E6EA2A7E4711BDD36A206CA8AFC5DA0A2330744B56E0304F8419CDE563003BB09BC976CB90FA963397C4C040CDF880A71E0A0D76D75C95779BCBD64230CD1A0B4DFCF48E785C1F6675D935DE1DC3AA5B065D320CC13463189AF8CFA20D783753D8718AB9B0C0D2418A496978EA9F39D2220E5006AFDDB472A09AAB3DA9ACFDA86A4CC4A12ABF24BB826B537CF41AECEE6C73B8B5AD2C26D57A4B3FBF46FD3CB9DC04C1E1F8CE0B12716E63D2402DA0C076113DAEE5DE22395E8B51EABE5A7EA97FD78ED7A5D333E78D9DD77AE65B9DD776523A608B5ED04594F18856E8177F997940CF1E9394ACF60AE39BCFC171E093CC65A78AF0C60BFDBBCC703BFA838487E3FD67D3FDF1E828F0BDA4F0942FFDBB5F8A37811B397C4F9F670EDF64B99A88C9EDDDC633942459724B366640000ED10597EF5F89442FE8C10A9567F4C1440439907A219F3E13ED70EC67359E6BB6331266E79F64F9D64B5312D36A3CCF2E74CFBD813356668603353327EAAC38876B26236B9CCCDDBA48FFC58BE90281CE30DE780F1724BC4F3F65946021F33BDF35888CE7B50AD61AB7F6C3DE066AE1918D234F5B2397AED9DB8066DDB371FC17ADEBA472D26E8FCD4E3C343D17F27836EDB50AC50F474794BBBE7F373975E8728D00ED41CAD19901905E6B380F97E4E170FC5F798A97A3F3DFE779A23933207F3FBA8AE930F072F46CF4DFD6227003BBC0914EC24C33613AE92066F5652F589D98AF1D46A0E72F5A357AB5B8B46BB42665A7D66A4CCC15FAF3C58FF62C60EDE0ED2B9B498E56771BB11A67F942A65B5FD7C7AC7415F0B499B1AE82BDB8CDB4CF4CA690F39945BE876CDC92E749B13C7E39BAA11D53D973CDB26F1CCBDB6BC7C6A5BC8386AD9DC90B8CBB20F2525B45C4B891774061FDC7413A771979C187D1CCC88CED7119701955D01DD52CEBB3AD406EC74BCE7DD6528BF3C93BA972C914C84E142179D73900EB215E08B2A4BFD3FCB7251AE71D6E85654B77D978C78AF2989D8E31F1C1B6EBC648EDE06ECF79D02BD59A6C224457EEF3DEDAAE0BDCF86D6F0379DF0EDA647010FCB8DB431BF721A51BB4593F32F077D6F7251D3DBBB3BDCF2A85DD8C8DAB53651C6A5495E890D26E7472A2928CEB0FF4EB35AB3B8523AFBEDE54AB9F8E2B982D2FD89C0DDAB2477001F8B00A6C5599E403DC1A49F0FB6D8DF3D1110EEFE05BC0242BBAD25A45217974A444C0D332B34E801CF640DD053FCED17797F6BB565BDBA9EAB85A854E9FECF7770488B97C128595DF68370C38D7DAAA8C539D8CC694968C703AD0B90D3D9D6FAEB0861C9D15EF8EB7147BDD6535DB6DE18C5AACD54C93D8D91AA574026234BE30A7322997C247DAF85CC95472D94D7A6B59308ED26EF3101DA66D7B079BBA8BE2157CACC139B5090EEB5A6D0862A3619107E94D352D6E4766A471911EEB7E5B9B716AEE7278273B3177422BFC973B41949ECB9D301A87E54E3095A7B22988CD02B9E5C21832BB7337652833C0F5FBB7D3DCCEA7B98C3B733965220B9F567566C744FF4B7283A4E94F54672CBC0C73FFE94DA538AFE88EF3C2D22FBA40A10BD7C7368CBC7101B28D89D0504E3E64975D6B59B8F416C2D8284DC455D9587B2ADD928DD4235E4B1D6ABCBF9D45B523F0B04721331A5E460EB6585A8D6050E6D3B60B2EC991B9377680EEC0DF98311866F01ECD7DD002F60F1E36253A37ABB3AA5338E9FE99AB10DA8063BC7E0B98B024F6BFADBC877F77B445A0F790FDD62C40B334EEB65B6D1AD859F5CFDC2236B5077A8F9ADB7262FEA28EADE576BD3C1DA03DB5C383949D1C1BD890147440FDD6C3E5CA63BCF3A0B34FC06ABB7992B58E504A91BF14DB7CCCACB7FC75E02F68B687E3A9E4927A159E9080A46474B4283CE48EBD64E1C9EF47E51E8F2A197237185186E2232FC37712346D4C1267FBE399575098D079AF2FFB02BF8DFD70E1AFBD402CB71011D579D82B6407931A5A0C39216B12663BF762394DF344F5ECA486166A5957179C2BA786438DA1A568CF88B2498CC736A814D60FB718CB578E5EECF7AD304C596748A31B1808DA314EF91A53EBFCFB63DF1CB75CEED4C6DB651B24C5B6F498650B6BDFC3B26797AB7C7B64156E78CAE9B23A8EA0C79AEF5F29ABD0FA415A577B4DEB965865906F1FACAA675BA05751AB86FC9AA65AF66AA2D789962ACB3ED9035B73376D5785B34D577FFB6AD983BF7A6565D4BE3DFE6832ED9541A02934C3A0EA22129641D537BEF59EEDED4DA506DC3113D067948C2DBBE106545FD5B31DD6381470070C1337655A124343320BBA3ADC15B05AA12BEEC68213A0175F19D3CCA61B98DEE3A549890ADD03F56847992B6E386299C744E2D9C7065831303B6060A1F2DF5B621E5644B48154B73659310ABE31549325F0DE518F7C7802BB9A7D72A7FFBD4C73CEEC781B33E78BBB75D9701446EFAB2AE326DFF1822A6B71DCBE9F6BAB3A8ED066CDF7AF4C55A81F71B37474D80A7BB439F6C0A07789FB93335C676446FEC206E3573450C0EF9C0D70A0C81AFD69ED0BF7479C5DEE079B1268187BC1258B300374AEF19A48422B32015F1F9154AF90D91BE36F8B4ADA4C7BE2527F5B7AFD9160E81B79A634795A7B78D9B498964C32A8B29A863E790564310DED69E283E6D41327B45BBABBA345FF1BC0FDD1C38112EC6B10E23CC1E6B24FB2553FD60C41BCD719623F56061A0C6F6D2729A6D304F875936DE913DDF39E5B12B12F96951E4B5B6758E5B926B1AB0EF813320B7F1CF4E9B2AAF174781A47068C67062B05FBF9ABD917523E8036C0ED21964B8337F3DA19917A3F94B0A5D18ECF2618163DAD238A5D316A77071696CCEAFFDCE2947F72AB66B8F03C9644AEF29D39E0507F3C6A1C8C40E389E2A9ADC3F1F2369B85158E4A7C0C69E625E656590201395541702E55A8410EC5900DE65004613914A1BA1C2A552E67508580F855A0197CB1FD8B6551842AB2292268B2925C72A4ECA418509652247DB6CD49099465138A64D744D06455DBC74AD9D421501675A00EBEDA8C90E1AB1010BE0AD4C0E73B2D1274FE1582CD03F490CDC8014137A148164D047D33C3CD8B36AB09247336026133C148264C0CF3EE51EE38A8FA471945D341CA582639D7AB5138D73A18CDB18EA1C9ADBEB743CEA90982726942F539F0D75B80390951901C8558163937571328736FA2E924C09E1687A4A82F2C00336F42913C9B08FAACEA191994531D88645487EBF3A91CB4C17CEA40249F3A5CC8877F6A14F5671E31F1840904B2D64756FB75B9F0198094929DC1D429C1D989F072AA4951156EB750A14DBD74B18D565695E665D18CE6D04A57C2504D425A5709E70B8A5705EE32DA557478912FA77558646EAE831759619F8159AEF02D8E4DA8FA2CB2E845A7ECE2F046433B61FBEDDFA2BB97AA9888F313E414C6488BCC5E7754CC6AAEAB2A26FEE0B97812C816139E45EFB49889493913CDC0642C70DB2A6A5150C90D0328A7DA554328A6BCEB501615DF4D10B7C6B884D0DCA86D31F13906EE7DE0687AB1C562E16A15B59177A251B757246E350A174BB17F88EDB3F2A262CBDD1E8AC8992103E5C3CD941D919159C157130547C5D2CC6B94B6B84EE7345B2D22B3D58096113587446D457969D1ED8C9E8AA918DF51FB452743FB768AD458C9210A0530A1B355053D15433525C10DBF3A1566BB7310D01409E69DC664C9B605B0C533B72D28AE9EE1ADBE96C5666D63B022A3F633DD8B2BEC453645C5F618ED8B09196B0025D5DA74381AFBE47DB43CAD6287AC5B91F1D999CEF2C0C924ADE7E26A666E26C7E44E27702E8B5F5DD3589FCCD66107936233B4FC407FA651ECDD936CA61224F9D783C9F526CCEEF32C7E9D90CCE8A58638A09821597027C1759C6CC9549D4B0B12555184FB27DF90D45BD2DE7B14A7FE9DB74869F022DB3B08A996CFEF0D3F1C9FAE6EC9F23CBCDAA4EB4DF65C0E59DD065C656407DBAAFC0F2692CC0757F98B90898B225031FDEC0AD4ABF0D5C60F96B5DCAF81EB331188ECC4BC7C72296BCB347B7AE9FEB146BA8C4243A0B2FAEA83FE1BB25A07142CB90A67DE17D246B6F709B920F7DEE2917EFFE22FB3B74430107D43F0D57E70E27BF7B1B74A4A8C263DFD4939BC5C3DFCFDFF01B265A23FA3880100, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[CabrilloInfo] ON 

INSERT [dbo].[CabrilloInfo] ([CabrilloInfoId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (1, 15000060, N'EA Contest Clib', N'EA9LZ, W7EJ, M0DRX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([CabrilloInfoId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (2, 10000060, N'EA Contest Clib', N'EA9IE, W7Zr, OK1RI', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CabrilloInfo] OFF
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled]) VALUES (0, 1, 1, N'STN2', N'CQWWSSB2014', 1, N'default', N'default_cn2r_cn3a_cn2aa', 0)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled]) VALUES (0, 2, 2, N'STN1', N'CQWWSSB2014', 2, N'default', N'default_cn2r_cn3a_cn2aa', 0)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled]) VALUES (0, 3, 3, NULL, N'CQWWSSB2014', 3, N'default', N'default_cn2r_cn3a_cn2aa', 0)
SET IDENTITY_INSERT [dbo].[CallSign] ON 

INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (1, N'cn2r', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (2, N'cn3a', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Continent], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (3, N'cn2aa', 5, -4, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[CallSign] OFF
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQ1602003', N'CQ 160 Meter SSB 2003 ', 3, 1, CAST(N'2003-02-22 00:00:00.000' AS DateTime), CAST(N'2003-02-23 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2001', N'Cqwpx Ssb 2001', 2, 1, CAST(N'2001-03-24 00:00:00.000' AS DateTime), CAST(N'2001-03-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2002', N'Cqwpx Ssb 2002', 2, 1, CAST(N'2002-03-30 00:00:00.000' AS DateTime), CAST(N'2002-03-31 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2003', N'Cqwpx Ssb 2003', 2, 1, CAST(N'2003-03-29 00:00:00.000' AS DateTime), CAST(N'2003-03-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2004', N'Cqwpx Ssb 2004', 2, 1, CAST(N'2004-03-27 00:00:00.000' AS DateTime), CAST(N'2004-03-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2005', N'Cqwpx Ssb 2005', 2, 1, CAST(N'2005-03-26 00:00:00.000' AS DateTime), CAST(N'2005-03-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2006', N'Cqwpx Ssb 2006', 2, 1, CAST(N'2006-03-25 00:00:00.000' AS DateTime), CAST(N'2006-03-26 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2007', N'Cqwpx Ssb 2007', 2, 1, CAST(N'2007-03-24 00:00:00.000' AS DateTime), CAST(N'2007-03-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2008', N'Cqwpx Ssb 2008', 2, 1, CAST(N'2008-03-29 00:00:00.000' AS DateTime), CAST(N'2008-03-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2009', N'Cqwpx Ssb 2009', 2, 1, CAST(N'2009-03-28 00:00:00.000' AS DateTime), CAST(N'2009-03-29 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2010', N'Cqwpx Ssb 2010', 2, 1, CAST(N'2010-03-27 00:00:00.000' AS DateTime), CAST(N'2010-03-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2011', N'Cqwpx Ssb 2011', 2, 1, CAST(N'2011-03-26 00:00:00.000' AS DateTime), CAST(N'2011-03-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2012', N'Cqwpx Ssb 2012', 2, 1, CAST(N'2012-03-24 00:00:00.000' AS DateTime), CAST(N'2012-03-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2013', N'Cqwpx Ssb 2013', 2, 1, CAST(N'2013-03-30 00:00:00.000' AS DateTime), CAST(N'2013-03-31 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2014', N'Cqwpx Ssb 2014', 2, 1, CAST(N'2014-03-29 00:00:00.000' AS DateTime), CAST(N'2014-03-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2015', N'Cqwpx Ssb 2015', 2, 1, CAST(N'2015-03-28 00:00:00.000' AS DateTime), CAST(N'2015-03-29 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWPXSSB2016', N'Cqwpx Ssb 2016', 2, 1, CAST(N'2016-03-26 00:00:00.000' AS DateTime), CAST(N'2016-03-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2002', N'Cqww Cw 2002', 1, 2, CAST(N'2002-11-23 00:00:00.000' AS DateTime), CAST(N'2002-11-24 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2003', N'Cqww Cw 2003', 1, 2, CAST(N'2003-11-29 00:00:00.000' AS DateTime), CAST(N'2003-11-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2004', N'Cqww Cw 2004', 1, 2, CAST(N'2004-11-27 00:00:00.000' AS DateTime), CAST(N'2004-11-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2005', N'Cqww Cw 2005', 1, 2, CAST(N'2005-11-26 00:00:00.000' AS DateTime), CAST(N'2005-11-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2006', N'Cqww Cw 2006', 1, 2, CAST(N'2006-11-25 00:00:00.000' AS DateTime), CAST(N'2006-11-26 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2007', N'Cqww Cw 2007', 1, 2, CAST(N'2007-11-24 00:00:00.000' AS DateTime), CAST(N'2007-11-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2008', N'Cqww Cw 2008', 1, 2, CAST(N'2008-11-29 00:00:00.000' AS DateTime), CAST(N'2008-11-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2009', N'Cqww Cw 2009', 1, 2, CAST(N'2009-11-28 00:00:00.000' AS DateTime), CAST(N'2009-11-29 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2010', N'Cqww Cw 2010', 1, 2, CAST(N'2010-11-27 00:00:00.000' AS DateTime), CAST(N'2010-11-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2011', N'Cqww Cw 2011', 1, 2, CAST(N'2011-11-26 00:00:00.000' AS DateTime), CAST(N'2011-11-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2012', N'Cqww Cw 2012', 1, 2, CAST(N'2012-11-24 00:00:00.000' AS DateTime), CAST(N'2012-11-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2013', N'Cqww Cw 2013', 1, 2, CAST(N'2013-11-23 00:00:00.000' AS DateTime), CAST(N'2013-11-24 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2014', N'Cqww Cw 2014', 1, 2, CAST(N'2014-11-29 00:00:00.000' AS DateTime), CAST(N'2014-11-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWCW2015', N'Cqww Cw 2015', 1, 2, CAST(N'2015-11-28 00:00:00.000' AS DateTime), CAST(N'2015-11-29 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB1999', N'Cqww Ssb 1999', 1, 1, CAST(N'1999-10-30 00:00:00.000' AS DateTime), CAST(N'1999-10-31 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2002', N'Cqww Ssb 2002', 1, 1, CAST(N'2002-10-26 00:00:00.000' AS DateTime), CAST(N'2002-10-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2003', N'Cqww Ssb 2003', 1, 1, CAST(N'2003-10-25 00:00:00.000' AS DateTime), CAST(N'2003-10-26 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2004', N'Cqww Ssb 2004', 1, 1, CAST(N'2004-10-30 00:00:00.000' AS DateTime), CAST(N'2004-10-31 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2005', N'Cqww Ssb 2005', 1, 1, CAST(N'2005-10-29 00:00:00.000' AS DateTime), CAST(N'2005-10-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2006', N'Cqww Ssb 2006', 1, 1, CAST(N'2006-10-28 00:00:00.000' AS DateTime), CAST(N'2006-10-29 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2007', N'Cqww Ssb 2007', 1, 1, CAST(N'2007-10-27 00:00:00.000' AS DateTime), CAST(N'2007-10-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2008', N'Cqww Ssb 2008', 1, 1, CAST(N'2008-10-25 00:00:00.000' AS DateTime), CAST(N'2008-10-26 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2009', N'Cqww Ssb 2009', 1, 1, CAST(N'2009-10-24 00:00:00.000' AS DateTime), CAST(N'2009-10-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2010', N'Cqww Ssb 2010', 1, 1, CAST(N'2010-10-30 00:00:00.000' AS DateTime), CAST(N'2010-10-31 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2011', N'Cqww Ssb 2011', 1, 1, CAST(N'2011-10-29 00:00:00.000' AS DateTime), CAST(N'2011-10-30 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2012', N'Cqww Ssb 2012', 1, 1, CAST(N'2012-10-27 00:00:00.000' AS DateTime), CAST(N'2012-10-28 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2013', N'Cqww Ssb 2013', 1, 1, CAST(N'2013-10-26 00:00:00.000' AS DateTime), CAST(N'2013-10-27 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2014', N'Cqww Ssb 2014', 1, 1, CAST(N'2014-10-25 00:00:00.000' AS DateTime), CAST(N'2014-10-26 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'CQWWSSB2015', N'Cqww Ssb 2015', 1, 1, CAST(N'2015-10-23 00:00:00.000' AS DateTime), CAST(N'2015-10-25 23:59:59.000' AS DateTime))
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime]) VALUES (N'RUSDXC2005', N'Russian DX 2005', 4, 3, CAST(N'2005-03-19 12:00:00.000' AS DateTime), CAST(N'2005-03-20 11:59:59.000' AS DateTime))
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (1, N'CQWW', 1, N'Zone', N'ZnMlt', N'CtyMlt', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (2, N'CQWPX', 1, N'Rx #', N'PfxMlt', N'', N'Prefix')
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (3, N'CQ160', 2, N'Cty/St/Pv', N'Cty/St/Pv-Mlt', N'', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (4, N'RUSDXC', 3, N'Obl/#', N'OblMlt', N'CtyMlt', NULL)
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (1, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 1, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', 1, NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (2, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 2, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', NULL, NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [CabrilloInfoID], [WintestDataID], [N1mmDataID]) VALUES (3, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 3, N'CQWWSSB2015', 1, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', 2, NULL, NULL)
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
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 3, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 1)
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
INSERT [dbo].[Session] ([SessionName], [UserName], [SessionDateTime], [CategorySettings], [FiltersSettings], [XaxisSettings], [YaxisSettings], [Subscription]) VALUES (N'default_cn2r_cn3a_cn2aa', N'default', CAST(N'2016-02-04 01:07:06.233' AS DateTime), N'<CatDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><CatOpr>ALL</CatOpr><CatAssist>ALL</CatAssist><CatBnd>ALL</CatBnd><CatTx>ALL</CatTx><CatPwr>ALL</CatPwr></CatDefault>', N'<FiltDefaullt xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><FiltBnd>ALL</FiltBnd><FiltCont>ALL</FiltCont><FiltPref /><FiltCQZoneVal>ALL</FiltCQZoneVal></FiltDefaullt>', N'<XaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><XaxisDurationTime>48</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>', N'<YaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>', NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (1, N'STN1', NULL, NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (1, N'STN2', NULL, NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (1, N'STN3', NULL, NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (1, N'STN4', NULL, NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (2, N'STN1', NULL, NULL)
INSERT [dbo].[Station] ([LogId], [StationName], [CallInfo_CallInfoId], [CallInfo_CallGroup]) VALUES (2, N'STN2', NULL, NULL)
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[CallInfo]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CallInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SessionName]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
CREATE NONCLUSTERED INDEX [IX_SessionName] ON [dbo].[CallInfo]
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Call]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Call] ON [dbo].[CallSign]
(
	[Call] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
CREATE NONCLUSTERED INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CabrilloInfoID]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CabrilloInfoID')
CREATE NONCLUSTERED INDEX [IX_CabrilloInfoID] ON [dbo].[Log]
(
	[CabrilloInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Log]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Log]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[Log]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Qso]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[Qso]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallInfo_CallInfoId_CallInfo_CallGroup]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_CallInfo_CallInfoId_CallInfo_CallGroup')
CREATE NONCLUSTERED INDEX [IX_CallInfo_CallInfoId_CallInfo_CallGroup] ON [dbo].[Station]
(
	[CallInfo_CallInfoId] ASC,
	[CallInfo_CallGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
CREATE NONCLUSTERED INDEX [IX_LogId] ON [dbo].[Station]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 2/4/2016 10:00:40 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[UbnSummary]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 2/4/2016 10:00:40 AM ******/
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup] FOREIGN KEY([CallInfo_CallInfoId], [CallInfo_CallGroup])
REFERENCES [dbo].[CallInfo] ([CallInfoId], [CallGroup])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Station]'))
ALTER TABLE [dbo].[Station] CHECK CONSTRAINT [FK_dbo.Station_dbo.CallInfo_CallInfo_CallInfoId_CallInfo_CallGroup]
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
