USE [ContestqsoData]
GO
IF OBJECT_ID ( 'CQD_sp_GetContestLogs' , 'P' ) IS NOT NULL   
    DROP PROCEDURE [dbo].[CQD_sp_GetContestLogs] ;  
GO  

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
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
	 @Endtime datetime = null

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
		) as X
	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))


	 ORDER BY W, Time, CGroup ASC, q.QsoNo


	 SET DATEFIRST @restore


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
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))


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
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

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
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

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
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (q.QsoExchangeNumber = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

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
	 where (q.LogId = @Logid1 or q.LogId = @Logid2 or q.LogId = @Logid3) AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (q.QsoExchangeNumber = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	

	ORDER BY  Time, CGroup, d.QsoNo
  END
  