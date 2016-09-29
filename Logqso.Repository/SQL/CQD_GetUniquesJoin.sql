Select w.QsoNo
from Qso w
			 INNER JOIN Log l on w.LogId = l.LogId
			 where l.ContestId = 'CQWWSSB2015' and  

 w.CallsignId in 

(SELECT
  y.CallsignId
	from 
		(select q.callsignid
		from Qso q
			 INNER JOIN Log l on q.LogId = l.LogId
			 where l.ContestId = 'CQWWSSB2015' 
		GROUP BY  q.callsignid
		HAVING COUNT(*) = 1) as x
		inner join 
		(select q.callsignid 
			from Qso q
			where q.LogId = 14001 
			GROUP BY  q.callsignid
			HAVING COUNT(*) = 1) as y

		on x.CallsignId = y.CallsignId
		);
 
