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
                new LogCategory {  LogCategoryId = 1, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.MULTI_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum = CatPowerEnum.HIGH, CatNoOfTxEnum = CatNoOfTxEnum.UNLIMITED, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                 new LogCategory {  LogCategoryId = 2, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.MULTI_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum = CatPowerEnum.HIGH, CatNoOfTxEnum = CatNoOfTxEnum.TWO, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
               new LogCategory {  LogCategoryId = 3, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.MULTI_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.HIGH, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                 new LogCategory {LogCategoryId = 4, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.MULTI_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.LOW, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 5, CatAssistedEnum = CatAssistedEnum.NON_ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum = CatPowerEnum.HIGH, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 6, CatAssistedEnum = CatAssistedEnum.NON_ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.LOW, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 7, CatAssistedEnum = CatAssistedEnum.NON_ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.QRP, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 8, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.HIGH, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory { LogCategoryId = 9, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.LOW, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 10, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.QRP, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE },
                new LogCategory {  LogCategoryId = 11, CatAssistedEnum = CatAssistedEnum.ASSISTED, CatOperatorEnum = CatOperatorEnum.SINGLE_OP,
                                    CatBandEnum = CatBandEnum.ALL, CatPowerEnum= CatPowerEnum.QRP, CatNoOfTxEnum = CatNoOfTxEnum.ONE, 
                                     CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE }


                                    
            );


        }

    }
}
