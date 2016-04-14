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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo] DROP CONSTRAINT [FK_dbo.CabrilloInfo_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo] DROP CONSTRAINT [FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
DROP INDEX [IX_LogId] ON [dbo].[Station]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
DROP INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
DROP INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_Call]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
DROP INDEX [IX_Call] ON [dbo].[CallSign]
GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
DROP INDEX [IX_SessionName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Index [IX_CallSignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
DROP INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
DROP TABLE [dbo].[UbnUniques]
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
DROP TABLE [dbo].[UbnSummary]
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
DROP TABLE [dbo].[UbnNotInLog]
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectExchange]
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectCall]
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
DROP TABLE [dbo].[UbnDupes]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoRadioType]
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoModeType]
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExtraData]
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeType]
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
DROP TABLE [dbo].[Qso]
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
DROP TABLE [dbo].[LogCategory]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
DROP TABLE [dbo].[ContestType]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
DROP TABLE [dbo].[Contest]
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
DROP TABLE [dbo].[CallSign]
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  User [jims9m8r]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
DROP USER [jims9m8r]
GO
USE [master]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 4/11/2016 11:19:14 AM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'LogqsoDataTest')
DROP DATABASE [LogqsoDataTest]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  User [jims9m8r]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/11/2016 11:19:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/11/2016 11:19:14 AM ******/
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/11/2016 11:19:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 4/11/2016 11:19:14 AM ******/
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
	[RxRst] [smallint] NOT NULL,
	[TxRst] [smallint] NOT NULL,
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
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[Station]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/11/2016 11:19:14 AM ******/
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
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/11/2016 11:19:14 AM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201604111750351_InitialDatabaseCreation', N'Logqso.mvc.DataModel.LogData.Migrations.LogDataDB.Configuration', 0x1F8B0800000000000400ED5D5B73DCB8727E4F55FEC3D43C2527BB1A8D7CBCD9E392CE295992B5AAD5CD1A79BD7E52513390CC2C87D4921CAF94547E591EF293F21702DE71E9C685C470385E975E3404D000BA3F341A4037F07FFFF3BFFBFF785E06A32F244EFC283C184F7776C72312CEA3851F3E1E8C57E9C3F73F8EFFF1F77FFEA7FD93C5F279F44B95EF55968F960C9383F1E7347D7A339924F3CF64E9253B4B7F1E4749F490EECCA3E5C45B4493BDDDDDBF4DA6D309A124C694D668B47FB30A537F49F21FF4E75114CEC953BAF2828B684182A4FC4E536639D5D1A5B724C993372707E3F3E8F1F724DA597E99EF1C7BA99717D8A11FB31FE3D161E07BB44D33123C8C475E1846A997D216BFF99090591A47E1E3EC897EF082DB972742F33D784142CA9EBC69B29B766A772FEBD4A42958919AAF92345A5A129CBE2AB934118BB7E2F5B8E622E5E309E577FA92F53AE7E5C1F8C8BB8FFD2088CEC287683C122B7C7314C4596635BB9B2FC90E4BEFBB1154EABB1A3E1465D9DF77A3A35590AE62721092551A7B34C7F5EA3EF0E73F9397DBE837121E84AB2060BB413B42D3B80FF4D3751C3D91387DB9210F55E7A23025497AB6188F2606B9BD2098F98FA19C7D7F22565717976B2AF845514687CE7874E13D9F93F031FD4C07CBEBF1E89DFF4C16D58712751F429F0E345A268D57F4E725EDAC771F903A7DA2AE99697551F55998BEDAB3A7137874242E66F328265D29ADEE156CD8DB356283BA8E2BFAC34BA3385156E4A2A6C3C52226496FF51CD1E1A9A86BEAB2AE191DE4A4AFCAAEA324F582235A4C51E36B979C8CE8E412AB98D9AEB64BEF8BFF986B4764248E473724C833249FFDA76212E2F4E25D93F35D1C2D6FA24050C47586BB59B48AE719C72255AE5B2F7E24A9454B0B6D65D0D02A23D6CE225DD3CC3213D4CAFD49332369E6A98A652EE6A882D6E6E7A72E338EB1DE675835A32A939C9230539E6471EDA52989A95172B62039BF4DE69AEE9ADD723AB98EC983FFAC54536B9957296AFD90F2E5245C2DEBDAF311C2A758D23D9CCF57B1377FE1489E565F0BFD6849F29C0A375D358AF538A2F0D497A256708B62A724CA1A79F4F9B7AADCDB888E792F6C3BB02B15E3605C17A4363FAC31B373D076645173F64355F7DAC61AAD3BAB151C6D5C9A25EDF74994C91FA42DA559D2A606549C5284915BBFE15AF3DB92DA49B87046EB709EFA5F8834427554741643460EB61ACA399ECBC7180D72B26C3300796C0D1B46A0CA6672F9E46632C96833D93CDD2C1B9665CE94605668288AB0195F2DD5E15A1483505EA3F8D663DB50109D3CCF3F7BE123AAA0E4F4F6756CAA8F17145F9BAC7BCF4DE51AF5FD4CC74E36CAD652994AE5B11051A9BD5C5749F925F50765C3D42098B7933A94DAD75D250A2437AE16C1516DAB1A7B561D6ED5645B643493B6135454E4868008DE106D8186B559B965F99E2649AB1DA14EA716150166576818A71665432C8E2D4EE368F5D46E0FA9AAA9D38E7FD304D640ABBE7631CF3674A292383851F990905837605EFFB08E1ECC4892417533951FFB49967B61BDF894F6A71EBB4A6056E8833EAC3FAA246FBC851F611A58486CBF10571F3214E31939601012815D7B3187DB83858A3A74A8C0A7299AA6384CD098C9B508D4CDE373026D6433E00DE572D9B6B61CC0EA86D6998036966978F3AA0CD62DAB3C11942DAB32412D2BD2142D2B33745D45304274622CD6F4366E20C8EAA485B9E8525B29A80FC962AC074C773C94A4360E056EA6B745C146CD848D5B47CEF6DA8F68C1C7287E999134A55D50B98AD07F1DD81AEFFC20A500EBADBE5FBD67BFBFDA3EF55ADB6C759FCC63FFA998AF4A2490B9BFF482F1E83AA6FF951E913F8E47B3B9978162AFADFAA9664507EAA728B871F553DAE806AB54CE14B75554435B0AB8998E68AF5C60817E1A260E1CC9D5A1FB4AB176F844BCD881D277B349E0709B43BB9CAE26AAAE6D664F9456CB7B1233E4A63F1894CE207AEF256446E22F243E0B93D40BE7AA7169EA8968DF91AA298368C46D564CA3A2D6D48A8F7E8EC3AC2567C7023CD4252FA7CBA549B1765B1A14B6E06E06FB5D5A4B72892EF73072C2F2F605F3196E4BCB4D0B66CCA2CDE1F2F04D6292C066B1E92DF653488236AA4CE59B937F041B52A4B4DC8AC05BD164E01B527D07DB522776DA7FE0A4E2648EAFC80D61AE6727921673BEF93CE4D27535AD6206644F1231CD7E015895BFA2F359E0BDA8AAE0B2D8D7F4D60B1710F9E6BB3DCDEBE80F02B28549B0A77A4897D909951544984FB3A77D195D3DDC3E4394D91437763AD54E8EB610373E76691B2E23A3F55A4B8BBEAC803307BFEA739F7731F97D45C2C69F5BBF79B0A195466167BAD9F2BA79BEC92CA02E62BEED4EA2F33A649D2E139B3F0DA4F580A633FB5D3281B844D7EEB71971C4F5564802DBA573B9ED74FE5756001EFD896958EB3A1CF8298ED532E2C0891AF3196C8FAB73B46A881D064F9F3DC7EE7839CD6FB3623FB362CEF786EDBF78C16ADD7BA19A1189C19D83C75D9E91C3BD940E0D003953F791507AF83A1B0525BD6F23A0C71150F27CD0F02FDB08429F498361CF66E804F90FF7E1F1EA29DBC86909774AA0447B45EA1BD2D781741B899E85F328A64B93B408E67521598EE43709F7A3CB8E58293A3D246F85A66AB6758CA88AEC3754F58AAA469A1B43D665949E855D8EC8394055D4BEE168D3F3CF6CB55C7A1D4E4538B196C4362E55768FCE2464A3C30501C3F33B6857B3132F8C2E4E0DED36D51AD0817B6B40B264A443795C1E52B3F4E5B36A3955D9C0359D5C33552007D8700E555B75C7D9365A8A42FCF795AB954F496CE35AEA4F36F7AC968C4C854B7BCE927781F7D8DCFC6824E679B45C46E14E4681BF0488936C91ABAD58A9725D903878A1BA98E501CFB30B929D76943D3B3C3F1F8FF2DD8C83F1AEC45E2EEBE5619D73AACE396B72CA9E3C5CCE930F75CE57EA9C87B33AE75F3539DFD5395FAB735E1DD5397F9071512040810AE1DE2573543C46D16340E5E8D3117E4AA27FE3087D376292FB03C2E9DD87F0B730FA233485C3E95D7D479E192A4EEF6EC8637E0C61868DD3BBD9EA3EE68B6840727A77CBF6400394D3BBEC5AC1792E3C33C0D026A531C9A6061836727ECA772A40BA28627BF1EFBA52F5B59165811FB51D89C9D24F9A7EFC4D5DE0977777EFA8F0168DE834C2CEE22D9ACC5A419F85EFE3FFBC8C28B6EB42DF6B3BFDD65BD002E7ABA68896BBF9C28C56D514D10AF0321F1E55762D428ED297E8FE3F9A025A00DEAC12B18C16E7BFFC2C1699B65047D295364EA62986E24627AAA3F71F3F9A6A1A9AF7FA57533573F47EFAC3AEA982B9F9303BFEF5085330466292BC033A8B49A0B85131CD666F8DA5F4D154441767BF9E1C1B8BE8F6F6535701C9779FB810924875A38202DC5FCCC4261FEA9B09912977916D0B60F234D375FCED10DD351D4B6FB37A8E5AE453E3214433EF192B3A9AF95527AECBBE472E86054772308B210DE76FA6A66CBFD933D65C2B63D335BB97CCD4689DDD5D9BDAAB9757972798956A382E056768072393A3B82DF8989D5D9E9E9FDC5D5D1BCF711FCE6FCFD8FC1AB01CFD7472F4F3F9D569A7A90E732C77293586F04685C7615BB3DCA9A57777747E389B9D1D598BFDEEE6EAEAE7B3134CFAA6D269FCF25D88A4A2B62D83E88E5AE617A603E8EE4726AF66F0DCFD95C9AB51B5777B4C5E8DAABD9BBEBE30D5B57753866E4B5DCB4458B8C0474D6E5B00F2D3D9E94FA6F838BFFA680A8FF737D75DD52A1FA2E242382CC56D914FA63B67B7CCDA4D2323AAA3EFA432EDD6075C288F0BFE37F4B685FBEC84A761FCEDC72BD3C1F1E1F2FCECE28C1590D110A1F08DE67ECEED5A46D0A3267CCD27E16264F4C2491320C1BF499519CAFE13E5BB9FBE1C8CFF22754D57417514C855509DDCF2C4A77CDB29F1ABF098042425A3C379F17ED79197CCBD057087056D06FFE5863C90380B4ECC5EBD09138A203F4CE5A3373F9CFB4F5E60D205A130EA89003F299235B2AE4E4C39264F24CC42294D64D5BD1D75750213753CDB9F3020D4605371E7310A20930B901918B137B75BC0D4E0EA643E5C88BF10797098D5F7C70431E0A65D1708EB85E9B059FD219A7B63418331F8C10509C12DD00B3ED3603636068358A80F46BA4DFDAC411B94428272D4941E91C9C6F6E9F00306FB3941261426C8EBD3260071A8C804FA60A8AC54F788B742262028474DE90399D06B7666F6A3E81CE7DA3E153CEBF4D81F003A151DB0D0564E6D535E4C9D5BD10B26C55B9A71C0A05736F38B197B2462373D6FC92A09697EAF2B244436A66D40FDC5FBC5A05627623773BB42E056EA41B8F17DEA40582C5BA5FFB8EB16B440812F60708442F0F206DE68646E86182C1EA16E181A6BCA1BC5DB61139298ABD6F489D3EADE702D8AA45BF71DA153BCAC9FA15BDF693E584C0A8D370180E256F376481404E3A00DBDE2AFBCFC458F13F13A1857F813AE9261F1575D4CC393DDDDD9918F363AE2886F84890C91EBA96179E31754B7C41C2F8C9EDBDB033EB9AB59310CC1F7B436F8C9237CCD2109DEECBA156B16A8E53D2E5720396CC54A85BD7257890A7C7DD20663D6AB12771A0FA8BFBF8505C0CA6D5853883721AB640B869376420B1479CA536C225C87A89780F61B4E57F84DC0D6A803C4E2A4113DA08FBB6911030A7CED22B7C4B4C11D7851A3D14CE8444941D5F7389D41CCDC8AE94CB8C7528916CD11590BC06CF3D118D27EC30D0567C76288601C35A33F04EA77DEC48CEE30B8C55B6D580F7ADF65C3A4B3451B6CEF13FDDEC67BE896DB4EF8DBE4660650FF50F73100C67F9D5B18EFF3B74A54E6FD7BFEE112E552C1A986829A016B4CFD2068BD38E07ADF010296CB01AEB79DAAED0947F56B332A19CA4FCF6C0A4DD23B377A3DE81054221FFAC395D8EFA1434B0CD6CEEF0456CC6F8ABBB1419FE23202DC60C6D35463A698DC4DA4680B0C2D20E82AAC35E14E2596DE5ADB1756D9BBAB9500022FB216305A5FB86E8F4FE81AECFEB009D43E505C0262F89A30095DD888E146797B63031DF61653F3B587EADAC7AD38C15274A0C79D3F858CB6620310B89DD30431F8E95677346EA1071EDE7C231038392AC3C5D3B90DFDE2D0E4E04C771DAB433C6EF3699ABA1B8673A5A34335B5C89CB4C5394E8BBB5CB3B1414B3481FFC5ADBAC76F81B8EF0F092943BF93F2426A116219C51949818890F1A8B93B168CED90E02AD2AAE66A804E95A4A351A9589944956246A1D82FC7A814A91A4A52A8A9444DCAA1A7D89C2841D49A54035EA332AB92F4AD618E16A0E630C91A5AB5E3A544A64ED151A87659640A558A8642BE632495CEBFEA4B364A14A2D0A4EA790AB3D2066DE526840A6E6516139AF5A211A657276B6835CF1F49749A243D0DE1C11D889690C58266F35087926E934D4FBB79780322D9A4EA29D5660044A84ED4D3A92F6387E8D489021D668281953F737F3F9317980690752367BEA8EFB6A8FB244E3FD28C6A7A990547119969263C0B4CD8A3B833016292E9150B7CC70C2E5960BB87CF5FC66401AEE926B2D6CCE3C2F371A6E151FC50AFC0387E9949260C0203F7CDF8DD8129DC4C8F3305F58C017B02F9C7B4640AE418C3A30535545A30050A4AD62A2168B340A131840D83EE2A48D825D033BA1567C4D058902DCAF859A10B5804ADA0410D988185CCAE49178B119A4A4E18800389E36CCF875E01C1DBE60A56E0AE4D7037400FA7D64C019D9B7845822F313AB0A75E7328380386B1C1DD1003D95AF3438C5C630861CBA42E5CA8D64D2A2E400E4748E305BFA3F65C105C8E582E204B3D7B2E70E1380007F0701DAED160C00ED360C0F6C7CBAF5745B2A1215887B58A118A1DB1ED6E1F9A508C70403A8CEEE54AAD86B6712D3B0EEDD4F224D06D047B06704EF640EF71277CAEDDA01B3EAFA195FD06FDEED7836FD1571CE9B499D18C39945B76BD5743597255C6396032E7A30ECDF63CE8739267DD641106E82735C88FD6B2DBBDCD62854726A2E000774D492FF10E9B964A8D77B354F3A865076B5741A48FB02BA1D452C999D0B2A7920BE05A240A3AB0C138D638BA8988C45DDDE08D1E700B594F746D5090DCA530AEA02E5572E321A72A911BC806B89AD8DAB800BEA82A3342EBC7831D27AB267B7C1F5A4B6DBD533FF486AB9A275A4357E14DD28D237D58BFD87BB14A9E98D9C21ACF864EBC598B815CBD785A9F92D769FB93D9FC33597AE587FD09CD32274FE9CA0B8AD768AB840BEFE9C90F1F93A664F965347BF2E6D9D2F5FBD978F4BC0CC2E460FC394D9FDE4C26494E3AD959FAF3384AA28734BB387DE22DA2C9DEEEEEDF26D3E96459D098CCB9894B3CD3AF6B4AA3D87B24426A069A0579E7C7499AA99E7B2FBBECFD68B194B2353E01C8F951550F70EC2FCBAE3A57AA0A65FFD7F3F5EFE833BF2AAA0D53DFD17E2E33BF8CACCB04DB89958A5302B3B9177831FE74F75114AC96A1D6A148418B71CAE388299CF514D402CF5F92C56C4EBB29D0E3526C28AEEE454AD917730AD52336094F86F96C4EAB7ED493A5547FB4A673447100D22A12ACE965361B01099629D614B3D75533179E054C964DB6EF7DF5F62CC4802A0D702F9E08A34A1CCC1369340B8A55D41086FA03B5395AEB0E98A291DEC08AF634CE733705918E0D85EB983CF8CF3C8DEA9B453BF847BD456DC82459A0B37CC859C065FDD59CD2399DBBD39538749AAF1694A2F01122D57C36A7754AA26CC01E7DFE8D27C67E1FCEA843ADDAB6830E266832E6B092BD4CD345A1225216A00687D06AE935F1DF004D3C381CA7FB5EBCE180A52B259AD3A5F3579CD983E4D61739202499D3A4063B4C914BB0511CA9FF459C27CB6F431B50C84669B7410511351F5870E9BE012C1445071C9FC16A80C8AF89088344FFDC88117DB9ED52A2DDC05E058002E212ACE9EDA104F76C29D6BB5532492169308351EF33D772406A081B0C4A2D8501001C1FA468A621895E7166D75EEC18513391E3A5FB9EF0CBA2A878F9C4C188B5760B71BA4A6CBDBB841555ADEBB212D02AB1FA6EB74ACC5F649789959FADE765677B5E09B216C64243716A1F1212CB106DBE5A18B9EC8DD39C89ABBA8A1AA777EC27DE7D40845E365F6DD69F8F22B3D07B7E14267C0AF74E750B104EEFBD748795A02234375C6D52F5AB9C15DAEB7E94AA99F257145F9F0C4C28831380903A18E9E24E962D058B103490295AB22F05E45C35223B0062A2CD54509CBE517EA5D97998382188A9E694DFF9414AE204262C259AD3FDD57BF611AA429239CD4F38CD4F6D69CE56F7C93CF69F0A27124E5C5CCA70062EEA42D576E0C2044D062E567288F3F386C495F93739131540CC404C60A9758AA8B4763F112F06CDE022615386B04B135DB87840E09AEA4E029C26BBFBB5CA5E43C737C7CA642BDA95B7C28CC45F487C1626A917CE65BB05CBD6AA2E6D2D1DE9DF662B05D0FC027298D7F0D1CF2191D1383BE6490B49E6342FA7CB254490FD3E24E5A5704C6AAFC430A266CA0C2FDDE730A5A52ADF0C60675F4C6C45F78A8EBCC07B5192E7F258D5F2D60B1720E926C18ADE75F4078159C1A458513CA4F6729212B8957CA215DDCBE8EAE1F619A4CA260D6618C2EEB4ED17E0EDD6DD56CBEDECCA3D4115C3B7F00DD15444D74A31F97D4542D1E782F9BC299BA698E980352797604EEFE6F92673876529959FCC69DCCA346E6D69ACD9165AD791C0D66EF8F11108EB38E70329DB1DF4212486AE8DF21E341DF8C50B56D071A0946358F8A86232DC6203A16A8A0BB4F85660A26C3D06083E793068A8AF967286048CA2010AF0A24341C0E6A4C45FDAE5525A4ACA6652D390188AF4F0BD24E63A347E3709BD276D2068A8AF5A5B0B2230EA96A8C0C96C09329A0BED007460B7DD6D1621F5CD792E81811135C3035E7A2830D89CB8AA483F97D242689A090B2DBC7DDBFBAE0F32BAEC436E0E61D5CD952E1186D03443185AF84FA10DA4B05A314B5D7BF9A5FE5D87D59621AD5CAC6DDEEF2C7236EF6F5286D78A31AE4596F18832E78BBFC8E25B672F494A963BC551F2EFC151E0D3FE36192EBCD07FC81CD1A3DF487830DEDB9DEE8D478781EF25451C7419BDFB46BC2FDB289C77FA2A0BE7258BE5442C6E1F149C5149920567843210AF75151609BBFF337911C56C779BBECD5314FB13B1BA7D5C0F66ED3F187FF1626A6EC4C0D5E467E1823C1F8CFF2B2FF96674F6EB5D5DF8BBD1554CA5F866B43BFAEFF1E8C27B3E27E163FAF960FCEAF57874B90A82EC5CED60FCE005897C858C22B6AF68929F21C5A4397549BE3DB60DE0827B992658D3C9427B05AE32BCD9DB6549E677BD6B283251BE2AB2D674EB98DF75502DA27F71CAD3D694CB30E0759066438171FAAF5BF3A40A086E4F9B9D1C34BA087C26C84C0F75D12CF038CE27EA53126648268B6B2F4D494CD5F859F6EC428E9416EAC242779D258559F066744B592A682B7E441A555F45F9AA4068DF273EDAB7BD0A6AE27CDBD368227C0B1A0F41E4A5B6B867627B3B5061837A0B32F7BE8688F930015F2FEA365B77997E3B4EA26C20AD82723B6C72D1889673345FBCD3442D9DBED9354528DEA92942D86ED19005FD9DE6BF2DA97121BB1D695531BBE0780128D80E18D9C5DE6AD060079CC64307947E374CEB464D8B69020C13B486AB48A2EBE8E1C3675D77B809A45D07E53D3BD226D38B1058DB9EB4F11852C6A59A8D23830054FD58D2C1B33BDAFB64291CF769CC4E954787112BD149A9DDFCE64425592D175A6F5B28022B91EC60E8A4D9E2A2AAA983DE6F1AD0C13E2EB6F7EC94795EE88E7130EB6A7D348E6AF6DB387863A6CA0592894E1DE6FE52D27A7F29E9BEBFD4448C29C6F3EB1FEC51C086B5D9339B298EB2BB4DB39A085D531314D484823B9CB5EDC495B7909FCDC483C49C1ACF3C4A973FA3A907E752078EF737F980319E66EC530475EA39A71A3A1DE1BFE6D1EE6C9D28478716049F9781ADCE97E2415B531262405BD3F9E4880E1FEC59904996745A584621797164C182F192668300396A84860BEEDBAE1F2EED4D9EB599396B5147922F490729B4E1AAF3BD72D61FA1B3BED8B019D5AB6569B6C7CDF966588F8EA6B0B37D9D32DA815154822D60D22F4598A7F1D19B69CBE548CFB555C1C47ABAAD4308FA046D3013BEB3B19E86446C341B1C1F69ACE1703724234D878C14F7A78342846597CD02389AB213C52688B213192674B2131D3E5AB213293644D29490CD5AABE5120BF2E67237859715E0FAF6DB8E52E71D25268EB23461C8DCA7ACCE9CC9E87F49EE1536FD91EA92B997D1DCDB3ED3860BC7EC68A79501991D2179EB84CA3A4C93A19C006FC91695223A72D83AD48C8597918375662BFD0B553E6D6BBE4BD19D7DAC76F118C96FC8180C32F830CF3E6001074D0E1B129DC5EA8C758AC8C53F330BA1ED1C2614B2201396C0FE97A5F7FCAF8E16BEFAB0C16F6201C4D2C420AE55347004DF9F592236DC0343EACC3D37B0203AC71EAF9B5E5C0DD023C1E1B6FC4636A16D400A46E57D1BE132F3980733EBA1D3449521AFC632EF76D619CA96E4CF89361F331F4AFF29F0E7B4EA83F1540ADBBC0A8F49405232CA1C88B32D95232F997BF2E35C59F317781B983838BE1D6C02DF96BF485550C19238DB01CE4272C284DAC0BE1C2C791DFBE1DC7FF202B1FF424654FF610FC7ED4F6AD262CA31792261B6370DF5B77BBD357981E33A7E70AFAD6A30D5B83E8B1EC628B2C47CAC60A5B47E70C6F8A2733063BFAF05654A9E21423770D9B5439DF2C1AAD6F5F787BE3B3C96A0938CD78B36A815EBD2659612D63E19668F2E57F5F6882ADC159CD365751E418F35DFBF5254A1FC41A4ABBDED704DA832A8B70F5471D617182DD84A985FA3E965AF327A37BC54D5F682A62280615BECF83228446CC35767BFA3CF9359EE99F48BA12DD0461B00D006B4900D7C86A28114810B9C9DD464120C2526E1AB0513CE2444BCFA1B9CD7052C939AFBC4171CD4D188B34A67A5597FFB6A01853F846615DBB23E18692AED154160440483A0EA362F1641D5375E7ABB3B3B5349801B4602FAB2967180072C40D5F305EB428DC306F68030DADAED30C0B33351B6FAFCF7576376C337BE0ED0E2CEF1E2CED8D628A31E85DEBBA96C2CF20D5BC999C4F160094E56751E4166CDF7AF4C55A89FE8B28C1A590B7AB435F680206A8E3B9F63709D91454608CBB3AF68A2805FA51AE04491097DBB8E1FFA03CE268F1D4C01348C23871245DBB53BD32B9036B8276301A5216CC76458EA6F1DDD1F0886BE7A3685C9F62D9C69CF243F3E2B3374EB15908519DA93E183D6D413264A640E111616CA6DEBE0E14009F63509710188777220B7D538D64C417CB023E2A658261A4C6F6D8D145333017E69645DFA44F7D4E69A9AD817CACA40B9B523AC0A9894D05527FC0991853FD4B9BDA86A026CB6E3C8800908625BC17EFE6AF685948F910D707B88C5D2E07D773606A4DE0F256C61B4E1B3090645DB7544B129446DEEC0C21259FD9F5B9CF08FC5D508171E7693C055BE3F07F8488F474D5C1BE87A5C3C1277305EDC675658111FC7E7902C2FB1B66A42056AAA92E05AAA545D0D95A2952BA85240FA55A219F9627316ABA24855545364D05425C56549D54939A02AA54CFA6A9B730CA8CA2615A9AEC960800614775512860623BCF19BE9506F9864A43B4C0E4D6DB50B9C54519D02D55127EAC8575B1F32F92A05245F256AC8E7FB3A12E9FC2B44364FD0936CE6298874938A54D164D04B1A16302A579B0158EE38A8466099453304CB5C2635D7AB51B8D63A19ADB1CEA1A9ADBE2E46AEA949826A6952F535F0B7AA80350959901A855C1635373762286B6FB2E95A803DF30DB5A2BE2703ACBC4945EA6C32E8ABAA2D32A8A63A11A9A84ED7D753DD0B00D6532722F5D4E9423D8CB1031B29CD527EC4E405CC1564CD8FACFAEBFEE1B6865052B69BCAD20A7B68C277CFA4EB8A686F8801A6C1E1D8C62B3B53E6FDD1D80FD0CA57A2A1327B5AB3840B41C65981472A776D3ABCE897CB3AEC32675DE15D56F86B609E2CBCC43113AECF2E43C19BDA210F6F40B46BF466C6BB146508F659198AE84CC5F1E6795DD2795755D25505CC39926C4FDDE4D7128ABEAABC645017227E00A38B96CD74BD5EE2287A8D84D74061474C6B91C5D386BA592DB554DD840F7EA1636FB69BF022AED76E72A1174017F1D00C470A89319FF342903DDCB25BB8064203089C289FF575895B3CC3DD526CAE629BD07C53B1D5790F5DE47CB481FEE13EDC8EC0C86C38544AD751B734469ED251D9A981B7D62E2AA742B51BADE359707DDD54CC07A873A793A9603D5D6A5C08118502F817DAAA829EBA517BBD213D81BDE23A75C64296EDE026FB69C1B8D3F873D94A00DB49E0F64CC5AD04781FB465B759C721ACCBA87351F7EE0A1BB54D57B10D58FB6E429E2C404FB50E2F8EE63E7993312FABD83EECD665DC3AD3B9653831D27AEEAEC67233F121706AC0B9EC7E75756A7D6C5DA7ED4F8A9DE2F203FD9946B1F748324B2548F2AFFB939B5598DDB15BFC3A269947504D629FD20CC99C3B26AFF3644BA0EAD05E68519545B813F682A4DE828EDEC338F51FBC794A93E7D95A33A45A3EBFCBFF607CB2BC278BB3F06A953EADB28798C8F23EE098919DFAABEADF9F486DDEBFCA9FAA4C5C748136D3CFAE25BE0ADFAEFC6051B7FB1D70A52D42227327281FF7CA6499668F7C3DBED4942EA3D09050C9BEDA0BE2962C9F024A2CB90A67DE17D2A66D1F12724E1EBDF90BFDFEC55F646FD36044F482E0D9BE7FEC7B8FB1B74C4A1A4D79FA936278B17CFEFBFF03BD00BD9DB5920100, N'6.1.3-40302')
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 1, 15000060, N'EA Contest Clib', N'EA9LZ, W7EJ, M0DRX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 2, 10000060, N'ITALY Clib', N'IK2QEI', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 3, 10000060, N'MOSCOW Clib', N'RL3FT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 1, 1, N'STN2', N'CQWWSSB2014', 1, N'default', N'default_cn2r_cn3a_cn2aa', 0, 2)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 2, 2, N'STN1', N'CQWWSSB2014', 2, N'default', N'default_cn2r_cn3a_cn2aa', 0, 3)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 3, 3, NULL, N'CQWWSSB2014', 3, N'default', N'default_cn2r_cn3a_cn2aa', 0, 4)
SET IDENTITY_INSERT [dbo].[CallSign] ON 

INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (1, N'CN2R', N'CN', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (2, N'CN3A', N'CN', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (3, N'CN2AA', N'CN', 5, -4, NULL, NULL, 0)
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

INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (1, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 1, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (2, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 2, N'CQWWSSB2015', 2, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (3, CAST(N'2015-10-23 00:00:00.000' AS DateTime), 3, N'CQWWSSB2015', 6, 33, N'PSS60\SQL2014', N'LogqsoData', N'Qso', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[LogCategory] ON 

INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (1, 3, 0, 1, 2, 2, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (2, 3, 0, 1, 2, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (3, 3, 0, 1, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (4, 3, 0, 1, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (5, 2, 0, 1, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (6, 2, 0, 1, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (7, 2, 0, 1, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (8, 2, 0, 1, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (9, 2, 0, 1, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (10, 2, 0, 1, 4, 2, 2)
SET IDENTITY_INSERT [dbo].[LogCategory] OFF
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 1, N'STN1', CAST(14208.00 AS Decimal(18, 2)), 2, CAST(N'2015-10-23 00:00:01.000' AS DateTime), 59, 59, 33, 1, 2)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 3)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (1, 3, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 4)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (2, 1, N'STN2', CAST(14278.00 AS Decimal(18, 2)), 3, CAST(N'2015-10-23 00:00:01.000' AS DateTime), 59, 59, 33, 1, 2)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (2, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 3, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 3)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum]) VALUES (3, 2, N'STN1', CAST(14290.70 AS Decimal(18, 2)), 1, CAST(N'2015-10-23 00:00:02.000' AS DateTime), 59, 59, 33, 1, 2)
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (1, N'QsoExchangeNumber')
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (2, N'QsoExchangeAlpha')
INSERT [dbo].[QsoExchangeType] ([QsoExchangeTypeEnum], [QsoExchangeTypeEnumName]) VALUES (3, N'QsoExchangeMixed')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (1, N'SSB')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (2, N'CW')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (3, N'MIXED')
INSERT [dbo].[QsoModeType] ([QsoModeTypeEnum], [QsoModeEnumName]) VALUES (4, N'RTTY')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (1, N'ALL')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (2, N'R1')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (3, N'R2')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (4, N'Run')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (5, N'Mult')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (6, N'S_P')
INSERT [dbo].[QsoRadioType] ([QsoRadioTypeEnum], [QsoRadioTypeName]) VALUES (7, N'NONE')
INSERT [dbo].[Session] ([SessionName], [UserName], [SessionDateTime], [CategorySettings], [FiltersSettings], [XaxisSettings], [YaxisSettings], [Subscription]) VALUES (N'default_cn2r_cn3a_cn2aa', N'default', CAST(N'2016-04-11 10:51:51.810' AS DateTime), N'<CatDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><CatOperatorEnum>ALL</CatOperatorEnum><CatAssistedEnum>ALL</CatAssistedEnum><CatBandEnum>ALL</CatBandEnum><CatNoOfTxEnum>ALL</CatNoOfTxEnum><CatPowerEnum>ALL</CatPowerEnum></CatDefault>', N'<FiltDefaullt xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><FiltBnd>ALL</FiltBnd><FiltCont>ALL</FiltCont><FiltPref /><FiltCQZoneVal>ALL</FiltCQZoneVal></FiltDefaullt>', N'<XaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><XaxisDurationTime>48</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>', N'<YaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>', NULL)
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN3')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN4')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN2')
/****** Object:  Index [IX_CallSignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
CREATE NONCLUSTERED INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[CallInfo]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CallInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
CREATE NONCLUSTERED INDEX [IX_SessionName] ON [dbo].[CallInfo]
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Call]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Call] ON [dbo].[CallSign]
(
	[Call] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
CREATE NONCLUSTERED INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Log]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Log]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[Log]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Qso]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[Qso]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
CREATE NONCLUSTERED INDEX [IX_LogId] ON [dbo].[Station]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[UbnSummary]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/11/2016 11:19:14 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId] FOREIGN KEY([CallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo] CHECK CONSTRAINT [FK_dbo.CabrilloInfo_dbo.CallSign_CallSignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CabrilloInfo_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CabrilloInfo_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]'))
ALTER TABLE [dbo].[CabrilloInfo] CHECK CONSTRAINT [FK_dbo.CabrilloInfo_dbo.Contest_ContestId]
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
