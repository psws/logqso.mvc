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
    public class LogCategorySeeds
    {
        //  add to configuration.cs          LogCategorySeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.LogCategory.AddOrUpdate(
            p => p.LogCategoryId,
                new LogCategory {  LogCategoryId = 1, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.MULTI_OP,
                                    CatBand = CatBandEnum.ALL, CatPower = CatPowerrEnum.HIGH, CatNoOfIx = CatNoOfIxEnum.UNLIMITED, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                 new LogCategory {  LogCategoryId = 2, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.MULTI_OP,
                                    CatBand = CatBandEnum.ALL, CatPower = CatPowerrEnum.HIGH, CatNoOfIx = CatNoOfIxEnum.TWO, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
               new LogCategory {  LogCategoryId = 3, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.MULTI_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.HIGH, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                 new LogCategory {LogCategoryId = 4, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.MULTI_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.LOW, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 5, CatAssisted = CatAssistedEnum.NON_ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.HIGH, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 6, CatAssisted = CatAssistedEnum.NON_ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.LOW, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 7, CatAssisted = CatAssistedEnum.NON_ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.QRP, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 8, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.HIGH, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 9, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.LOW, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 10, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.QRP, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 11, CatAssisted = CatAssistedEnum.ASSISTED, CatOperator = CatOperatorEnum.SINGLE_OP,
                                    CatBand = CatBandEnum.ALL, CatPower= CatPowerrEnum.QRP, CatNoOfIx = CatNoOfIxEnum.ONE, 
                                     CatOperatorOverlay = CatOperatorOverlayEnum.NONE }


                                    
            );


        }

    }
}
