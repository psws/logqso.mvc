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
    public class StationSeeds
    {
        //  add to configuration.cs           StationSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.Station.AddOrUpdate(
            p => p.StationName,
                new Station {  LogId = 1,  StationName = "STN1" },
                new Station {  LogId = 1,  StationName = "STN2" },
                new Station {  LogId = 1,  StationName = "STN3" },
                new Station {  LogId = 1,  StationName = "STN4" },
                new Station {  LogId = 2,  StationName = "STN1" },
                new Station {  LogId = 2,  StationName = "STN2" },
                //WPX
                new Station { LogId = 5, StationName = "STN1" },
                new Station { LogId = 5, StationName = "STN2" },
                new Station { LogId = 5, StationName = "STN3" },
                new Station { LogId = 5, StationName = "STN4" },
                new Station { LogId = 6, StationName = "STN1" },
                new Station { LogId = 6, StationName = "STN2" }

                                    
            );


        }

    }
}
