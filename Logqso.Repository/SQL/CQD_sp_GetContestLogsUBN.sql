USE [ContestqsoData]
GO
IF OBJECT_ID ( 'CQD_sp_GetContestLogsUBN' , 'P' ) IS NOT NULL   
    DROP PROCEDURE [dbo].[CQD_sp_GetContestLogsUBN] ;  
GO  

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_GetContestLogs] 
	@Logid1	int,
	@logid2	int,
	@logid3 int

AS 
	--BEGIN

    SET NOCOUNT ON;

    Select Qso.QsoDateTime as Time, [Qso].QsoNo, [Qso].LogId, CallSign.Call, qso.Frequency,
		qso.QCtyMult as C, Qso.QZoneMult as Z, Qso.QPrefixMult as P, qso.QsoRadioTypeEnum as R,
		Qso.StationName as S
	 From [dbo].[Qso]
	 inner join CallSign on qso.CallsignId = CallSign.CallSignId
	 where logid = @Logid1
	 order by  [Qso].QsoNo,Qso.QsoDateTime;
    
	Select Qso.QsoDateTime as Time, [Qso].QsoNo, [Qso].LogId, CallSign.Call,qso.Frequency,
		qso.QCtyMult as C, Qso.QZoneMult as Z, Qso.QPrefixMult as P, qso.QsoRadioTypeEnum as R,
		Qso.StationName as S
	 From [dbo].[Qso]
	 inner join CallSign on qso.CallsignId = CallSign.CallSignId
	 where logid = @Logid2
	 order by  [Qso].QsoNo,Qso.QsoDateTime;
    
	Select Qso.QsoDateTime as Time, [Qso].QsoNo, [Qso].LogId, CallSign.Call, qso.Frequency,
		qso.QCtyMult as C, Qso.QZoneMult as Z, Qso.QPrefixMult as P, qso.QsoRadioTypeEnum as R,
		Qso.StationName as S
	 From [dbo].[Qso]
	 inner join CallSign on qso.CallsignId = CallSign.CallSignId
	 where logid = @Logid3
	 order by  [Qso].QsoNo,Qso.QsoDateTime;
  --END
  