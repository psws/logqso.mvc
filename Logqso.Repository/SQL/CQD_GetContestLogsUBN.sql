
DECLARE @datetime datetime = '7/3/2016'
DECLARE @D int
IF DATENAME(weekday, @datetime) IN (N'Saturday')
        SET @D = 1
ELSE 
		SET @D = 2

	--DECLARE @Logid1	int = 535;
	--DECLARE @logid2	int = 537;
	--DECLARE @logid3 int = 532;
	--DECLARE @FreqLow decimal = 14000.0;
	--DECLARE @Freqhigh decimal = 14350.0;

	DECLARE @Logid1	int = 1;
	DECLARE @logid2	int = 2;
	DECLARE @logid3 int = 3;
	DECLARE @FreqLow decimal = 14000.0;
	DECLARE @Freqhigh decimal = 14350.0;

	DECLARE @ContinentEnum int = null;
	DECLARE  @Country varchar(10) = null;;
	DECLARE  @Zone smallint = null;;

	DECLARE   @StartTime datetime= null;;
	DECLARE   @Endtime datetime= null;;

	--BEGIN


    SET NOCOUNT ON
	DECLARE @restore tinyint = @@DATEFIRST
	SET DATEFIRST 6
    Select  DATEPART(dw,q.[QsoDateTime]) as D, q.QsoDateTime as Time, 1 AS CGroup, q.QsoNo,q.LogId, c.Call, q.Frequency,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S
	 From [dbo].[Qso] q
	 INNER JOIN CallSign c  on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))


	 UNION ALL
    
	
    Select  DATEPART(dw,q.[QsoDateTime]) as D, q.QsoDateTime as Time, 2 AS CGroup, q.QsoNo,q.LogId, c.Call, q.Frequency,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S
	 From [dbo].[Qso] q
	 INNER JOIN CallSign c on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where q.LogId = @Logid2  AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
    
	UNION ALL

	
    Select  DATEPART(dw,q.[QsoDateTime]) as D, q.QsoDateTime as Time, 3 AS CGroup, q.QsoNo,q.LogId, c.Call, q.Frequency,
		q.QCtyMult as C, q.QZoneMult as Z, q.QPrefixMult as P, q.QsoRadioTypeEnum as R,
		q.StationName as S
	 From [dbo].[Qso] q
	 INNER JOIN CallSign c on q.CallsignId = c.CallSignId
	 INNER JOIN Log l on q.LogId = l.LogId
	 where q.LogId = @Logid3  AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	 ORDER BY  Time, CGroup ASC, q.QsoNo


	 SET DATEFIRST @restore


--Uniques
	  Select q.QsoDateTime as Time, 1 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 INNER JOIN Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	UNION ALL

	 Select q.QsoDateTime as Time, 2 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 inner join Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid2 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	UNION ALL
	 
	--Uniques
	 Select q.QsoDateTime as Time,  3 AS CGroup, u.LogId, u.QsoNo
	 From UbnUniques u
	 INNER JOIN  Qso q on u.QsoNo = q.QsoNo and
		 u.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid3 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	ORDER BY  q.QsoDateTime, CGroup, u.QsoNo

	--Nils
	Select q.QsoDateTime as Time, 1 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN  Qso q on n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time, 2 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN Qso q on n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid2 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time,  3 AS CGroup, n.LogId, n.QsoNo
	 From UbnNotInLog n
	 INNER JOIN Qso q ON n.QsoNo = q.QsoNo and
		 n.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid3 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	ORDER BY  q.QsoDateTime, CGroup, n.QsoNo

	--Dupes
	Select q.QsoDateTime as Time, 1 AS CGroup, d.LogId, d.QsoNo
	 From UbnDupes d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time, 2 AS CGroup, d.LogId, d.QsoNo
	 From UbnNotInLog d
	 INNER JOIN Qso q  on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid2 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time,  3 AS CGroup, d.LogId, d.QsoNo
	 From UbnNotInLog d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid3 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	ORDER BY  q.QsoDateTime, CGroup, d.QsoNo

	--Bad Call
	Select q.QsoDateTime as Time, 1 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time, 2 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q  on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid2 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time,  3 AS CGroup, d.LogId, d.QsoNo, d.CorrectCall
	 From UbnIncorrectCall d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid3 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	ORDER BY  q.QsoDateTime, CGroup, d.QsoNo

		--Bad Exchange
	Select q.QsoDateTime as Time, 1 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid1 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time, 2 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q  on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid2 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))
	UNION ALL

	 Select q.QsoDateTime as Time,  3 AS CGroup, d.LogId, d.QsoNo, d.CorrectExchange
	 From UbnIncorrectExchange d
	 INNER JOIN Qso q on d.QsoNo = q.QsoNo and
		 d.LogId = q.LogId
	 INNER JOIN Callsign c on q.CallsignId = c.CallSignId 
		 Where q.LogId = @Logid3 AND
	 	((@FreqLow is null) or (q.Frequency BETWEEN @FreqLow AND @FreqHigh)) AND
		((@ContinentEnum is null) or (c.ContinentEnum = @ContinentEnum)) AND
		((@Country is null) or (c.Prefix = @Country)) AND
		((@Zone is null) or (c.Prefix = @Zone)) AND
	 	((@StartTime is null) or (q.QsoDateTime BETWEEN @StartTime AND @Endtime))

	ORDER BY  q.QsoDateTime, CGroup, d.QsoNo

