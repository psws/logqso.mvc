using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.UbnModels;

namespace Logqso.mvc.DataModel.LogData
{
    public class UbnNotInLogSeeds
    {
        //  add to configuration.cs           UbnNotInLogSeeds.SeedContest(context);
        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.UbnNotInLog.AddOrUpdate(
            p => p.QsoNo,
                new UbnNotInLog { QsoNo = 2, LogId = 1 },
                new UbnNotInLog { QsoNo = 1, LogId = 2 },
                new UbnNotInLog { QsoNo = 1, LogId = 3 }
            );
        }
     }
}
