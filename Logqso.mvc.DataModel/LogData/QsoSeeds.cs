using System;
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
                        RxRst = 59, TxRst = 59, StationName = "STN1", QsoDateTime =  DateTime.Parse("10/26/2002 00:00:01"), QsoRadioTypeEnum = QsoRadioTypeEnum.R1,
                        QsoExchangeNumber = 33, QZoneMult = true, QCtyMult = true, QPrefixMult = true,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false},
                 new Qso {    QsoNo = 2, LogId = 1, Frequency= 14278M, CallsignId = 3,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationName = "STN2", QsoDateTime =  DateTime.Parse("10/26/2002 00:00:01"), QsoRadioTypeEnum = QsoRadioTypeEnum.R1,
                        QsoExchangeNumber = 33, QZoneMult = false, QCtyMult = false, QPrefixMult = false,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false},
               new Qso {    QsoNo = 1, LogId = 2, Frequency = 21290.7M, CallsignId = 1,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationName = "STN2", QsoDateTime =  DateTime.Parse("10/26/2002 00:00:02"), QsoRadioTypeEnum = QsoRadioTypeEnum.R2,
                        QsoExchangeNumber = 33, QZoneMult = true, QCtyMult = true, QPrefixMult = true,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false} ,
               new Qso {    QsoNo = 2, LogId = 2, Frequency = 21290.7M, CallsignId = 3,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationName = "STN2", QsoDateTime =  DateTime.Parse("10/26/2002 00:00:02"), QsoRadioTypeEnum = QsoRadioTypeEnum.R2,
                        QsoExchangeNumber = 33, QZoneMult = false, QCtyMult = false, QPrefixMult = false,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false}, 
               new Qso {    QsoNo = 3, LogId = 2, Frequency = 14290.7M, CallsignId = 1,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59, StationName = "STN1", QsoDateTime =  DateTime.Parse("10/26/2002 00:00:02"), QsoRadioTypeEnum = QsoRadioTypeEnum.R1,
                        QsoExchangeNumber = 33, QZoneMult = false, QCtyMult = false, QPrefixMult = false,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false}, 
               new Qso {    QsoNo = 1, LogId = 3, Frequency = 14190.7M, CallsignId = 1,  QsoModeTypeEnum = common.Enum.QsoModeTypeEnum.SSB,
                        RxRst = 59, TxRst = 59,  QsoDateTime =  DateTime.Parse("10/26/2002 00:00:02"), QsoRadioTypeEnum = QsoRadioTypeEnum.Run,
                        QsoExchangeNumber = 33, QZoneMult = true, QCtyMult = true, QPrefixMult = true,
                        QPts1 = false, QPts2 = false, QPts4 = false, QPts8 = false} 
                                  
            );


        }

    }
}
