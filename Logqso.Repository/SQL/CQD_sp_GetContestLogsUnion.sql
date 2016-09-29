USE [ContestqsoData]
GO
IF OBJECT_ID ( 'CQD_sp_GetContestLogsUnion' , 'P' ) IS NOT NULL   
    DROP PROCEDURE [dbo].[CQD_sp_GetContestLogsUnion'] ;  
GO  

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
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
