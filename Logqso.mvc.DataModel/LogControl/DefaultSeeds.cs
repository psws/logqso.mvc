using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.CategoryModels;
using Logqso.mvc.DataModel.LogControl.FilterModels;
using Logqso.mvc.DataModel.LogControl.XaxisModels;
using Logqso.mvc.DataModel.LogControl.YaxisModels;

namespace Logqso.mvc.DataModel.LogControl
{
    class DefaultSeeds
    {
        public static void SeedDefault(Logqso.mvc.DataModel.LogControl.LogControlDB context)
        {
            //called by
            // CategorySeeds.SeedCategory( context) in LoalControlDB.cs

            context.CatDefault.AddOrUpdate(
                  p => p.CatOperator,
                  new CatDefault {
                      UserName = "default",
                      CatOperatorEnum = CatOperatorEnum.ALL,
                      CatAssistedEnum = CatAssistedEnum.ALL,
                      CatBandEnum = CatBandEnum.ALL,
                      CatNoOfTxEnum = CatNoOfTxEnum.ALL,
                      CatPowerEnum = CatPowerEnum.ALL
                  } 
             );

            context.FiltDefaullt.AddOrUpdate(
              p => p.FiltBnd,
              new FiltDefaullt
              {
                  UserName = "default",
                  FiltBnd = CatBandEnum.ALL,
                  FiltCont = ContinentEnum.ALL,
                  FiltPref = "-",
                  
                  FiltCQZoneVal = "ALL"
              }
            );

            context.XaxisDefault.AddOrUpdate(
              p => p.XaxisDuration,
              new XaxisDefault
              {
                  UserName = "default",
                  XaxisDurationTime = "48",
                  XaxisStrtTime = "00:00z  Day1",
              }
            );

            context.YaxisDefault.AddOrUpdate(
             p => p.YaxisFuncName,
             new YaxisDefault
             {
                 UserName = "default",
                 YaxisFuncName = "QSO  Rate",
                 YaxisIntvVal = "60",
                 YaxisViewTypeName = "Column",
             }
           );
        }

    }
}
