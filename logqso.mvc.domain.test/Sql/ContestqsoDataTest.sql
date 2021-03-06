USE [ContestqsoDataTest]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdateStationNames]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoUpdateStationNames]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdatePointsMults]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoUpdatePointsMults]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CQD_sp_QsoUpdatePointsMults]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoInsertContacts]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoInsertContacts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CQD_sp_QsoInsertContacts]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogsUnion]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_GetContestLogsUnion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CQD_sp_GetContestLogsUnion]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogs]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_GetContestLogs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CQD_sp_GetContestLogs]
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
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] DROP CONSTRAINT [FK_dbo.Spot_dbo.Contest_ContestId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] DROP CONSTRAINT [FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] DROP CONSTRAINT [FK_dbo.Spot_dbo.CallSign_CallSignId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData] DROP CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]'))
ALTER TABLE [dbo].[QsoExchangeNumber] DROP CONSTRAINT [FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]
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
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
DROP INDEX [IX_LogId] ON [dbo].[Station]
GO
/****** Object:  Index [IX_SpoterCallSignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_SpoterCallSignId')
DROP INDEX [IX_SpoterCallSignId] ON [dbo].[Spot]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Spot]
GO
/****** Object:  Index [IX_CallSignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_CallSignId')
DROP INDEX [IX_CallSignId] ON [dbo].[Spot]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeNumber]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
DROP INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
DROP INDEX [IX_LogCategoryId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[Log]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
DROP INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
DROP INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
DROP INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
GO
/****** Object:  Index [IX_Call]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
DROP INDEX [IX_Call] ON [dbo].[CallSign]
GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
DROP INDEX [IX_SessionName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
DROP INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
DROP INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
DROP INDEX [IX_CallsignId] ON [dbo].[CallInfo]
GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
DROP INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Index [IX_CallSignId]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
DROP INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnUniques]') AND type in (N'U'))
DROP TABLE [dbo].[UbnUniques]
GO
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND type in (N'U'))
DROP TABLE [dbo].[UbnSummary]
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnNotInLog]') AND type in (N'U'))
DROP TABLE [dbo].[UbnNotInLog]
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectExchange]
GO
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
DROP TABLE [dbo].[UbnIncorrectCall]
GO
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnDupes]') AND type in (N'U'))
DROP TABLE [dbo].[UbnDupes]
GO
/****** Object:  Table [dbo].[Station]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND type in (N'U'))
DROP TABLE [dbo].[Station]
GO
/****** Object:  Table [dbo].[Spot]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND type in (N'U'))
DROP TABLE [dbo].[Spot]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
DROP TABLE [dbo].[Session]
GO
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoRadioType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoRadioType]
GO
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoModeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoModeType]
GO
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExtraData]
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeType]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeType]
GO
/****** Object:  Table [dbo].[QsoExchangeNumber]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeNumber]
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND type in (N'U'))
DROP TABLE [dbo].[QsoExchangeAlpha]
GO
/****** Object:  Table [dbo].[Qso]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Qso]') AND type in (N'U'))
DROP TABLE [dbo].[Qso]
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LogCategory]') AND type in (N'U'))
DROP TABLE [dbo].[LogCategory]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND type in (N'U'))
DROP TABLE [dbo].[ContestType]
GO
/****** Object:  Table [dbo].[Contest]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND type in (N'U'))
DROP TABLE [dbo].[Contest]
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND type in (N'U'))
DROP TABLE [dbo].[CallSign]
GO
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CallInfo]
GO
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND type in (N'U'))
DROP TABLE [dbo].[CabrilloInfo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoStationNames]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoStationNames' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_QsoStationNames]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoPointsMults]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoPointsMults' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_QsoPointsMults]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoContacts]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoContacts' AND ss.name = N'dbo')
DROP TYPE [dbo].[udt_QsoContacts]
GO
/****** Object:  User [jims9m8r]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
DROP USER [jims9m8r]
GO
USE [master]
GO
/****** Object:  Database [ContestqsoDataTest]    Script Date: 4/20/2017 4:02:33 PM ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'ContestqsoDataTest')
DROP DATABASE [ContestqsoDataTest]
GO
/****** Object:  Database [ContestqsoDataTest]    Script Date: 4/20/2017 4:02:33 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ContestqsoDataTest')
BEGIN
CREATE DATABASE [ContestqsoDataTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContestqsoData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\ContestqsoDataTest.mdf' , SIZE = 25280KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContestqsoData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\ContestqsoDataTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [ContestqsoDataTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContestqsoDataTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContestqsoDataTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContestqsoDataTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContestqsoDataTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContestqsoDataTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContestqsoDataTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContestqsoDataTest] SET  MULTI_USER 
GO
ALTER DATABASE [ContestqsoDataTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContestqsoDataTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContestqsoDataTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContestqsoDataTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ContestqsoDataTest] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ContestqsoDataTest]
GO
/****** Object:  User [jims9m8r]    Script Date: 4/20/2017 4:02:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jims9m8r')
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
GRANT CONNECT TO [jims9m8r] AS [dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoContacts]    Script Date: 4/20/2017 4:02:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoContacts' AND ss.name = N'dbo')
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
GRANT EXECUTE ON TYPE::[dbo].[udt_QsoContacts] TO [jims9m8r] AS [dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoPointsMults]    Script Date: 4/20/2017 4:02:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoPointsMults' AND ss.name = N'dbo')
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
GRANT EXECUTE ON TYPE::[dbo].[udt_QsoPointsMults] TO [jims9m8r] AS [dbo]
GO
/****** Object:  UserDefinedTableType [dbo].[udt_QsoStationNames]    Script Date: 4/20/2017 4:02:33 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udt_QsoStationNames' AND ss.name = N'dbo')
CREATE TYPE [dbo].[udt_QsoStationNames] AS TABLE(
	[QsoNo] [smallint] NOT NULL,
	[LogId] [int] NOT NULL,
	[QStationName] [varchar](20) NULL,
	[Frequency] [decimal](18, 2) NOT NULL
)
GO
GRANT EXECUTE ON TYPE::[dbo].[udt_QsoStationNames] TO [jims9m8r] AS [dbo]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[CabrilloInfo]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[CallInfo]    Script Date: 4/20/2017 4:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CallSign]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[Contest]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[ContestType]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 4/20/2017 4:02:33 PM ******/
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogCategory]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[Qso]    Script Date: 4/20/2017 4:02:33 PM ******/
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QsoExchangeAlpha]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[QsoExchangeNumber]    Script Date: 4/20/2017 4:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[QsoExchangeType]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[QsoExtraData]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[QsoModeType]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[QsoRadioType]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[Spot]    Script Date: 4/20/2017 4:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Station]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[UbnDupes]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[UbnIncorrectCall]    Script Date: 4/20/2017 4:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectCall]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnIncorrectExchange]    Script Date: 4/20/2017 4:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbnIncorrectExchange]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnNotInLog]    Script Date: 4/20/2017 4:02:33 PM ******/
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
/****** Object:  Table [dbo].[UbnSummary]    Script Date: 4/20/2017 4:02:33 PM ******/
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UbnUniques]    Script Date: 4/20/2017 4:02:33 PM ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201606162129195_InitialDatabaseCreation', N'Logqso.mvc.DataModel.LogData.Migrations.LogDataDB.Configuration', 0x1F8B0800000000000400ED7DDB721BB996E5FB44CC3F30F8D85347B468A946C72175874BB2751465EB46B92EFDA248916939A7C84C5566D2479A8EFEB27EE84F9A5F18E41D97BD71CF24E972E8454C000BC0C6C2C6C66DE3FFFDD77F1FFFDBF36A39FA1AA65994C427E3FDBD57E35118CF9345143F9E8CD7F9E7BF1D8DFFED5FFFE7FF387EB7583D8F7E69E2BD2EE29194717632FE92E74F6F26936CFE255C05D9DE2A9AA749967CCEF7E6C96A122C92C9F4D5ABBF4FF6F72721811813ACD1E8F8761DE7D12A2C7F909FA7493C0F9FF275B0FC982CC265567F2721B312757419ACC2EC29988727E30FC9E39F59B2B7FA3ADF3B0BF2A04CB0473E163FC6A3B7CB2820659A85CBCFE35110C7491EE4A4C46F3E65E12C4F93F871F6443E04CBBB97A790C4FB1C2CB3B0AEC99B2EBA6EA55E4D8B4A4DBA840DD47C9DE5C9CA1070FF752DA5099FDC4AD6E3568A448EEF88BCF397A2D6A52C4FC6A7C1431A2D97C945FC39198FF80CDF9C2ED322B25CDCDD976C8FC6FB6104A5FAA1A50F6159F1F7C3E874BDCCD769781287EB3C0D488CEBF5C3329AFF1CBEDC257F84F149BC5E2EE96A908A9030E603F9749D264F619ABFDC869F9BCA25711E66F9C5623C9A68C40E96CB59F4188BD18F277C766D7231A74A5E8465A4EB8C471F83E70F61FC987F219DE5703C7A1F3D878BE643CDBA4F71443A1A4993A76BF2F39254367858866DF8449E3355EA2AEB8B387F3D35C75906A4272E66F3240D5D91D60F12314C5F6989419EC715F911E4499A4933F291D3DBC5220DB3C1F23925DD5392D7BECFBC66A493874365769D6479B03C25C924391EFA946442069754264CBBDC2E83AFD163A91D919E381EDD86CB3242F6257AAA0621462FDE7731DFA7C9EA3659728AB88D703F4BD6E9BC9058228B7517A48F616E50D24A5B6914B4898895B30A5714B38E0495F278D28D488A71AA11998F31AAC2DAFCF8E432E268EB7D4A5433A232C3F3302E9467B8B80EF23C4C895172B1084B79EB8C35EE9ADD7038B94EC3CFD1B3544DF532AE12D6463191CBBB78BD6A732F7B081B6288FB763E5FA7C1FC85813C6FBE56FAD110F20369DC7CDD29D6B384D0539D8A58C116C9CEC3A428E4E9973F9A743F25A4CF07B16DC76E548C877E5D416DBE5B6366E756DB9155CEC50F59DEBDF5359277912BD8DB983043EC9B2C29DA1FC416C20CB1890195E68461E15DD449ADFB6D88F62E5E78C37A3BCFA3AFA1D04355282A8BA18083AD867A8C67E2514683182CDA0C401C53C3866A50693199786231A960B498741C37CB86169937255824DA1645D8F52F4B75D88B62E0D22B145F3FB60D21D1BBE7F997207E441594186E9FC7A6EAF891F06B93794FFD64AE50DFCFA4EF14BDAC97CC642A8FA6884CED95BA4A882FA83F281AA606C1B84EEA50289FBB4AE42037AE16C15E6DAA1A07561D7ED5A42D33BA41DB0B2B1AB86D60046B885AB0A1372BB74E3FD02069B422E4B46BD10050AB42DBB16B5117C460DBE23C4DD64F5AB13F65615AB5A2CD8253532CA7ED81AEBCB435D77CB5A268572B9C9B873FF63875DDD0C64FE661E367166605AF3723BEB3282B622F8C67AAC262D6A3B31C2AE53184A94834EA6DB088124C5D7381F6B376F98E44D59F91DD082E1058E2E763F8DD8568D0A11D08364C5234C9CE83C2A66E9B405E3C362650463A025E5026966969EB0E2C2F681B0928631D8617AF89605CB2E6D882B4644D24A8645598A4647504D72907D5885E2CCB166FE3D684A84E2C6C4B9FDA4A82BE4DE665DB61DCF950436D9C0ACC486FCA828D9A099BB3EFEA6A7B5B983F25091F93F46516E639A982EC5C09F9D783ADF13E5AE6846083E5F75BF01C0D97DBEF83E6365B3F64F3347AAAC6AB9A09E13C5A05CBF1E83A25FFD5C7278FC6A3D93C284831B5553FCDA8E841FD540937AE7E6A1B5D6392CA98E2A68A6ADBA6027E8623522B1F5C209FB693079EDAD5E359976AEEF07B18A41E94BE9FA9FAE6161B88F09B91CBB512F47ED47AF510A614DCFE8F1AA90BCE3E0459380BD3AF617A11677910CF651D55F71CA379459AA26C4521EE8A640A9DD553297E8D4A621625B938E3E8214F79B9BF5AE924B35BE320B4059737E8EFC2E49209F4B9A851028BEB19D467B82C96AB18549F458BC3C4618B440581C5A2C32D1658C20C2D541DCA16A7FC0816A40AB15C9BC04BD145600BD27C07CBD2063A2D4830ADE265D06FE0B661F0A707120B23407F1CF279F0356F6E1C88E750F830F3196193FE8A8C67CBE045960513C53CA79F827801C177DFCD31AF937F86A058A80073D4B764DE9D91B68280D93073ECCBE4EAF3DD33844C87F831DC8976F2B4A6B8F1BE4BCA7099684DE02C4DFC3A03C61CFCA63782DEA7E19FEB30EE4E83AB57133634F5A8EC4C3F6B60B7CFB78505E4D2CC77EE10CEF3903E0F5CF4B9E0FEEF491C16A7E25CF75C6F4EF3172F38D50D0F3F5079B6EF0364EA03E4C007C891C743DCB2A912E1153855A2BF0B262F13E8FBB076018E1CD4E682C072A90E683B6D00D719807BBF7C18563A871D5FC9BE6A010E6CA9529FC1F2F8DA486D54EADBE5D397C0F3E1CD12F3BB15348C1554CABD13FB2FC172DDF762B8A247627467E8715F4664782F84431D408CE4AB2734C685D7AE50817EEF0B43F7854AEE4C67D02C950BB3AB5C25D4EE22C8B84DC57227777DD9C11BAF6BBCEF941E90D2B5CCB75AB7D76504C94F85C1BCA72338517EF694D85F512E12377BF1E4DF8D53BC28840D739B74036FC1EEB0539D426261EA13CDDB224C0F4B4F7613CFA256E0CC930910FA371BEA739BAE4216F7E9E8EF48712C77EA589AE085E2E371656383E12272719C94E2A787F86CFD546CD5592A460250EBC5066AE3BAF19B1CFE4D5AF4229E2729D10079E5ECC547CB3290DF5B781803EF946EC5ED38C34653A1999378665803FB9D6583B2AC6BCDAD61DA25B155639753930CC11AB4EFBCDAF4F8345BAF5681C3B918A6596BB08DB72ABD4BABD1B42E0EA676FE28AACF83B91E8FB512F395308180957E271D855BF962DDFFF155B9EA61B02DDDA5BC4EA238CFB872E826AE7C674661669979B1C56C95F6C8B6C6470E153E72ABEF917D750F6CAB7BE050DD03B7EA1ED857776A5BDDA94375A76ED59DDA5777FFD0B6FB1E3AF4DE43B7CE7B5854F7B555526B6DE5A2AC1C75957DEBDE11BB637933BBB229B55399DD4A6C2F6AC835B8628D318A83A5C528D6A4B3286B93D44EC24D6A73119729CD47AF3A996D456D47AE3AB16535CD47AD3A996D356D47AC3AB16535CD47AB3A996D356D47AA3AB16535F9514AB78FD98C51754AA89ADA89F96AEA26B4D442F64AC84907D9B6A6D5A854A67428AD4B596DC5AB311AD9ED4775CB02E0AE14102CECB440717CEE50D1F8E23E95182A2D604FB7CBA82C904B66700C59595557CE4CD6913EC5D19F6B5F7B5735D8C6D791FE62AB83EB15D5A69C5BFE8BECFD3278ECDE76D26AE679B25A25F15E81C0BAF9675AB68A65DBACA34FF1224C972F51FC48CB8095D9C7B038AA55D7ECED870FE3517948E764FC4A102F13F5F26D1B735F1E73D6C514352713F3DDA736E66B79CCB7B336E68122E6FB36E6A13CE6D5691BF3479117150324ACE05E56D067C563923C2E493B46A4879F87C9FF62807E1851C1C311E1FCFE53FC479CFC33D6A5C3F97DFB0A8E1E2BCEEF6FC3C7F2E8B81E37CEEF67EB87944DA220C9F9FD1D5D030551CEEF8B8783E665E3E9118614294FC36268806923C62772270D18CE73BA16FF5B95AA7D18AA4E70A4AC481AAEA2ACABC7DFE5097E797FFF9E34DEA26B3A4563174E92BAC8CA86BE886FD2FF7B99106EB789FEA6ACF44FC18224F8B0EE9228A55B6E9D91ACBA24CA06BC2CBB47135DC990D3FC2579F83F5D0225016FD7199F46C9F35F7EE693EC5BA823C169BD97618A42DCE840757AF3EBAFBA9A86C4BDFE4D57CD9CDEECFFF84A57C1DC7E9A9DFD768A2918AD66126EF039371387B8D1669ACD7ED26EA55F759BE8E3C56FEFCEB49BE8EEEE77D70612BD9BFB68241E75A30D05DC22D16B36F122965E2352E93E161BB7587BEAE93AD6A5B3BBA6A3F136ABE78845BEAFDD8548E4A9B6A223915F3B495DBC1FECA35B30905B33195248FE765F57ECB7536DCDB5D6365DAB0BCD7A46EBECFE5AD75EBDBCBA7C8759A99AFD927358E2A1673288BBC28FD9C5E5F98777F757D7DA63DCA70F7717747C05594EFFF1EEF4E70F57E74E431DE6FCC567AB51C01B6D3C86DB8AE94EDB7AF7A71FDECE6617A7C6CD7E7F7B75F5F3C53BACF5755BA7F39DE3A3491AB45DE944F7C432FFA8DB81EE8FA8B88ACE737F40C555A8DAFB291557A16AEFF70F3FEAEADAFB7D0AD752D7525E907CF0A385DB1582FCE3E2FC1FBAFCF870F5AB2E3D6E6EAF5DD52AEB46CA47E3D088BBD23E85EE9CDD517337451B111D7D2FA4B19B1F30EEB67CC8BFC3DB15E9D3039E42F077BF5EE9768E4F971F2E3E5ED00DA4D545087D9379544ABB6D23E8D97236E777F162A4F58679754E987F647C3C2A0CE5A8383D1BE52F27E37F11AAA6CAA0D90A643268766E59F07DB6EC04FC2A3E0B97611E8EDE96EBBF451ED93C5888DB5844620BF6CB6DF8394C8BABACC5E6799C110645712E6EBD45F13C7A0A963A55E012833B77F8A3E14521DBECF890B3F0298C8B8BB73A6DE55E8E363B4E882A991D4F28122AB82979D5102590CE1387148DE8B7590D68AAF13822950B5FF8EDE3ACBA3E3A8C0117ED5C28AC6E4C8FC51A8ED1CC2BCA0A8EC14F2A0B0CB6602FF810B35EDFD81AC64275D0D26DF2878B6D580A3594A7A20CC84C6A1B43C9CC1BC8419B1766DE00AEDD587DDA398DDB56660275D05456B29742AD98093494A7A20CC14CC68EA939A5673FF287E37CDBA7DCC93A35F7B7809D920A18682BAFB629DB4CCEA5188493FCD38A3861D07716D9C98C3913B1E71977649684147FD01912D236BA65406FF40ECB41A54EC49ED3F4C5C09DD48370E187D48170B3EC94FEA3778ED504BC019DE67A62E10DE47097351A296FBE5BCB47A81A9AC69AF419503B6E422DE6AB3443F2B479EC53C922E1A95C4FECE45FD8A570DB8748B796935CE1750820798AD48E895CC37828C3A0FCAB1D76AB79C2BBF0F6C53FCEFD37CDBFC699380BFB6A6F4FDCDA70E4115B089D3644DE9484DB1B7F55D292736C630C5CDE01F8C93C9F8671087E4BADE34FE983499F92E0EB6B3B3167814A3EE074056A879D98A9D0CFE2495981CF4F6C38B683B312A0DCC34D488026D885B908FFCAA18C13E03554279641375659C4EE66EC36B20D28BFE63087BFF267CC3AA059BC146200F6DD641A8B8037E0133BCCD4D4847737D0A33C5A23A817730ECA7EC0611012E64E0C8337DC7347B2E6556CAD59106697B7D490F26B2E4478DB4E431AC653318663A07AC58E8FE88F833BBC4487D560F0D539AC75766861EE2653AF89DC402F9A39F16F938B2040FEDBBAFE0108FEDB5CFAB829DF219799F737ECA3E4D2A9824814080B567B6A265B5BF84C151CDAD1D0A6676AEB94ED4064689F8397B5A1F836BC82121E072DA424FACACC23A978390CC72BBEDEDB4E2DFEA676F9CE956490923C66081E28AEAF7F6B0C5B8A6CF41493BFD1102D81A61903F9C1EA8977B26619ACB4C372957A91508345D0F384205B1B2F07B674055E381C9AAF6211B69AB062D37C738CA55F109472087C4E90E369FBECA53945A1C70887632790FB96121368866F8993EC7B77186390C7EF2823AE7C91527F820BBF97B7131BAB60D1075C5206DBC23DFFC1B8A6D85B85DF357465DA0E6EAF4205D76A662FFBAB503338E73E14C7B89729A5D4C09EA974641CF2B2E5701B5F92520CADAC60116BADBC092FD66E845490136EACF5A51EB9BBD6A7DF0ED3A796CC95F74E0C9E920A0CC84A491BE99662A39BB380C7751DC6E083AA3B1B777080C58B3FDC308B37CF2E0CB688577D0DBE28CE3639F371974F3AC9ABA139A1F474E049DE645ECAE29DA7957FFEA26F90149D33A7EAA584B39F005F3E9FB2B076E793D5CF40F2142B1067610EDCF21D8FBAF700C0FBBA025D79AC66AC06709A201546A362458826440FA13ACB80A154A10A24C17D888026C4502376A77D20B42E5443D6689B3541EAD250C73EA0E250C10AACF6328D00D386A8109ACD3311A1095120941B8142EAF2AB3A65A74421842E542D535894266CABF7966474ABA3E863363B0032D0268E0E6ABB5E0B03B6C1AA562F67A46293979F156989463F5B3F154FCD08E9BB203546FBC679F5A43B84C54531C0EC1EF096E276D1D4D8DD03DC106417AA466A0D1308A80D54E3B44FFE40386D2087430D79F07044BD1245C50506266426CB1854720F6A6D9DF8015118E355888D85C6202263DF8415818E78249EB92021E93AF2622BA6E1CA8BAE1E3EA26AC30252530DADD6C2639C40E142C37D4541B502BD458942D21110E81E4A4FDE0E42616C0F5C28E8396AB026D0696A4BA140C7A859B6A0A693855020D7374A25042D5F483406B784E1AE82B8750BB5A0AD24C33B6001C522F5D2C25501F3D3C269500D61608E597AD2C5BC1F10A92434C881780BB197C3A08460670B1251E007E1E16A80E7E1AD85021E856715093EE971104F3B0B92480674960057837797602D0FDE3F0205844DDC5CA4D0CCE46452808EA72385E74EA9DB4B813BA04E4B01997C9A4B81B9F40D4800BF14CE141ABC164E1518B0FDF1F4FDAA48FA02325661A562846E289B5677084DC8DF87452A8CAE2E0BA58616960D2B0EAD1DB310E8C286B900982B9940EDF12B9B4CB9C14B9BAC8696D61BBCA5D90FBFF99B8548A5F58C66ECFAA161D5073594858B6DB80474C67CF4FA9BB90C861CE4E94B558800D4831A74EBCAB0DA838D62D5FD1D44C101977B04BDC45EEF31546AEC7D1EB98C2C2BD8DE4941EA08DF59114A2ADC5A31ACA970D7A49716056F4AC03C56DCA8E01989DFA980177AC0456D35686F5480CFE5CB45831DE0C7AA011CE18785032FCE6BC0F62B1EFA10382619F4A0B8587AE8A8382F0F646F410ED69B14D863C7800824E7929922C32793E92E0F6C8A4810FAB57D9813B068AD95D63D7846D6BCCE4318F8D0794CACE2B2639B62F191839BC662404E6AF64300E82421200EE58143A61AB223875435F0ED2925DA7042C1FB86EAD01B5A09BC9F584864883E831CAB92CB446F8AAC3882E5249B5EE6CDC5A12AE6384F1B763C99CDBF84ABA0FE703C2151E6E153BE0E96C5646D9935011F83A7A7287ECCBA94F597D1EC2998172B5A7F9B8D47CFAB659C9D8CBFE4F9D39BC9242BA1B3BD55344F932CF99C17AF764D82453299BE7AF5F7C9FEFE6455614CE68C3DCB1F3E6A73CA9334780CB9D082348BF07D94667931E43E04C54B63A78B9510AD3BBC846C2B37F900E793C4B66BB69B9B44C5FFAD19FF67FD4A59915F29C7BD3AF33D196A27D4F7A49EABE2005951E510DBA011921380D93C58066973824C3CE2789A2CD7AB5879F25182459D1E66C024A78A2568CB205A858BD99C5493C363424C10D70F3C52F1451FA17941356361A8CFFA586F178B34CC38A4F6A331CE29E10188550518E31553B91004AC438C11AF932C2FCE1A2E60583AD8BCF6C93ACE5344004D18705970C2F52ABE334F84DECC29565E4368EA0FD4E6B0D61D30A296DEC0920ED4CFCBD34B3C8E09C2751A7E8E9E598CE69B413988CA23A3419C579E90786D480519B0733E5FA7C19CE765FB551FE90319BBF335DF75BAAF064849FC0841759FF5B1CEC3A4E8B0A75FFE60C1E8EFDBD3EB50ABD6B6D3C1803A7D0E4B39C8305D252A7E80685580315EE7440CC0C43D8CE1B837BC9B3C1A5708D4C725E3575AD883E15DC44B800BD2C724063B8CC80498288E3CFACA8F93F5B76DEB50C8FE895BA78240F53B169C7A68027349D10EC74630EA20E253965C2751BF75A9852F965D0834EBD8EB25A080980063BC290A3835456C576945482E686B3AA3FA28AD658754006B744A25C216101CEFA468A46D6A7AC956BE7DB363A07A4D8EA71E7AC0AF93A2CDCB066E4DB3B6A7C5BCCE12AD5797B0A4B2795D91029A2536DFCD6689E769B27E12C1EACFFA589FB2301589D07D351EE1BDAD9E65C8AC1ABB0D8FA331CF1D3126AEEC1D241CEF2CCA828765C895ADFB6A32FF7CE4AB883A8B9598F0395C3B992B591CEF467084CCA908859BE44DAA7ED919267BDD8FA2EA297F49F2FEDA4007191C00B8D0AD695DFCECB565C322801A6D8AA61C4A01F953DA75019015003ED0448157BB6F445E79B11FC6AB713E541FF97DB4CCC334838185407DDCDF82E70841E582F4317FC7317FB7C59CAD1FB2791A3D5567CB98E66242B6A7E3A2272B6D3B2E0CA8D371B194DB383E6FA8B98A638FDE9A0A00D3682630559F4D54DBA8BF87410A1AAF55C0A6CC579F8635E72185939ACC790A8E091C81C416C790139252ECE6B4C22C4CBF86E9459CE5413C17ED162C9A555ECA5C1CF1EF8A9902687E0131F473F8352A2951605C9CB1D05C903EE6E5FE6A0501D2DFB74979490E26D92B310C544F99E1A987ECA6245573360358D9E703AD70AF48CF5B062F5278268E512E3F05F10284EE028CF0AE937F86B028A81023C4B7C45ECEF2102E251B68847B995C7DBE7B0651E9A0ADE986F03172FB09B8DDBCDB68BA5D38D0E65431EC537B1B4D4574AE94867FAEC3983F73417DDE944D538D74C09C9309D0C7BB7DBE2D8EC3D248F5277D8C3B11E3CE14A3675BA8AF2D81BE169BFE3D89C362D39183EC3E1B609DE62F0054FBD500A93A0F0580D101267879B6CF23959FCC30A622C6D414E340C43830C53812318EB66B7061AFA3F5B1BB0B229B6DEF2210DB3E069535E82AF04BB05C439BC0428C6DE447AD63FB20080C6DC6100C63772852D540CA1126CA7691A4B9A6E8971F08AA2E35D0E43BC18ABAF41823D8E0AD61437979CFDFFA3480A6B3380D2643A70A2436DF64CDB7CDEDD9FB3B092FBEC6C0D754FE56831C19D9EF6242FA9D666D88E9ADDB556F6CC71035188F27DD165DB7B956621DDAFA6C2D29B25EAB2920B6A5F570AD47B90A66F51EEA43784BD8D0BA21EE851118BA212B70981D6146E7EC196007E6097AB30C69BD4AFB240606AAC7073CF5B6D06073CDD55C77F7D95A08A65E63A189776F8FDBF76E7E1F9B71C4EE59467392B4BC90CB1D24E5C28CAF89EFFFF8AAF49C03DC136F826C30AF9328CEF9935C42A80D72752B390A51702A820D7EB1DE8C62D781C6B847A8908F2C657C2413F191BD848F14023E7292EF9144BC47D6D23D40A57B6029DD0399740FECA57BA090EE8193740F24D23DB096EE1495EED452BA539974A7F6D29D2AA43B7592EE5422DDA9B574F70F51F57B68A97D0F65CAF7D05EF71E2A54EFA193E63D2C24F81A41AEC3CC51F1C1CD766C930E6D0E239B6A60731BD764C39A3577EF923C58DECCAE40D82ED018572E091739E05270928184124CB831BA47273EEFA3385842D61E13608E07D59D0F3347452800049B630324E0820C3101EB8EFE6E8C868AD4C6AEAB13CA046A69D3D56931715AD873653AC09AA3BF1BA3A1D2B4B1E3EA8432695ADA70755A4C9A16F65B990EB0DEE8EFC668A8346DECB63AA14C9A96365B9D1693A685BD56A908D15AA3BF1BA3E1CAD3C24EAB134A55A79D8D56A74515E7A1A534B1C1C86E2C920C45D623917C20721987F061C8929BB035C6051962CA6A6F5F77ACE60EF5469BDED2FE2AD302D617FD7D9BD6889B77197DAE1123987A6BC468E2BFC47ABEE01D968FD2E65E7F697FB7DE616BCFAC8CCBD8B2DE8503D8B2BE59ED259677D55A45198F8870BE468BC24DEBEC25CBC3D55E75E2E4CFE5E9320A8BC5E226C2C7208E3E17FE94923FC2F8643C7DB53F1D8FDE2EA320ABDCF9D64E68DFF0EF536B79A5DD7F5D78A50D17AB099FDCDCB76D8192650B661B99A278BBDB8039743DFE397CE19BB9A190DEEBF5406CF460C9F184CFEE98E32B955351FE93F1D7209D7F29761C84A7C02FE245F87C32FE8F32E59BD1C56FF76DE21F46572969C537A357A3FF1C8F3E06CF1FC2F831FF72327E7D381E5DAE97CBE27AD8C9F873B0CCC40752240773AA22450553748AD3A664CB635A00667A4B15C118A7F050CB499592CDF4150D59BEADAE406C2E2565725863DCD6756D1FA895135B1C79DF1AB9F666DB0734EDD116C73FB49649E3D7D61E9B1E1C14BA087212ABA9875C340BDC8FCB81FA3C8C0B26878BEB20CFC394A8F18B455816DC4A5D18E8AE8BAC320BDE8CEE8848396DC5F648ADEC1B67B532129AD789755A6BAF823A77B5F6189DA3DA0AE3F332097253DE532E6A1D5068DFB415CC43A400D1EF26905F57C7D1DA65F8751C44697FB012643B6E324E350DC76836B9D3402D5C22332B0A97DCA9289CF7D9AA200BF23B2F7F1BA2319E671DB11AD7B3607F01104C3B8CE829CAA8D360F7F4B4BB0ED8FA6E9C56F51A8B6102F476694C571EC2B5F7B05E607D57B8F307DB07F2D40C5A6778E1FCC3DA436BF721A97B55BD7EA4E14755DD9754F47467FB902285DD976A8B537631594B94E8A06437BE79514946D305EB650B897F50243AE20114888DF98B533749BD0067A66ECB44F794270357FBA0F38860BED08217665F3A85D1D17A74A3390CA15D5BDA83744D2C61FAE18FB6E3FB962D7265D68B5C99FB2217E3CAD15C285472542C362DD579A5D5B55741B5C9B9803036B498F406723619A5103FABDAC394D4CD85D638854BC941E2C38D54A05F533DF1491C99AA2527EB3A8EF4EF4B010AAE511D2795A247D40AF079B5341D7E041FA8D6489CDF536B9CDF3DE1B00E4E2B986C45D4F72A89C3174FE62EE82354AF1320FB925077C1FD39F5697DF56671F5A28E84AB630EAD602355EF0BEBF4F523677DB1617367FB2C40EE2E9671F7E8127B5B05AA5D7C519A8A330674B49EC4B7A9F6469D6EC945F7A6BD65413938F59B07E7E91434C274E44E3B38D50431516DB053506D15875F3BD45275484FF1BF97C8B91575990FC32E449D103BCFA14E3094BF50271CD645A81314ED175417C864B26539C782CE7EF91BC3EB0C707DAB3B907C5FDD428B4679B5A96D98701E11511747CFC87F5979866CFF88E8927950604E77CFB6617C903A1A6AB51752474ADE7941E9C334D996FDE20DAE510185E91C9C3AACBAB5AE4D1D30688FA62E30A53B533780A92BC0812BC0510F9BF672879FDB3D2EEA758BCBC4C3E281D5980A65BE6F3B25131C960EB184A170F6F99D1EDB450FC657A9D1606BC608D0C7E777326C0D195837A5836CBD08CE3F35F75D40979F1A5B2E75BAFE973BB7688570E3172144B7A566C5E0D33B17C6DB34C7F7AC50BBE3C03E44B75B973AEB436FA29338F2FC2B8B1052669467D0210604B53FCDEF0D043450E79C73A046829D5CFE95DBC6447AA0D749FDA391989F49FC74BCEDBDABEF7BADBD6D656FC9BE2DEF75D34115B1AE36DD965845079BD61B9AA03B4D5FA5ABFD3C78813BF228B8236F723BF22EB623AF523BF028B5036F523BF02EB503AF529B7A94DAD49BD4A6DEA536F52AB5DA3792272C6F9AEDD0BB626BBC54FA41F33920F81B0FFC0F075EB9D6393A72ADA9EF7A7AAFA5AF269579DAD03B424CB98F74AB1EEF36D2B94CDE1A91F30FE901CC8BDDC23985749397479B85F5FFE801CB8BBDC2397D749396475B85F5EFE801CB8B9DC23975749396471B85F5DFE8A35BD3F6893D8827A5259A25F6508C8CAC61FC69765F8ADDB75EF748260F0608EF5CD143A93CD7CF4F339A191E262B85A0EFC1EFCBACA2F0DE6659328FCAF5B276FDB2F39D778F38AF7A172F46B7C932A4BC5BD525299C05EE751F8BA36451B15246B23E19EF0BCE29AFE2B37019E6E1A87093526CFA9D06D93C5888B527C55FE065A0BCFDB1E5A003D8B2FC8B900569D8302D76AF8BBE1767791A44A24BC8EB348AE7D153B0E4EBCF454417A1B117288F272D341F72163E8571B1AF0ED5D73DDF169E93B84A1EC7138A3C0A4E750E5E783F2A28B3F87874C30A61C3F08CF2B8C3D08CFEDE0BCBA432431A5DC3318919EB307F436EF90FC7BE7BDC6392531BF7CB36A8147DE932C31656B890B26197AF7C076415EEF086D1656D1C4E8F75DFBF5156A1F2415A57E101A8375669E43B04AB18EB0BF48968D598DFA2E965AE320637BC64D90EC2A6CAB7D0AED8F1B5EB2BBE0CDF9CFD0EB9F892E4891E5C1996433BA08D3640A00D682113FA6C8B0692785C62ECA42E1267285101DF2C99702121CDABF243D51FB174721E925FB037AAAE399B70BA35DB6FDF2CA140A9202D2A71CAD51F8D14990ECA20D09513C5A0E6CD129A41CD37B6F55EEDEDED0B0DB8612640B5431A057F31076840DC37557FACF158C00118464ABB1B067871309DCEBEFCFDCD98DDC2B17B49761BB5B84BBE6CBDB13D20590637B1B5A9B261EBBA600AEE1C8A69AB360ED766DDF76F8C35A85C90B6947AC9EA853DCA1C07601031E3BD8F4DB8E1439D2369A675DFD00023F8B99264B7D101A668F4DDDAB6188E389BDCAED025D0766C55D42CDAAD559D4189B4C1B51C032A6DC3324EC1A5E1E6DFC39160DB67DDBA34D9BD0937A99970FECFC80CDD0E0219D89203592F684E03356C4D2FC7B6ED657031D0503B470F0F9A6CA89184F1B0772F7A9F35EAC70A35C07AF343CE28D6811A6394ADA5A13BD6C38FA9F7A54F24AE0EFB2CE2B02CABBCC00D4433D6112BCFB326F42F4B34C86B629F651C8A69B587B9DE49D6781A14F8D506FC05A905BA5FECB37803B0AAF0E6B61B7B52A5AB43C6A02A3F7C338B86A22B47ABFC06E3CCD6EF4B0D4A98C177A6F4E9B2E1ADA9922DAC07CAFEF717BE2B0B4AFAACEBD08D90A0F3D9B61B830DE5638E2E05FDF99BE112E64F4F92EB4637AD682E6DFD20B431220D3E2099D268C3C312C5A2DD3A38B129466DEE188521B3863F4D51DDA82F184D528469CBF045F83E4AAB27E58AA7EB047215A966610EDCF81A8FBA5BFAE045AAD9FC4BB80A4EC68B8762B25FDDF6676308B6119F5B33A002393541702E4DA82A8746D18A193421207E13A8075F6D19635954A1926CAA088AAC845BE64276420C284B21923ADBEE74059465178A64D745D06003CABB2608638316DFD82D7EA8365430521D2A8622B7F640BF90511B02E5D106AAE09BBD1C11BE0901E19B40057CB9512540975F21D832400DD98D531074178A64D14550B734DCC068BB9A74C07A0B45D603EB288A2E58C7D2CFB959549765DDC451E4DD44D3C9BC5D7185F36D83D12CDB182A5297536491D1E56790CE658802B57D684144EE8220F42E549D03FB1E0198131705C9918B659073E7415E9A7B174D55822EA6BA14AD377930F32E14C9B38BA0CEAA3532A19CDA4024A3365C9D4FE3B809CCA70D44F269C3B97C28FB0DB6BBBAD589111517B0C090650C6421A3AD1F6E3E71294553B04E2D31F1266CF574AA2E71C7030940D77B8FB8A1245A4F657D1426113499173064969CB548181F31B828705732AE4587D731C4B41EABCC188C7895250763B123C36C8B6356E9905586BC6B28BB3CBCA66257E8CDF477C10D045867A9AF086F2A8E9D71B429BD5755D6BA328F069E5A76A06AB2D323495D65C791D1B3DA6C0746E7619BA97A3B6B93D41AB9FF0CDD0BA74A8BCC073754CD66F628AB267C380F3A9A4857139E970E5A4DE66E2C5045FCEEAC27854499CF6522C81EB6AC16AE81D01B9E5E944F7F5562D603E06A49D68BB17575B6A8D882C30055642EC301F5C32FCB792223B586D2285D4FD5521879D21B615E0DBC5EAB281D0AE5F7953C8F82FD5553321EA0B768BC0C05FD54A9BBAB812814E02287A92A18A81AEDCD04A426F0CD05A7CA18B4A51DDDC4B3F430EF1467EE4D5B005B49609681F9A5047869D7A9DAD4E16E79BDB153E0BE2ACEAE42F3354716962DAB4E9F36C66A8D9E4876AF30B7F2DDD5155BD136AF267BFC15A8A3E47CACA7A19E5E76AFBA2DB4AC6E5B35DCF4C44F717AB13D7BAD16779C10AB9DECD4E196B71E74600EA8A6F25C9DA76A8A0BFF655AC992BE5B9571DAAA4E7F7921EFC0D555CCA6748E2A799D54F9AC7EF3DE447B3AA60D3B9E54BB37F507F2334FD2E0312C660FCBACFC7A3CB95DC7C5EBB0D5AFB3B03878D8421C13CC389C33A771DA38C5B2447336882B5113857B48E36398070B32ACBC4DF3E87330CF49F0BC58FF8989E5F54BB05C9328EFC8E8BAB888AFD6F9D33A27550E570F4B4618C5E12259FEC713A1CCC7574FA531E8A30AA49851F1A0EE55FCD33A5A2EDA72BF07DE0141208A534BE721F95EB525196A09615E5AA4CB24D604AAC5D71EB6BA0B574F4B02965DC5B3E06B6853B64F59F8217C0CE62FE4FBD76851183A1888BA2158B11F9F45C1631AACB21AA34B4F7E120E2F56CFFFFAFF01B289D202F6F90100, N'6.1.3-40302')
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2002', 1, 15000060, N'EA Contest Clib', N'EA9LZ, W7EJ, M0DRX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2002', 2, 10000060, N'ITALY Clib', N'IK2QEI', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CabrilloInfo] ([ContestId], [CallSignId], [ClaimedScore], [Club], [Operators], [Address], [AddressCity], [AddressState], [AddressPostalCode], [AddressCountry]) VALUES (N'CQWWSSB2002', 3, 10000060, N'MOSCOW Clib', N'RL3FT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CallInfo] ([LogId], [StationName], [CallInfoId], [CallGroup], [UserName], [ContestId], [CallsignId], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (1, N'STN1', 0, 1, N'default', N'CQWWSSB2002', 1, N'default_cn2r_cn3a_cn2aa', 0, 2)
INSERT [dbo].[CallInfo] ([LogId], [StationName], [CallInfoId], [CallGroup], [UserName], [ContestId], [CallsignId], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (2, N'STN2', 0, 2, N'default', N'CQWWSSB2002', 2, N'default_cn2r_cn3a_cn2aa', 0, 3)
INSERT [dbo].[CallInfo] ([LogId], [StationName], [CallInfoId], [CallGroup], [UserName], [ContestId], [CallsignId], [SessionName], [Disabled], [QsoRadioTypeEnum]) VALUES (3, NULL, 0, 3, N'default', N'CQWWSSB2002', 3, N'default_cn2r_cn3a_cn2aa', 0, 4)
SET IDENTITY_INSERT [dbo].[CallSign] ON 

INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (1, N'CN2R', N'CN', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (2, N'CN3A', N'CN', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (3, N'CN2AA', N'CN', 5, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (4, N'DL1AA', N'DL', 3, -4, NULL, NULL, 0)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (5, N'2E0EDL', N'G', 3, -4, NULL, NULL, NULL)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (6, N'OE6Z', N'OE', 3, -4, NULL, NULL, NULL)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (7, N'9A7A', N'9A', 3, -4, NULL, NULL, NULL)
INSERT [dbo].[CallSign] ([CallSignId], [Call], [Prefix], [ContinentEnum], [Accuracy], [Latitude], [Longitude], [GeoCodeChk]) VALUES (8, N'CS2C', N'CT', 3, -4, NULL, NULL, NULL)
GO
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
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWCW2016', N'Cqww Cw 2016', 1, 1, CAST(N'2016-11-26 00:00:00.000' AS DateTime), CAST(N'2016-11-27 23:59:59.000' AS DateTime), 1)
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
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2015', N'Cqww Ssb 2015', 1, 1, CAST(N'2015-10-24 00:00:00.000' AS DateTime), CAST(N'2015-10-25 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'CQWWSSB2016', N'Cqww Ssb 2016', 1, 1, CAST(N'2016-10-29 00:00:00.000' AS DateTime), CAST(N'2016-10-30 23:59:59.000' AS DateTime), 1)
INSERT [dbo].[Contest] ([ContestId], [ContestName], [ContestTypeEnum], [QsoModeTypeEnum], [StartDateTime], [EndDateTime], [Active]) VALUES (N'RUSDXC2005', N'Russian DX 2005', 4, 3, CAST(N'2005-03-19 12:00:00.000' AS DateTime), CAST(N'2005-03-20 11:59:59.000' AS DateTime), 0)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (1, N'CQWW', 1, N'Zone', N'ZnMlt', N'CtyMlt', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (2, N'CQWPX', 1, N'Rx #', N'PfxMlt', N'', N'Prefix')
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (3, N'CQ160', 2, N'Cty/St/Pv', N'Cty/St/Pv-Mlt', N'', NULL)
INSERT [dbo].[ContestType] ([ContestTypeEnum], [ContestTypeEnumName], [QsoExchangeTypeEnum], [QsoExchangeName], [QsoMultName], [QsoMult2Name], [ExtraDataName]) VALUES (4, N'RUSDXC', 3, N'Obl/#', N'OblMlt', N'CtyMlt', NULL)
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (1, CAST(N'2002-10-26 00:00:00.000' AS DateTime), 1, N'CQWWSSB2002', 2, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (2, CAST(N'2002-10-26 00:00:00.000' AS DateTime), 2, N'CQWWSSB2002', 2, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (3, CAST(N'2002-10-26 00:00:00.000' AS DateTime), 3, N'CQWWSSB2002', 1, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (4, CAST(N'2002-10-26 00:00:00.000' AS DateTime), 4, N'CQWWSSB2002', 5, 14, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (5, CAST(N'2002-03-30 00:00:00.000' AS DateTime), 1, N'CQWPXSSB2002', 2, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (6, CAST(N'2002-03-30 00:00:00.000' AS DateTime), 2, N'CQWPXSSB2002', 2, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (7, CAST(N'2002-03-30 00:00:00.000' AS DateTime), 3, N'CQWPXSSB2002', 1, 33, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
INSERT [dbo].[Log] ([LogId], [ContestYear], [CallsignId], [ContestId], [LogCategoryId], [QsoExchangeNumber], [QsoDatabaseServerInstance], [QsoDatabaseInstance], [QsoDatabaseTableName], [WintestDataID], [N1mmDataID]) VALUES (8, CAST(N'2002-03-30 00:00:00.000' AS DateTime), 4, N'CQWPXSSB2002', 5, 14, N'PSS60\SQL2014', N'ContestqsoData', N'Qso', NULL, NULL)
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
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (11, 2, 0, 7, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (12, 3, 0, 1, 2, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (13, 3, 0, 1, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (14, 2, 0, 3, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (15, 2, 0, 5, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (16, 2, 0, 3, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (17, 2, 0, 5, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (18, 3, 0, 1, 3, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (19, 2, 0, 7, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (20, 2, 0, 6, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (21, 2, 0, 7, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (22, 2, 0, 7, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (23, 2, 0, 6, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (24, 2, 0, 7, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (25, 2, 0, 6, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (26, 2, 0, 7, 3, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (27, 2, 0, 5, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (28, 2, 0, 2, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (29, 2, 0, 2, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (30, 2, 0, 4, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (31, 2, 0, 4, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (32, 2, 0, 3, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (33, 2, 0, 5, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (34, 2, 0, 4, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (35, 2, 0, 6, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (36, 2, 0, 7, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (37, 2, 0, 2, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (38, 2, 0, 2, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (39, 2, 0, 5, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (40, 3, 0, 5, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (41, 2, 0, 3, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (42, 3, 0, 1, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (43, 3, 0, 1, 3, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (44, 2, 0, 6, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (45, 2, 0, 1, 3, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (46, 2, 0, 3, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (47, 2, 0, 4, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (48, 2, 0, 2, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (49, 2, 0, 2, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (50, 2, 0, 4, 4, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (51, 3, 0, 4, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (52, 3, 0, 1, 3, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (53, 3, 0, 1, 3, 2, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (54, 3, 0, 7, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (55, 2, 0, 3, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (56, 2, 0, 6, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (57, 2, 0, 7, 3, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (58, 3, 0, 1, 2, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (59, 2, 0, 4, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (60, 2, 0, 5, 4, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (61, 3, 0, 7, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (62, 2, 0, 1, 3, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (63, 2, 0, 1, 2, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (64, 2, 0, 1, 2, 2, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (65, 3, 0, 5, 2, 2, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (66, 3, 0, 3, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (67, 2, 0, 1, 2, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (68, 2, 0, 6, 2, 3, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (69, 3, 0, 6, 2, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (70, 2, 0, 4, 3, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (71, 3, 0, 4, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (72, 3, 0, 5, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (73, 3, 0, 6, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (74, 3, 0, 7, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (75, 2, 0, 1, 3, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (76, 3, 0, 7, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (77, 2, 0, 6, 4, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (78, 3, 0, 5, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (79, 2, 0, 1, 2, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (80, 3, 0, 1, 4, 2, 3)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (81, 3, 0, 6, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (82, 3, 0, 2, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (83, 3, 0, 5, 3, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (84, 2, 0, 6, 3, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (85, 2, 0, 4, 4, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (86, 3, 0, 6, 3, 2, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (87, 2, 0, 5, 4, 3, 4)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (88, 3, 0, 3, 2, 3, 2)
INSERT [dbo].[LogCategory] ([LogCategoryId], [CatOperatorEnum], [CatOperatorOverlayEnum], [CatBandEnum], [CatPowerEnum], [CatAssistedEnum], [CatNoOfTxEnum]) VALUES (89, 2, 0, 1, 3, 2, 4)
SET IDENTITY_INSERT [dbo].[LogCategory] OFF
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 1, N'STN1', CAST(14208.00 AS Decimal(18, 2)), 2, CAST(N'2002-10-26 00:00:01.000' AS DateTime), 59, 59, 33, 1, 2, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 1, CAST(N'2002-10-26 00:00:02.000' AS DateTime), 59, 59, 33, 1, 3, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 3, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2002-10-26 00:00:02.000' AS DateTime), 59, 59, 33, 1, 4, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 4, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2002-10-26 00:00:02.000' AS DateTime), 59, 59, 33, 1, 4, 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 5, N'STN1', CAST(14208.00 AS Decimal(18, 2)), 2, CAST(N'2002-03-30 00:00:01.000' AS DateTime), 59, 59, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 6, N'STN2', CAST(14208.00 AS Decimal(18, 2)), 1, CAST(N'2002-03-30 00:00:01.000' AS DateTime), 59, 59, 1, 1, 3, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 7, NULL, CAST(14278.20 AS Decimal(18, 2)), 1, CAST(N'2002-03-30 00:00:02.000' AS DateTime), 59, 59, 2, 1, 4, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (1, 8, NULL, CAST(14190.70 AS Decimal(18, 2)), 1, CAST(N'2002-03-30 00:00:02.000' AS DateTime), 59, 59, 1, 1, 4, 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (2, 1, N'STN2', CAST(14278.00 AS Decimal(18, 2)), 3, CAST(N'2002-10-26 00:00:01.000' AS DateTime), 59, 59, 33, 1, 2, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (2, 2, N'STN2', CAST(21290.70 AS Decimal(18, 2)), 3, CAST(N'2002-10-26 00:00:02.000' AS DateTime), 59, 59, 33, 1, 3, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (2, 5, N'STN2', CAST(14278.00 AS Decimal(18, 2)), 3, CAST(N'2002-03-30 00:00:02.000' AS DateTime), 59, 59, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (2, 6, N'STN1', CAST(21290.70 AS Decimal(18, 2)), 3, CAST(N'2002-03-30 00:00:02.000' AS DateTime), 59, 59, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (3, 2, N'STN1', CAST(14290.70 AS Decimal(18, 2)), 1, CAST(N'2002-10-26 00:00:02.000' AS DateTime), 59, 59, 33, 1, 2, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Qso] ([QsoNo], [LogId], [StationName], [Frequency], [CallsignId], [QsoDateTime], [RxRst], [TxRst], [QsoExchangeNumber], [QsoModeTypeEnum], [QsoRadioTypeEnum], [QZoneMult], [QCtyMult], [QPrefixMult], [QPts1], [QPts2], [QPts4], [QPts8]) VALUES (3, 6, N'STN2', CAST(14290.70 AS Decimal(18, 2)), 1, CAST(N'2002-03-30 00:00:01.000' AS DateTime), 59, 59, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (1, 5, 1)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (1, 6, 1)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (1, 7, 1)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (2, 5, 2)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (2, 6, 1)
INSERT [dbo].[QsoExchangeNumber] ([QsoNo], [LogId], [QsoExhangeNumberValue]) VALUES (3, 6, 2)
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
INSERT [dbo].[Session] ([SessionName], [UserName], [SessionDateTime], [CategorySettings], [FiltersSettings], [XaxisSettings], [YaxisSettings], [Subscription]) VALUES (N'default_cn2r_cn3a_cn2aa', N'default', CAST(N'2016-06-17 10:14:23.363' AS DateTime), N'<CatDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><CatOperatorEnum>ALL</CatOperatorEnum><CatAssistedEnum>ALL</CatAssistedEnum><CatBandEnum>ALL</CatBandEnum><CatNoOfTxEnum>ALL</CatNoOfTxEnum><CatPowerEnum>ALL</CatPowerEnum></CatDefault>', N'<FiltDefaullt xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><FiltBnd>ALL</FiltBnd><FiltCont>ALL</FiltCont><FiltPref /><FiltCQZoneVal>ALL</FiltCQZoneVal></FiltDefaullt>', N'<XaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><XaxisDurationTime>48</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>', N'<YaxisDefault xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Id>1</Id><UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>', NULL)
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN3')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (1, N'STN4')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (2, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (5, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (5, N'STN2')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (5, N'STN3')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (5, N'STN4')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (6, N'STN1')
INSERT [dbo].[Station] ([LogId], [StationName]) VALUES (6, N'STN2')
INSERT [dbo].[UbnDupes] ([QsoNo], [LogId]) VALUES (1, 3)
INSERT [dbo].[UbnIncorrectCall] ([QsoNo], [LogId], [CorrectCall]) VALUES (1, 3, N'CN4P')
INSERT [dbo].[UbnIncorrectExchange] ([QsoNo], [LogId], [CorrectExchange]) VALUES (1, 3, N'33')
INSERT [dbo].[UbnNotInLog] ([QsoNo], [LogId]) VALUES (1, 2)
INSERT [dbo].[UbnNotInLog] ([QsoNo], [LogId]) VALUES (1, 3)
INSERT [dbo].[UbnNotInLog] ([QsoNo], [LogId]) VALUES (2, 1)
INSERT [dbo].[UbnUniques] ([QsoNo], [LogId]) VALUES (1, 1)
INSERT [dbo].[UbnUniques] ([QsoNo], [LogId]) VALUES (1, 3)
INSERT [dbo].[UbnUniques] ([QsoNo], [LogId]) VALUES (3, 2)
/****** Object:  Index [IX_CallSignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_CallSignId')
CREATE NONCLUSTERED INDEX [IX_CallSignId] ON [dbo].[CabrilloInfo]
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CabrilloInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CabrilloInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[CallInfo]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[CallInfo]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LogId_StationName]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_LogId_StationName')
CREATE NONCLUSTERED INDEX [IX_LogId_StationName] ON [dbo].[CallInfo]
(
	[LogId] ASC,
	[StationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoRadioTypeEnum]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_QsoRadioTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoRadioTypeEnum] ON [dbo].[CallInfo]
(
	[QsoRadioTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SessionName]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallInfo]') AND name = N'IX_SessionName')
CREATE NONCLUSTERED INDEX [IX_SessionName] ON [dbo].[CallInfo]
(
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Call]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CallSign]') AND name = N'IX_Call')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Call] ON [dbo].[CallSign]
(
	[Call] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContestTypeEnum]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_ContestTypeEnum')
CREATE NONCLUSTERED INDEX [IX_ContestTypeEnum] ON [dbo].[Contest]
(
	[ContestTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoModeTypeEnum]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Contest]') AND name = N'IX_QsoModeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoModeTypeEnum] ON [dbo].[Contest]
(
	[QsoModeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoExchangeTypeEnum]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ContestType]') AND name = N'IX_QsoExchangeTypeEnum')
CREATE NONCLUSTERED INDEX [IX_QsoExchangeTypeEnum] ON [dbo].[ContestType]
(
	[QsoExchangeTypeEnum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[Log]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Log]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND name = N'IX_LogCategoryId')
CREATE NONCLUSTERED INDEX [IX_LogCategoryId] ON [dbo].[Log]
(
	[LogCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeAlpha]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeAlpha]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExchangeNumber]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QsoNo_LogId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[QsoExtraData]') AND name = N'IX_QsoNo_LogId')
CREATE NONCLUSTERED INDEX [IX_QsoNo_LogId] ON [dbo].[QsoExtraData]
(
	[QsoNo] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallSignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_CallSignId')
CREATE NONCLUSTERED INDEX [IX_CallSignId] ON [dbo].[Spot]
(
	[CallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[Spot]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SpoterCallSignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Spot]') AND name = N'IX_SpoterCallSignId')
CREATE NONCLUSTERED INDEX [IX_SpoterCallSignId] ON [dbo].[Spot]
(
	[SpoterCallSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Station]') AND name = N'IX_LogId')
CREATE NONCLUSTERED INDEX [IX_LogId] ON [dbo].[Station]
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CallsignId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_CallsignId')
CREATE NONCLUSTERED INDEX [IX_CallsignId] ON [dbo].[UbnSummary]
(
	[CallsignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ContestId]    Script Date: 4/20/2017 4:02:36 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[UbnSummary]') AND name = N'IX_ContestId')
CREATE NONCLUSTERED INDEX [IX_ContestId] ON [dbo].[UbnSummary]
(
	[ContestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogCategoryId]    Script Date: 4/20/2017 4:02:36 PM ******/
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
ON DELETE CASCADE
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]'))
ALTER TABLE [dbo].[QsoExchangeNumber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExchangeNumber]'))
ALTER TABLE [dbo].[QsoExchangeNumber] CHECK CONSTRAINT [FK_dbo.QsoExchangeNumber_dbo.Qso_QsoNo_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId] FOREIGN KEY([QsoNo], [LogId])
REFERENCES [dbo].[Qso] ([QsoNo], [LogId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]') AND parent_object_id = OBJECT_ID(N'[dbo].[QsoExtraData]'))
ALTER TABLE [dbo].[QsoExtraData] CHECK CONSTRAINT [FK_dbo.QsoExtraData_dbo.Qso_QsoNo_LogId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.CallSign_CallSignId] FOREIGN KEY([CallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_CallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.CallSign_CallSignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.CallSign_SpoterCallSignId] FOREIGN KEY([SpoterCallSignId])
REFERENCES [dbo].[CallSign] ([CallSignId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.CallSign_SpoterCallSignId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Spot_dbo.Contest_ContestId] FOREIGN KEY([ContestId])
REFERENCES [dbo].[Contest] ([ContestId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Spot_dbo.Contest_ContestId]') AND parent_object_id = OBJECT_ID(N'[dbo].[Spot]'))
ALTER TABLE [dbo].[Spot] CHECK CONSTRAINT [FK_dbo.Spot_dbo.Contest_ContestId]
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
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogs]    Script Date: 4/20/2017 4:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_GetContestLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CQD_sp_GetContestLogs] AS' 
END
GO

--Create the Proc
ALTER PROCEDURE [dbo].[CQD_sp_GetContestLogs] 
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
/****** Object:  StoredProcedure [dbo].[CQD_sp_GetContestLogsUnion]    Script Date: 4/20/2017 4:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_GetContestLogsUnion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CQD_sp_GetContestLogsUnion] AS' 
END
GO

--Create the Proc
ALTER PROCEDURE [dbo].[CQD_sp_GetContestLogsUnion] 
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
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoInsertContacts]    Script Date: 4/20/2017 4:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoInsertContacts]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CQD_sp_QsoInsertContacts] AS' 
END
GO

--Create the Proc
ALTER PROCEDURE [dbo].[CQD_sp_QsoInsertContacts](@InsertContacts udt_QsoContacts READONLY)
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
GRANT EXECUTE ON [dbo].[CQD_sp_QsoInsertContacts] TO [jims9m8r] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdatePointsMults]    Script Date: 4/20/2017 4:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoUpdatePointsMults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CQD_sp_QsoUpdatePointsMults] AS' 
END
GO

--Create the Proc
ALTER PROCEDURE [dbo].[CQD_sp_QsoUpdatePointsMults](@UpdatedQsoPointsMult udt_QsoPointsMults READONLY)
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
GRANT EXECUTE ON [dbo].[CQD_sp_QsoUpdatePointsMults] TO [jims9m8r] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[CQD_sp_QsoUpdateStationNames]    Script Date: 4/20/2017 4:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CQD_sp_QsoUpdateStationNames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames] AS' 
END
GO

--Create the Proc
ALTER PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames](@UpdatedQsoStationName udt_QsoStationNames READONLY)
AS UPDATE dbo.Qso
   SET 
   Qso.StationName = ec.QStationName,
   Qso.Frequency = ec.Frequency
  FROM Qso INNER JOIN @UpdatedQsoStationName AS ec
   ON Qso.QsoNo = ec.QsoNo AND Qso.LogId = ec.LogId;

GO
GRANT EXECUTE ON [dbo].[CQD_sp_QsoUpdateStationNames] TO [jims9m8r] AS [dbo]
GO
USE [master]
GO
ALTER DATABASE [ContestqsoDataTest] SET  READ_WRITE 
GO
