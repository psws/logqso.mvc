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
    public class CallSignSeeds
    {
        //  add to configuration.cs          CallSignSeeds.SeedContest(context);

        /*
             QsoModeTypeSeeds.SeedContest(context);
            QsoExchangeTypeSeeds.SeedContest(context);
             QsoRadioTypeSeeds.SeedContest(context);
           ContestTypeSeeds.SeedContest(context);
           CallSignSeeds.SeedContest(context);
            ContestSeeds.SeedContest(context);
            LogCategorySeeds.SeedContest(context);
            LogSeeds.SeedContest(context);
            StationSeeds.SeedContest(context);
#if DEBUG
         QsoSeeds.SeedContest(context);
#endif
        
         */

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.CallSign.AddOrUpdate(
            p => p.Call,
                new CallSign { CallSignId = 1, Call = "CN2R", Prefix = "CN", ContinentEnum = ContinentEnum.AF },
                new CallSign { CallSignId = 2, Call = "CN3A", Prefix = "CN", ContinentEnum = ContinentEnum.AF },
                new CallSign { CallSignId = 3, Call = "CN2AA", Prefix = "CN", ContinentEnum = ContinentEnum.AF }

                                    
            );


        }

    }
}
