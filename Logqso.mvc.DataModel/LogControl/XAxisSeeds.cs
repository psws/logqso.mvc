using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.XaxisModels;

namespace Logqso.mvc.DataModel.LogControl
{
    class XAxisSeeds
    {
        public static void SeedXaxis(Logqso.mvc.DataModel.LogControl.LogControlDB context)
        {
            //called by
            // XAxisSeeds.SeedXaxis( context) in LoalControlDB.cs


            context.XaxisStartTime.AddOrUpdate(
            p => p.XaxisStrtTime,
                new XaxisStartTime { XaxisStrtTime = "00:00z  Day1", Index = 1 },
                new XaxisStartTime { XaxisStrtTime = "02:00z  Day1", Index = 2 },
                new XaxisStartTime { XaxisStrtTime = "04:00z  Day1", Index = 3 },
                new XaxisStartTime { XaxisStrtTime = "06:00z  Day1", Index = 4 },
                new XaxisStartTime { XaxisStrtTime = "08:00z  Day1", Index = 5 },
                new XaxisStartTime { XaxisStrtTime = "10:00z  Day1", Index = 6 },
                new XaxisStartTime { XaxisStrtTime = "12:00z  Day1", Index = 7 },
                new XaxisStartTime { XaxisStrtTime = "14:00z  Day1", Index = 8 },
                new XaxisStartTime { XaxisStrtTime = "16:00z  Day1", Index = 9 },
                new XaxisStartTime { XaxisStrtTime = "18:00z  Day1", Index = 10 },
                new XaxisStartTime { XaxisStrtTime = "20:00z  Day1", Index = 11 },
                new XaxisStartTime { XaxisStrtTime = "22:00z  Day1", Index = 12 },
                new XaxisStartTime { XaxisStrtTime = "00:00z  Day2", Index = 13 },
                new XaxisStartTime { XaxisStrtTime = "02:00z  Day2", Index = 14 },
                new XaxisStartTime { XaxisStrtTime = "04:00z  Day2", Index = 15 },
                new XaxisStartTime { XaxisStrtTime = "06:00z  Day2", Index = 16 },
                new XaxisStartTime { XaxisStrtTime = "08:00z  Day2", Index = 17 },
                new XaxisStartTime { XaxisStrtTime = "10:00z  Day2", Index = 18 },
                new XaxisStartTime { XaxisStrtTime = "12:00z  Day2", Index = 19 },
                new XaxisStartTime { XaxisStrtTime = "14:00z  Day2", Index = 20 },
                new XaxisStartTime { XaxisStrtTime = "16:00z  Day2", Index = 21 },
                new XaxisStartTime { XaxisStrtTime = "18:00z  Day2", Index = 22 },
                new XaxisStartTime { XaxisStrtTime = "20:00z  Day2", Index = 23 },
                new XaxisStartTime { XaxisStrtTime = "22:00z  Day2", Index = 24 }
          );

            context.XaxisDuration.AddOrUpdate(
            p => p.XaxisDurationTime,
                new XaxisDuration { XaxisDurationTime = "48", Index = 1 },
                new XaxisDuration { XaxisDurationTime = "1", Index = 2 },
                new XaxisDuration { XaxisDurationTime = "2", Index = 3 },
                new XaxisDuration { XaxisDurationTime = "4", Index = 4 },
                new XaxisDuration { XaxisDurationTime = "8", Index = 5 },
                new XaxisDuration { XaxisDurationTime = "12", Index = 6 },
                new XaxisDuration { XaxisDurationTime = "16", Index = 7 },
                new XaxisDuration { XaxisDurationTime = "20", Index = 8 },
                new XaxisDuration { XaxisDurationTime = "24", Index = 9 }
            );

        }
    }
}
