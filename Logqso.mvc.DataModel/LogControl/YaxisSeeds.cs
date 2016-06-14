using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.YaxisModels;

namespace Logqso.mvc.DataModel.LogControl
{
    class YaxisSeeds
    {
        public static void SeedYaxis(Logqso.mvc.DataModel.LogControl.LogControlDB context)
        {
            //called by
            // YaxisSeeds.SeedYaxis( context) in LoalControlDB.cs


            context.YaxisFunction.AddOrUpdate(
            p => p.YaxisFuncName,
                new YaxisFunction { YaxisFuncName = "QSO  Rate",  Index = 1 },
                new YaxisFunction { YaxisFuncName = "QSO  Sum", Index = 2 },
                new YaxisFunction { YaxisFuncName = "Score  Rate",  Index = 3 },
                new YaxisFunction { YaxisFuncName = "Score  Sum",  Index = 4 },
                new YaxisFunction { YaxisFuncName = "Zone  Rate",  Index = 5 },
                new YaxisFunction { YaxisFuncName = "Zone  Sum",  Index = 6 },
                new YaxisFunction { YaxisFuncName = "Country  Rate",  Index = 7 },
                 new YaxisFunction { YaxisFuncName = "Country  Sum",  Index = 8 },
                new YaxisFunction { YaxisFuncName = "Point  Rate",  Index = 9 },
                new YaxisFunction { YaxisFuncName = "Point  Sum",  Index = 10 },
                 new YaxisFunction { YaxisFuncName = "Mult  Rate",  Index = 11 },
                new YaxisFunction { YaxisFuncName = "Mult  Sum",  Index = 12 },
                new YaxisFunction { YaxisFuncName = "Prefix  Rate", Index = 13 },
                new YaxisFunction { YaxisFuncName = "Prefix  Sum",  Index = 14 }
          );

            context.YaxisInterval.AddOrUpdate(
            p => p.YaxisIntvVal,
                new YaxisInterval { YaxisIntvVal = "60", Index = 1 },
                new YaxisInterval { YaxisIntvVal = "30", Index = 2 },
                new YaxisInterval { YaxisIntvVal = "15", Index = 3 },
                new YaxisInterval { YaxisIntvVal = "10", Index = 4 },
                new YaxisInterval { YaxisIntvVal = "5", Index = 5 },
                new YaxisInterval { YaxisIntvVal = "1", Index = 6 }
            );                                     



            context.YaxisViewType.AddOrUpdate(
            p => p.YaxisViewTypeName,
                new YaxisViewType { YaxisViewTypeName = "Column", Index = 1 },
                new YaxisViewType { YaxisViewTypeName = "Column 3D", Index = 2 },
                new YaxisViewType { YaxisViewTypeName = "Line", Index = 3 },
                new YaxisViewType { YaxisViewTypeName = "Spline", Index = 4 },
                new YaxisViewType { YaxisViewTypeName = "Area", Index = 5 },
                new YaxisViewType { YaxisViewTypeName = "Area 3D", Index = 6 },
                new YaxisViewType { YaxisViewTypeName = "Point", Index = 7 },
                new YaxisViewType { YaxisViewTypeName = "StackedColumn", Index = 8 }
           );

        }
    }
}
