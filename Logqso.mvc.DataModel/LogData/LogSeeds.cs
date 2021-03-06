﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.DataModels;

namespace Logqso.mvc.DataModel.LogData
{
    public class LogSeeds
    {
        //  add to configuration.cs          LogSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.Log.AddOrUpdate(
            p => p.LogId,
                new Log {  LogId = 1, CallsignId = 1,  ContestId = "CQWWSSB2002", ContestYear = DateTime.Parse("10/26/2002 00:00:00"),
                                    LogCategoryId = 2, QsoExchangeNumber = 33,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014",QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"},
                new Log {   LogId = 2, CallsignId = 2 , ContestId = "CQWWSSB2002", ContestYear = DateTime.Parse("10/26/2002 00:00:00"),
                                    LogCategoryId = 2, QsoExchangeNumber = 33, 
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014",  QsoDatabaseInstance = "ContestqsoData",QsoDatabaseTableName = "Qso"},
                new Log {   LogId = 3, CallsignId = 3,  ContestId = "CQWWSSB2002", ContestYear = DateTime.Parse("10/26/2002 00:00:00"),
                                    LogCategoryId = 1, QsoExchangeNumber = 33,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014", QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"},
                new Log {   LogId = 4, CallsignId = 4,  ContestId = "CQWWSSB2002", ContestYear = DateTime.Parse("10/26/2002 00:00:00"),
                                    LogCategoryId = 5, QsoExchangeNumber = 14,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014", QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"},
                //WPX
                new Log {  LogId = 5, CallsignId = 1,  ContestId = "CQWPXSSB2002", ContestYear = DateTime.Parse("03/30/2002 00:00:00"),
                                    LogCategoryId = 2, QsoExchangeNumber = 33,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014",QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"},
                new Log {  LogId = 6, CallsignId = 2 , ContestId = "CQWPXSSB2002", ContestYear = DateTime.Parse("03/30/2002 00:00:00"),
                                    LogCategoryId = 2, QsoExchangeNumber = 33, 
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014",  QsoDatabaseInstance = "ContestqsoData",QsoDatabaseTableName = "Qso"},
                new Log {   LogId = 7, CallsignId = 3,  ContestId = "CQWPXSSB2002", ContestYear = DateTime.Parse("03/30/2002 00:00:00"),
                                    LogCategoryId = 1, QsoExchangeNumber = 33,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014", QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"},
                new Log {   LogId = 8, CallsignId = 4,  ContestId = "CQWPXSSB2002", ContestYear = DateTime.Parse("03/30/2002 00:00:00"),
                                    LogCategoryId = 5, QsoExchangeNumber = 14,
                                    QsoDatabaseServerInstance =@"PSS60\SQL2014", QsoDatabaseInstance = "ContestqsoData", QsoDatabaseTableName = "Qso"}

                                    
            );


        }

    }
}
