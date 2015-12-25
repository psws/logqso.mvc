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
    public class LogSeeds
    {
        //  add to configuration.cs          LogSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.Log.AddOrUpdate(
            p => p.LogId,
                new Log {  LogId = 1, CallsignId = 1,  ContestId = "CQWWSSB2015", ContestYear = DateTime.Parse("10/23/2015 00:00:00"),
                                    LogCategoryId = 2 },
                new Log {   LogId = 2, CallsignId = 2 , ContestId = "CQWWSSB2015", ContestYear = DateTime.Parse("10/23/2015 00:00:00"),
                                    LogCategoryId = 2 },
                new Log {   LogId = 3, CallsignId = 3,  ContestId = "CQWWSSB2015", ContestYear = DateTime.Parse("10/23/2015 00:00:00"),
                                    LogCategoryId = 1 }

                                    
            );


        }

    }
}
