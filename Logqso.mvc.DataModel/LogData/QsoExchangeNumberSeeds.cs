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
    class QsoExchangeNumberSeeds
    {
        public static void SeedQsoExchangeNumber(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.QsoExchangeNumber.AddOrUpdate(
            p => p.QsoNo,
                new QsoExchangeNumber { LogId = 5, QsoNo = 1, QsoExhangeNumberValue = 1,},
                new QsoExchangeNumber { LogId = 5, QsoNo = 2, QsoExhangeNumberValue = 2,},
                new QsoExchangeNumber { LogId = 6, QsoNo = 1, QsoExhangeNumberValue = 1,},
                new QsoExchangeNumber { LogId = 6, QsoNo = 2, QsoExhangeNumberValue = 1,},
                new QsoExchangeNumber { LogId = 6, QsoNo = 3, QsoExhangeNumberValue = 2,},
                new QsoExchangeNumber { LogId = 7, QsoNo = 1, QsoExhangeNumberValue = 1,}

            );


        }



    }
}
