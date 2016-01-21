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
    public class QsoSeeds
    {
        //  add to configuration.cs           QsoSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.Qso.AddOrUpdate(
            p => p.QsoNo,
                new Qso {    QsoNo = 1, LogId = 1, Frequency= 14208M, CallsignId = 2,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationId = 1, QsoDateTime =  DateTime.Parse("10/23/2015 00:00:01"), QsoRadioTypeEnum = QsoRadioTypeEnum.R1 },
                new Qso {    QsoNo = 2, LogId = 2, Frequency = 21290.7M, CallsignId = 3,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationId = 1, QsoDateTime =  DateTime.Parse("10/23/2015 00:00:02"), QsoRadioTypeEnum = QsoRadioTypeEnum.R2 } 
                                  
            );


        }

    }
}
