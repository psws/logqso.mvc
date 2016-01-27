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
            p => p.CabrilloInfoId,
                new CabrilloInfo {  ClaimedScore= 15000060, Club= "EA Contest Clib",Operators= "EA9LZ, W7EJ, M0DRX" }, 
                new CabrilloInfo {  ClaimedScore= 10000060, Club= "EA Contest Clib",Operators= "EA9IE, W7Zr, OK1RI" }
                );
        }
    }
}
