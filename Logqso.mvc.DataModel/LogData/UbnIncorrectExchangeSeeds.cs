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
    public class UbnIncorrectExchangeSeeds
    {
        //  add to configuration.cs           UbnIncorrectExchangeSeeds.SeedContest(context);
        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.UbnIncorrectExchange.AddOrUpdate(
            p => p.QsoNo,
                new UbnIncorrectExchange { QsoNo = 1, LogId = 3, CorrectExchange= "33" }
            );
        }
     }
}