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
    public class CabrilloInfoSeeds
    {
        //  add to configuration.cs          


        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.CabrilloInfo.AddOrUpdate(
            p => p.CallSignId,
                new CabrilloInfo {  CallSignId = 1, ContestId = "CQWWSSB2015", ClaimedScore= 15000060, Club= "EA Contest Clib", Operators= "EA9LZ, W7EJ, M0DRX" },
                new CabrilloInfo { CallSignId = 2, ContestId = "CQWWSSB2015", ClaimedScore = 10000060, Club = "ITALY Clib", Operators = "IK2QEI" },
                new CabrilloInfo {  CallSignId = 3, ContestId = "CQWWSSB2015", ClaimedScore= 10000060, Club= "MOSCOW Clib", Operators= "RL3FT" }
                );
        }
    }
}
