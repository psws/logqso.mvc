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
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
DROP INDEX [IX_LogId] ON [dbo].[Station]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Qso]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
DROP INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
DROP INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_Call]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
DROP INDEX [IX_Call] ON [dbo].[CallSign]
GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
DROP INDEX [IX_SessionName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Index [IX_CallSignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
DROP INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
DROP TABLE [dbo].[UbnUniques]
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
DROP TABLE [dbo].[UbnSummary]
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
DROP TABLE [dbo].[UbnNotInLog]
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectExchange]
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectCall]
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
DROP TABLE [dbo].[UbnDupes]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoRadioType]
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoModeType]
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExtraData]
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeType]
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
DROP TABLE [dbo].[Qso]
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
DROP TABLE [dbo].[LogCategory]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
DROP TABLE [dbo].[ContestType]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
DROP TABLE [dbo].[Contest]
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
DROP TABLE [dbo].[CallSign]
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  User [jims9m8r]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
DROP USER [jims9m8r]
GO
USE [master]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 4/6/2016 1:59:44 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'LogqsoDataTest')
DROP DATABASE [LogqsoDataTest]
GO
/****** Object:  Database [LogqsoDataTest]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  User [jims9m8r]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[Contest]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[Qso]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[Station]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/6/2016 1:59:44 PM ******/
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
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/6/2016 1:59:44 PM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201604061958316_InitialDatabaseCreation', N'Logqso.mvc.DataModel.LogData.Migrations.LogDataDB.Configuration', 0x1F8B0800000000000400ED5DDB72DC38927DDF88FD878A7ADA9DE95649F2B8A7DB21CD842CC91A45EB6695DC6E3F29A82A48E6368BAC26591E6937F6CBF6613F697F61C13B2E99B8902816CBEDD08B8A001240E64122016402FFF73FFF7BF0F7E74530FA42E2C48FC2C3F1DECEEE7844C25934F7C3A7C3F12A7DFCFEC7F1DFFFF6AFFF72703A5F3C8F7EA9F2BDCAF2D192617238FE9CA6CB37934932FB4C165EB2B3F0677194448FE9CE2C5A4CBC7934D9DFDDFD69B2B7372194C498D21A8D0E6E5761EA2F48FE83FE3C8EC21959A62B2FB88CE62448CAEF34659A531D5D790B922CBD19391C5F444FBF27D1CEE2CB6CE7C44BBDBCC00EFD98FD188F8E02DFA36D9A92E0713CF2C2304ABD94B6F8CD87844CD3380A9FA64BFAC10BEE5E9684E67BF48284943D79D36437EDD4EE7ED6A94953B022355B2569B4B024B8F7AAE4D2442CDE8AD7E39A8B948FA794DFE94BD6EB9C9787E363EF21F683203A0F1FA3F148ACF0CD71106799D5EC6EBE243B2CBDEF4650A9EF6AF85094657FDF8D8E5741BA8AC961485669ECD11C37AB87C09FFD4C5EEEA2DF487818AE8280ED06ED084DE33ED04F3771B42471FA724B1EABCE45614A92F47C3E1E4D0C727B4130F59F4239FBC144ACAE2E2ED754F08BA28C0E9DF1E8D27BBE20E153FA990E96D7E3D13BFF99CCAB0F25EA3E843E1D68B44C1AAFE8CF2BDA59EF212075FA445D33D3EAA2EAF3307DB56F4F27F0E8489C4F67514CBA525A3D28D8B0BF6BC406751DD7F487974671A2ACC8454D47F3794C92DEEA39A6C35351D79ECBBAA6749093BE2ABB8992D40B8E6931458DAF5D7232A2934BAC6266BBDAAEBC2FFE53AE1D9191381EDD9220CF907CF697C524C4E9C5FB26E7BB385ADC4681A088EB0CF7D36815CF328E45AA5C775EFC44528B9616DACAA0A15546AC9D45BAA6996526A89507936646D2CC5315CB5CCC5105ADCDCF4F5D661C63BDCFB06A4A5526392361A63CC9FCC64B531253A3E47C4E727E9BCC35DD35BBED7442E1E387B48175CD394CABAFA7E16A614DF368365BC5DEEC852379567D2D949425C90BCAE174D568B7938862445F8A9AA22D8A9D91286BE4F1E7DFAA726F233AF0BCB0EDE8AAC6B983C15590DAFCD8C26CBF411B7345CDD90F55DD6B1B67B4EEACD6624C09A38D4BB3A4FD3E8932F983B4A5344BDAD48A89538A3072E7375C6B7E5B523B0DE7CE681DCD52FF0B9146A88E8A6EDACEC8C1537739D172F998995B4E96276E208FAD75C10854D94C2E9FDC4C26196D269BA79B79C1B2CC9912CC0A0D451136E3ABA53A5C8B6210CA6B14DF7A0C0C0AA2D3E7D9672F7C4215949CDEBE8E4DF5F192E26B9375EFBBA95CA3BE9FE9D8C946D95A2A53A93C16222AB597EB2A29BFA4FEA06C981A04F376528752FBBAAB4481E4C6D52238AA6D5563CFAAC3AD9A6C8B8C66D276828A8ADC1010C11BA22DD0B0362BB72CDFD32469B52DD3E9E8A022C06CCD0CE3E8A06C88C5D9C1591CAD96ED3672AA9A3A6DBB374D600DB4EA6B17F36C43C71A8983638D0F09897503E6F50FEBE8C1942419543753F9899F64B9E7D68B4F697FEAA9AB04A6853EE8C3FAA34AF2D69BFB11A68185C4F60B71F54E7F319E915D7E2111D83A1773B8DDDDAFA8433BFB7C9AA2698A1D7D8D995C8B40DD3C3E27D0463603DE502E976D6BCB01AC6E689D096863998637AFCA60DDB2CA1D40D9B22A13D4B2224DD1B23243D75504234427C6624D6FE30682AC4E5A988B2EB59582FA902CC67AC074C743496AE350E0667A5B146CD44CD8B875E46CAFFD98167C8AE297294953DA0595BF06FDD781ADF1CE0F520AB0DEEAFBD57BF6FBABED53AFB54D570FC92CF697C57C552281CCFC85178C473731FDAF744BFC713C9ACEBC0C14FB6DD54F352B3A503F45C18DAB9FD2463758A572A6B8ADA21ADA52C0CD74447BE5020BF4D33071E048AE0E7D488AB5C327E2C50E94BE9B4D0287DB1CDAE5743551756D337BA2B45A3C909821B7F78341E90CA20F5E42A624FE42E2F33049BD70A61A97A6EE80F61DA99A328846DC65C5342A6A4DADF8E8E738CC5A727E22C0435DF26A6FB13029D66E4B83C216DCCD60BF4B6B492ED1E51E464E58DEBE603EC36D69B969C18C59B4395C1EBE494C12D82C36BDC57E0A49D04695A97C73F28F60438A94965B11782B9A0C7C43AAEF605BEAC44EFB0F9C549CCCF115B921CCF5EC44D262CE379F875CFA8FA695E3BEEC4922A6D92F00ABF2D7743E0BBC1755155C16FB9ADE7AE11C22DF7CB7A77913FD93806C6112ECA91ED1657642650511E6D3EC695F45D78F77CF106536C58D9D4EB593A32DC48D8F5DDA86ABC868BDD6D2A22F2BE0CCC1AFFADCE75D4C7E5F91B0F1E7D66F1E6C68A551D8996EB6BC6E9F6F93DA29FEED4B6A4FE1AE3385CEAB90753A4C6CFE2C90D6031ACEEC77C900E2125D3BDF66C411C75B21096C97CEE1B6D3E95F590178F027A661ADEB70DCA73854CB8803E769CC67B03DAE4ED1AA2176142C3F7B8E9DF1729ADFE6C47EE6C49CEF0DDB7FF182D5BA7742352312833B078FFB3C23877B291D1A0072A6EE23A1F4EF75360A4A7ADF46408F23A0E4F9A0E15FB611843E9306C39ECDD009F21F1EC293D532DBC66909774AA0447B45EA1BD2D781741B899E87B328A60B93B488A77521598EE43709F7A3CB8E59293A3D226F85A66AB6758CA88AEC3754F58AAA469A1B43D655949E875D0EC8394055D4BEE168D3F3CF74B558781DCE4438B196C4362E557687CE2460A3C3F500C3F33A6857B3131F8C2E2E0DED36D51AD0817B6B40B264A443795C1E51B3F4E5936A3955D9C0359D5B335520C7D7700E555B7587D9365A8A42FCF795AB954F496CE35AEA0F36F7AC168C4C852B7BCE937781F7D45CBE6824E659B45844E14E4681BF0288936C91ABAD58A9729D933878A1BA98E501CFB34B929D76943D3BBAB8188FF2DD8CC3F1AEC45E2EEBD5519D734F9D73DAE494FD78B89CA71FEA9CAFD4398FA675CEBF6872BEAB73BE56E7BC3EAE73FE20E3A240800215C2AD4BE6A8788AA2A780CAD1A723FC8C447FE6087D376292FB03C2D9FD87F0B730FA67680A87B3FBFA9A3A33549CDDDF92A7FC18C20C1B67F7D3D543CC17D180E4ECFE8EED81062867F7D9CD7EB35C786680A14D4A63924D0D306CE4FC94EF54807451C4F6E2AFBA52F5CD8D65811FB51D89C9C24F9A7EFCA42EF0CBBBFB775478F346741A6167D1164D66ADA0CFC3F7F17F5E4514DB75A1EFB59D7EEBCD69818B555344CBDD7C6146AB6A8A680578950F8F2ABB1621C7E94BF4F01F4D012D006F578958468BF35F7E168BECB55047D285364EA62986E24627AAE3F71F3F9A6A1A9AF7E657533573FC7EEF875D530573FB617AF2EB31A6608CC42479077416934071A3629A4EDF1A4BE9A3A9882ECF7F3D3D3116D1DDDDA7AE02926F3E71212491EA460505B8BF98894D3ED437132253EE32DB16C0E469A6EBF8BB21BA6B3A96DE66F51CB5C8F78C8710CDBC6FACE868E6579DB82EFB1EB918161CC98DF2FEEAFAEAD4D4FC65174E1A29DDEE998AE876DF58CBAD8CCDDCEC06335303777A7FD3694924B9423B18991CC5C12C96754BE0F3ABB38BD3FBEB1BE339EEC3C5DD399B5F0380E37F9C1EFF7C717DD669AAC3DCCA5D4A8D21BC3583BB96DEFDF1C5D1747A7E6C2DF6FBDBEBEB9FCF4F31E99B4AA7F1CA7721928ADAB60CA27B6A995F9A0EA0FB1F99BC9AC173FF1726AF467DDEEF337935EAF37EEFF525A63FE5BC0CDDBFB68307135FE1021F35B96D01C83FCECFFE618A8F8BEB8FA6F0787F7BD355ADF2012A2E84C352DC16F964BA737AC7ACDD3432A23AFA5E2AD36E7DC005F2B8E07F436F5BB8CF4E781AC6DF7DBC361D1C1FAE2ECE2FCF5901190D110ADF68E6E7DCAE6504BD2BC2D77C1ACE47468F8C340112FCB35099F1EB2F29DFFDF4E570FC27A96BBA0AAAA340AE82EAE49627BEC7B79D12BF0E4F484052323A9A154F681D7BC9CC9B033758D066F05F6EC92389B3D0C4ECE19930A108F2C3543E7AF3C399BFF402932E0885514F04F8558FAC91757562CA095992300BA4349155F776D4D5094CD4F1EC60C28050834DC58DC728804CAE3F6660C4DEDB6E0153838B93F97021FE3AE4C16156DF1F13C4809B765D20AC17A6C366F58768EE85050DC6E0E7162404B7402FF84883D9D8180C62A13E18E936F5A3066D500A09CA51537A44261BDBA7C30F18ECE70499509820AF4F9B00C4A12213E883A1B252DD22DE0A9980A01C35A50F64420FCA99D98FA2739C6BFB54F0ACD3637F00E85474C0425B39B54D7931756E452F9814EF68C601835ED8CC2F66EC9188DDF3BC25AB24A4F9BDAE9010D998B601F517EF17835A9D88DDCBED0A815BA907E1C6F7A90361B16C95FEE3AE5BD00205BE80C1110AC1CB1B78A391B91962B07884BA6168AC29EF136F874D4862AE5AD3274EAB5BC3B52892EEDC77844EF1AA7E866E7DA3F960312934DE04008A3BCDDB2151108C8336F48ABFF2F2173D4EC4EB605CE14FB84A86C55F75310D4F767767473EDAE88823BE112632442EA786E58D5F4FDD1273BC307A6E6F0FF8E42E66C53004DFD2DAE0278FF035872478AFEB56AC59A096F7B85C81E4B0152B15F6C25D252AF0F5491B8C59AF4ADC693CA0FEFE1616002BB7614D21DE83AC922D184EDA092D50E4294FB189701DA25E02DA6F385DE1F7005BA30E108B9346F4803EEEA6450C28F0B58BDC12D30677E0458D4633A113250555DFE3740631732BA633E11E4B255A3447642D00B3CD476348FB0D37149C1D8B218271D48CFE10A8DF791333BAC3E0166FB5613DE87D970D93CE166DB0BD4FF47B1BEFA15B6E3BE16F939B1940FD43DDC70018FF756E61BCCF5F2A5199F7EFF9674B944B05A71A0A6A06AC31F583A0F5E280EB7D0708582E07B8DE76AAB6271CD56FCDA864283F3CB3293449AFDCE8F5A04350897CE80F5762BF870E2D31583BBF135831BF29EEC6067D8ACB087083194F538D9962723791A22D30B480A0ABB0D6843B95587A6B6D5F5865EFAE560208BCC85AC0687DE1BA3D3EA16BB0FBC32650FB40710988E16BC224746123861BE5ED8D0D74D85B4CCDD71EAA6B1FB7E2044BD1811E77FE1432DA8A0D40E0764E13C4E0A75BDDD1B8851E7878F38D40E0E4A80C174FE736F48B43938333DD75AC0EF1B8CDA769EA6E18CE958E0ED5D42273D216E7382DEE72CDC6062DD104FE17B7EA9EBC05E2BE3F24A40CFD4ECA0BA945886514A724052242C6A3E6EE5830B64382AB48AB9AAB013A55928E46A5626512558A198562BF1CA352A46A2849A1A6123529879E6273A204516B520D788DCAAC4AD2B786395A809AC3246B68D58E9712993A4547A1DA65912954291A0AF98E91543AFFAA2FD92851884293AAE729CC4A1BB4959B102AB895594C68D68B46985E9DACA1D53C7F24D16992F434840777205A42160B9ACD431D4ABA4D363DEDE6E10D886493AAA7549B0110A13A514FA7BE8C1DA253270A7498090656FECCFDFD4C5E601A40D68D9CF9A2BEDBA2EE9338FD4833AAE965161C4564A699F02C30618FE2CE048849A6572CF01D33B86481ED1E3E7F199305B8A69BC85A338F0BCFC7998647F143BD02E3F865269930080CDC37E37707A670333DCE14D43306EC09E41FD3922990630C8F16D45069C114282859AB84A0CD0285C610360CBAAB20619740CFE8569C11436341B628E367852E6011B482063560061632BB265D2C46682A3961000E248EB33D1F7A05046F9B2B5881BB36C1DD003D9C5A3305746EE21509BEC4E8C09E7ACDA1E00C18C60677430C646BCD0F31728D21842D93BA70A15A37A9B800391C218D17FC8EDA7341703962B9802CF5ECB9C085E3001CC0C375B84683013B4C8301DB1F2FBF5E15C98686601DD62A462876C4B6BB7D684231C201E930BA972BB51ADAC6B5EC38B453CB9340B711EC19C039D903BDC79DF0B976836EF8BC8656F61BF4BB5F0FBE455F71A4D3664633E6506ED9F55E0D65C95519E780C99C8F3A34DBF3A0CF499E75934518A09FD4203F5ACB6EF7368B151E99888203DC3525BDC43B6C5A2A35DECD52CDA3961DAC5D05913EC2AE84524B256742CB9E4A2E806B9128E8C006E358E3E8262212777583377AC02D643DD1B541417297C2B882BA54C98D879CAA446E201BE06A626BE302F8A2AACC08AD1F0F769CAC9AECF17D682DB5F54EFDD01BAE6A9E680D5D853749378EF461FD62EFC52A7962660B6B3C1B3AF1662D0672F5E2697D4A5EA71D4CA6B3CF64E1951F0E2634CB8C2CD3951714AFD1560997DE72E9874F4953B2FC329A2EBD59B674FD7E3A1E3D2F8230391C7F4ED3E59BC924C949273B0B7F164749F4986617A74FBC7934D9DFDDFD69B2B73759143426336EE212CFF4EB9AD228F69E88909A81664EDEF9719266AAE7C1CB2E7B3F9E2FA46C8D4F00727E54D5031CFBCBB2ABCE95AA42D9FFF57CFD3BFACCAF8A6AC3D477B49F8BCC2F23EB32C17662A5E294C074E6055E8C3FDD7D1C05AB45A8752852D0629CF238620A673D05B5C0F317643E9DD16E0AF4B8141B8AAB079152F6C59C42F5884DC293613E9BD3AA1FF56429D51FADE91C531C80B48A046B7A99CD464082658A35C5EC75D5CC85670E936593ED7B5FBD3D0B31A04A03DC8B27C2A81207F3441ACD8262153584A1FE406D8ED6BA03A668A437B0A23D8DF3DC4D41A46345A17A3E5BD661E5670B3C954F2F0B48AABF9A53BAA0B36DBA12C1DE7CB5A014854F10A9E6B339AD33126543ECF8F36F3C31F6FB70C6096A87B61D26304193518295EC65622D0A15B1AD003538E8554BAF89D80668E2E1DC38DDF7E29D042C5D29D19C2E9D71E2CC822377BEC80121C99C2635B1618A5C828DE248FD2FE2CC567E1BDA8042B636BB0D2A88A8F9C0824BF70D60A1283AE0F80C5603447EFF431824FA07428CE8CB6D9712ED06F62A00141097604D6F1F25B86F4BB1DE5F92490A4983198C7A2FB796035243D860506A290C00E0F82045330D49F48A53B6F662C7889A891C2FDDF7845F1645C5CB270E46ACB52387D3755DEBFD20ACA86A25969580D675D577BB755DFE86BA4CACFC6C3D2F3BDBA54A90D52B16CC8953FB9090588668F3D5C2C865EF88E64C5CD5E5D138BD133FF11E0222F4B2F96AB3FE7C129985DECCA330E153B877AA7B7B707AEFA55BA70415A1B9936A93AA5FE55ED05EF7A354CD94BFA2F8FA646042199C0084D4C14817778B6C295884A0814CD1927D2920E7AA11D90110136DA682E2BC8CF22BCD4EB0C409414C35A7FCCE0F521227306129D19CEEAFDEB38F501592CC697EC2697E6A4B73BA7A4866B1BF2CDC3E38717129C319B8A8D353DB810B133419B858C921CECF1B1257E691E44C540031033181A5D629A2D2DAFD44BC1834838B844D19C22E4D74E1AA00816BAA5B04709AECEED72A7BBF1CDF1C2B93AD6857FE0553127F21F17998A45E3893ED162C5BABBAB4B574A47F97AD1440F30BC8615EC3473F874446E3FC84272D2499D3BCDA5B2C2082ECF721292F852B517B25861135536678E93E87292D557953003BFB62622BBAD774E405DE8B923C97C7AA96B75E380749370956F46EA27F1298154C8A15C5236A2F2729815BC9275AD1BD8AAE1FEF9E41AA6CD2608621EC00DB7E01DE6EDD6DB5DCCE2EC91354317C6FDE104D4574AD1493DF5724147D2E98CF9BB2698A990E58737209E6F46E9F6F13C149A5FC644EE34EA671674B63CDB6D0BA8E04B676C38F8F1958C7391F48D9EEA00F2131746D94F7A0E9C02F5EB0828E03A51CC3C2471545E1161B0855535CA0C5B7021365EB3140F0C98341437D1994332460140D5080171D0A02362725FE9A2D97D2525236939A86C450A487EF25311798F1BB49E8CD660341437D39DA5A108151B744054E664B90D15C4107A003BB9F6EB308A9EFBA73090C8CA8191EF0D24381C1E6C455C5E6B9941642D34C5868E1EDDBDE777D90D1651F727308ABEE9A74893084A619C2D0C27F086D2005C28A59EADACB2FF5EF3A10B60C42E5A263F37E67B1AE797F933220568C4A2DB28C4794395FFC7916913A7D4952B2D8298E927F0F8E039F64814C55864B2FF41F3347F4E837121E8EF777F7F6C7A3A3C0F7922272B98CB77D23DE706D1480BBF72A0BC025F3C5442C6E1FC69B5149923967843210AF751516BB7AF0337911C56C77FFBDCDE3110713B1BA035C0F66ED3F1C7FF1626A6EC4C065E2E7E19C3C1F8EFF2B2FF96674FEEB7D5DF8BBD1754CA5F866B43BFAEFF1E8D27BBE20E153FAF970FCEAF57874B50A82EC5CED70FCE805897CE98B221AAF68929F21C5A4397549BE3DB60DE0C271992658D3C9827105AE32BCD9DF6549E6B7B36B283271B92AB2D674EB28DD75502DE27571CA7BAD299781BBEB20CD06EFE2F45FB7E64915C2DB9E363B39687411F8B08F991EEAA259E0719C4FD46724CC904CE6375E9A9298AAF1F3ECA1841C292DD48585EE3A4F0AB3E0CDE88EB254D056FC8834ABBE09CA6DAF299A70DCF6349A40DC82C6631079A92D3C9910DC0E54D8D8DB82CC83AF21628E66F059A06E936A9759B2E35CC7C6BB2A28B7C3251734683995F2C53BCDA7D221995D5384E29D9A2244D7160D99D3DF69FEDB921A1759DB9156155A0B8E178082ED80913DE1AD060D760E693C7440E977C3B46ED4B4D0E660349F355C45125D470F1FE5EABAC34DBCEB3A28EFDB9136995E84F8D7F6A48DC790327CD46C1C19C489EAC7920E9EDDD1DE274BE1F04C6376AA1C2F8C58894E4AEDE637272AC9CAAA6FBDBBA0887F44B283118E666B80AAA60E7ABF694007FBB8D885B353E679A17BC60FACABF5D1F893D9EFB6E08DD953AE634C74EA30B78192D6DB4049F76DA026B04B319E5FFF608F0236FACC9ED94C7194DD6D9AD504D29A9AA0A02614BCD6AC6D27AEBC85FC6C261E2434D478E6517AE6194D3D38973A70BCBFC9070CC534639F22F652CF39D5D0E908FF358F7667EB443988B320F8BC086C75BE14B6D99A9210AAD99ACE274774F898CC824CB2A0D3C2220AC98B230B160C6B341B04C88920345C701774FD70696FF2ACCDCC598B3A925C3E3A48A10D579D6F69B36E039DF5C586CDA85E2D4BB33D6ECE85C27A7434859DEDEB9441098CA2126C01937E29A2318D4FC84C5B2E0764AEAD0A2624D36D1D426C26688399F09D0DC9342462A3D990C7E74D351CEE2D64A4E99091E2FE104F0884ECB25900073D76A2D8C43A7622C3443876A2C307357622C546329A12B2596BB55C62414E57EEA6F0B2025CDF7EDB51EABCA3C4843B96260C99F994D599CF17FD2FC99DB7F67EA4BA64E66534F7B7CFB4E1A2263BDA6965DC644185AE7F5EDA20F2CE05917518264339FFDD920D2A4508E3B035A8190BAF2207ABCC56DA17AA7CAFADF12E8560F6B1D6C50319BF216330C8E06331FB80051CD9386C487416AB33D629C20BFFC82C8436739878C5824C5802FBDF16DEF3BF3B5AF6EA63FBBE8905104B1328B856D1C061767F6489D8700F8C7B33F7DBC022DD1CFBBB6E7A6935407F04879BF21BD982B60129183AF76D84CBCC63DEA1AC874E13FA853CC6CA3C875967285B92BFD2D97CCC3C28FD65E0CF68D587E33D29B6F23A3C210149C928731FCE36548EBD64E6C92F6865CD9FE36D6082D5F876B0097C5BFE245541054BE26CFF378B9B09136A03FB7244E34DEC87337FE90562FF858CA8FEC3DE633B98D4A4C59413B22461B6330DF5B77BBD357981E33A7E708F986A30D5383E8BFEC528B2C47CAC60A5B47E70C678A2733063BFAF05654A9E21423770D8B5439DF255A9D6F5F787BE7B3C92A0938CD78B36A815EBD2659612D6BEEB658F2E57F5F6882ADC119CD365751E418F35DFBF5254A1FC41A4ABBD92704DA832A8B70F5471D617182BD84A985FA3E965AF327A37BC54D5F682A6227C615BECF83224446CC35767BFA36F8859EE99F48BA12DD0461B00D006B4900D7C86A28114610B9C9DD464120C2526E1AB0513CE2444BCFA6B96D7052C939AFBC4171CD2D188B34A67A5597FFB6A0185BF566615D9B23E18692AED1541603C0483A0EACA2D1641D5375E7ABB3B3B7B9200378C04F4F92BE3F00E5880AA3706D6851A870DEC0161B4B5DB61806767A26CF5F9EFAFC6EC86AF651DA0C59DE3C59DB1AD51463D0ABD7753D958E41BB6923389E3A1129CACEA3C82CC9AEF5F99AA50BFA3651933B216F4686BEC0141D41C773EC7E03A238B8B1096675FD144013F1D35C0892213FA761D3FF4079C4D1E3B98026818470E258AB66B77A657206D704FC6024A43D88EC9B0D4DF3ABA3F100C7DF56C0A93ED5B38D39E497E7C5666E8D62B200B33B427C307ADA9274C94C81C222C2C94DBD6C1C38112EC6B12E20210EFE5306EAB71AC9982F86047C44DB14C3498DEDA1A29A66602FC1CC8BAF489EE3DCC3535B12F949581726B4758153029A1AB4EF803220B7F4D737B51D504D86CC791011310C4B682FDFCD5EC0B295F0C1BE0F6108BA5C1FBEE6C0C48BD1F4AD8C268C367130C8AB6EB88625388DADC818525B2FA3FB738E55F74AB112EBCBE2681AB7C240EF0911E8F9AB836D0F5B878C9ED703C7FC8ACB0223E8ECF21595E626DD5840AD45425C1B554A9BA1A2A452B5750A580F4AB4433F2C5E62C564591AAA8A6C8A0A94A8ACB92AA937240554A99F4D536E71850954D2A525D93C1000D28EEAA240C0D4678E337D3A1DE30C94877981C9ADA6A1738A9A23A05AAA34ED491AFB63E64F2550A48BE4AD490CFF77524D2F957886C9EA027D9CC5310E92615A9A2C9A097342C6054AE3603B0DC71508DC0328B660896B94C6AAE57A370AD75325A639D43535B7D5D8C5C539304D5D2A4EA6BE06F55016B12B220350AB92C6A6E6EC450D6DE64D3B5007B8B1B6A457D4F065879938AD4D964D057555B64504D752252519DAEAFA7BA1700ACA74E44EAA9D3857A18630736529AA5FC88C90B982BC89A1F59F5D7FDC36D0DA1A46C3795A515F6D084EF9E49D715D1DE10034C83C3B18D5776A6CCFBA3B11FA095AF444365F6B4660917828CB3028F54EEDA7478D12F9775D865CEBAC2BBACF0D7C03C59788963265C9F5D868237B5431EDE8068D7E8CD8C7729CA10ECB33214D1998AE3CDF3BAA4F3AEAAA4AB0A987324D99EBAC9AF25147D5579C9A02E44FC0046172D9BE97ABDC451F41A09AF81C28E98D6228BA70D75B35A6AA9BA091FFC42C7DE6C37E1455CAFDDE4422F802EE2A1198E1412633EE785207BB865B7700D84061038513EEBEB12B77886BBA5D85CC536A1F9A662ABF31EBAC8F96803FDC37DB81D8191D970A894AEA36E698C3CA5A3B253036FAD5D544E856A375AC7B3E0FABAA9980F50E74E2753C17ABAD4B810220A05F02FB455053D75A3F67A437A027BC575EA8C852CDBC14DF6D38271A7F1E7B29500B693C0ED998A5B09F03E68CB6EB38E43589751E7A2EEDD15366A9BAE621BB0F6DD843C59809E6A1D5E1CCD7DF226635E56B17DD8ADCBB875A673CB7062A4F5DC5D8DE566E243E0D48073D9FDEAEAD4FAD8BA4E3B98143BC5E507FA338D62EF8964964A90E45F0F26B7AB30BB63B7F87542328FA09AC401A5199219774C5EE7C99640D5A1BDD0A22A8B7027EC2549BD391DBD4771EA3F7AB39426CFB2B56648B57C7E97FFE1F874F140E6E7E1F52A5DAEB26798C8E221E098919DFAABEA3F98486D3EB8CE1FAA4C5C748136D3CFAE25BE0EDFAEFC605EB7FB1D70A52D42227327289FF6CA6499664F7C3DBDD494AEA2D09050C9BEDA0BE28E2C960125965C8753EF0B69D3B60F09B9204FDEEC857EFFE2CFB3B76930227A41F06C3F38F1BDA7D85B24258DA63CFD49313C5F3CFFEDFF01E991EDDD8F910100, N'6.1.3-40302')
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 1, 15000060, N'EA Contest Clib', N'EA9LZ, W7EJ, M0DRX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 2, 10000060, N'ITALY Clib', N'IK2QEI', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2015', 3, 10000060, N'MOSCOW Clib', N'RL3FT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 1, 1, N'STN2', N'CQWWSSB2014', 1, N'default', N'default_cn2r_cn3a_cn2aa', 0, 2)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 2, 2, N'STN1', N'CQWWSSB2014', 2, N'default', N'default_cn2r_cn3a_cn2aa', 0, 3)
INSERT [dbo].[CallInfo] ([CallInfoId], [CallGroup], [LogId], [StationName], [ContestId], [CallsignId], [UserName], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (0, 3, 3, NULL, N'CQWWSSB2014', 3, N'default', N'default_cn2r_cn3a_cn2aa', 0, 4)
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
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (11, 2, 0, 1, 4, 2, 2)
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
INSERT [dbo].[Session] ([SessionName], [UserName], [SessionDateTime], [CategorySettings], [FiltersSettings], [XaxisSettings], [YaxisSettings], [Subscription]) VALUES (N'default_cn2r_cn3a_cn2aa', N'default', CAST(N'2016-04-06 12:59:58.483' AS DateTime), N'<CatDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><CatOperatorEnum>ALL</CatOperatorEnum><CatAssistedEnum>ALL</CatAssistedEnum><CatBandEnum>ALL</CatBandEnum><CatNoOfTxEnum>ALL</CatNoOfTxEnum><CatPowerEnum>ALL</CatPowerEnum></CatDefault>', N'<FiltDefaullt xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><FiltBnd>ALL</FiltBnd><FiltCont>ALL</FiltCont><FiltPref /><FiltCQZoneVal>ALL</FiltCQZoneVal></FiltDefaullt>', N'<XaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><XaxisDurationTime>48</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>', N'<YaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>', NULL)
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN3')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN4')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN2')
/****** Object:  Index [IX_CallSignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
CREATE NONCLUSTERED INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[CallInfo]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CallInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
CREATE NONCLUSTERED INDEX [IX_SessionName] ON [dbo].[CallInfo]
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Call]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Call] ON [dbo].[CallSign]
(
	[Call] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
CREATE NONCLUSTERED INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Log]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Log]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[Log]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Qso]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[Qso]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Qso]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[Qso]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
CREATE NONCLUSTERED INDEX [IX_LogId] ON [dbo].[Station]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/6/2016 1:59:44 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[UbnSummary]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/6/2016 1:59:44 PM ******/
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
