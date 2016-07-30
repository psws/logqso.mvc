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
    public class UbnUniqueSeeds
    {
        //  add to configuration.cs           UbnUniqueSeeds.SeedContest(context);
        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.UbnUniques.AddOrUpdate(
            p => p.QsoNo,
                new UbnUniques { QsoNo = 1, LogId = 1 },
                new UbnUniques { QsoNo = 2, LogId = 2 },
                new UbnUniques { QsoNo = 3, LogId = 2 }
            );
        }
     }
}
