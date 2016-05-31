SELECT [Time1] AS IntvTime, Sum(Qry5minintervals.N) AS N
                    FROM (SELECT   convert(datetime, Format([Qso].[QsoDateTime],'d')
                      + ' ' + Format(DatePart(hh,[Qso].[QsoDateTime]),'00')
                      + ':' + Format((DatePart(n,[Qso].[QsoDateTime])/15)*15,'00'),120) AS [Time1] ,
                    Count(*) AS N 

                       FROM Qso INNER JOIN [Log] ON [Qso].[LogId] = [Log].[LogId] 
					   INNER JOIN [CallSign] ON [Qso].[CallsignId] = [CallSign].[CallSignId]
					   AND Log.LogId = 1 
					   --AND ([Qso].[Frequency] >= 14000.0 and [Qso].[Frequency] <= 14350.0)
 					   --AND ([Qso].[Frequency] >= 21000.0 and [Qso].[Frequency] <= 21450.0)
					   --AND [CallSign].[ContinentEnum] = 4
                         GROUP BY  [Qso].[QsoDateTime] ) AS Qry5minintervals 
                          GROUP BY [Time1] 