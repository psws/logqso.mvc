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
    public class UbnDupeSeeds
    {
        //  add to configuration.cs           UbnDupeSeeds.SeedContest(context);
        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.UbnDupes.AddOrUpdate(
            p => p.QsoNo,
                new UbnDupes { QsoNo = 2, LogId = 2 }
            );
        }
     }
}
