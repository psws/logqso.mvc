declare @p__linq__0 varchar(50)
set  @p__linq__0  = 'CQWWSSB2014'
declare @p__linq__1 varchar(50)
set  @p__linq__1  = 'C'
SELECT 
    [Project1].[CallSignId] AS [CallSignId], 
    [Project1].[Call] AS [Call]
    FROM ( SELECT 
        [Extent1].[CallSignId] AS [CallSignId], 
        [Extent1].[Call] AS [Call]
        FROM  [dbo].[CallSign] AS [Extent1]
        INNER JOIN [dbo].[Log] AS [Extent2] ON [Extent1].[CallSignId] = [Extent2].[CallsignId]
        WHERE (([Extent2].[ContestId] = @p__linq__0) OR (([Extent2].[ContestId] IS NULL) AND (@p__linq__0 IS NULL))) AND (((SUBSTRING([Extent1].[Call], 0 + 1, 1)) = @p__linq__1) OR ((SUBSTRING([Extent1].[Call], 0 + 1, 1) IS NULL) AND (@p__linq__1 IS NULL)))
    )  AS [Project1]
    ORDER BY [Project1].[Call] ASC
-- p__linq__0: 'CQWWSSB2014' (Type = String, Size = 4000)
-- p__linq__1: 'C' (Type = String, Size = 4000)