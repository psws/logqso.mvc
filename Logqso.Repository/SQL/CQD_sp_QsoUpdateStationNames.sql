USE [ContestqsoData]
GO


/*DROP-CREATE THE PROC*/
--Check for Object and delete if exists
IF OBJECT_ID(N'[dbo].[CQD_sp_QsoUpdateStationNames]') IS NOT NULL DROP PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames]
/*DROP-CREATE THE TABLE TYPE*/
--Check for Object and delete if exists
IF TYPE_ID(N'[dbo].[udt_QsoStationNames]') IS NOT NULL DROP TYPE [dbo].[udt_QsoStationNames]
GO

CREATE TYPE [dbo].[udt_QsoStationNames] AS TABLE(  
QsoNo smallint NOT NULL,
LogId int NOT NULL,    
QStationName  varchar(20) ,
Frequency decimal(18,2) NOT NULL
);
Go

--Create the Proc
CREATE PROCEDURE [dbo].[CQD_sp_QsoUpdateStationNames](@UpdatedQsoStationName udt_QsoStationNames READONLY)
AS UPDATE dbo.Qso
   SET 
   Qso.StationName = ec.QStationName,
   Qso.Frequency = ec.Frequency
  FROM Qso INNER JOIN @UpdatedQsoStationName AS ec
   ON Qso.QsoNo = ec.QsoNo AND Qso.LogId = ec.LogId;
GO
   
GRANT EXEC ON [dbo].[CQD_sp_QsoUpdateStationNames] TO jims9m8r
GO
GRANT EXEC ON TYPE ::[dbo].[udt_QsoStationNames] TO jims9m8r;
GO 