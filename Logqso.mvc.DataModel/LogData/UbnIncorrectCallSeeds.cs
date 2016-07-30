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
    public class UbnIncorrectCallSeeds
    {
        //  add to configuration.cs           UbnIncorrectCallSeeds.SeedContest(context);
        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.UbnIncorrectCall.AddOrUpdate(
            p => p.QsoNo,
                new UbnIncorrectCall { QsoNo = 1, LogId = 2, CorrectCall = "CN4P" }
            );
        }
     }
}
