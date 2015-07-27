using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.CategoryModels;


namespace Logqso.mvc.DataModel.LogControl
{
    public class CategorySeeds
    {
        public static void SeedCatOperator(Logqso.mvc.DataModel.LogControl.LogControlDB context)
        {
            //called by
            // CategorySeeds.SeedCatOperator( context) in Configuration.cs
            
            context.CatOperator.AddOrUpdate(
                  p => p.CatOprName,
                  new CatOperator { CatOpr = CatOperatorEnum.ALL , CatOprName = Enum.GetName(typeof( CatOperatorEnum), CatOperatorEnum.ALL ) },
                   new CatOperator { CatOpr = CatOperatorEnum.SINGLE_OP , CatOprName = Enum.GetName(typeof( CatOperatorEnum), CatOperatorEnum.SINGLE_OP ).Replace('_', '-') },
                   new CatOperator { CatOpr = CatOperatorEnum.MULTI_OP , CatOprName = Enum.GetName(typeof( CatOperatorEnum), CatOperatorEnum.MULTI_OP).Replace('_', '-')  },
                  new CatOperator { CatOpr = CatOperatorEnum.CHECKLOG , CatOprName = Enum.GetName(typeof( CatOperatorEnum), CatOperatorEnum.CHECKLOG ) }
              );

            context.CatBand.AddOrUpdate(
                  p => p.CatBandName,
                  new CatBand{ CatBnd = CatBandEnum.ALL, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum.ALL) },
                   new CatBand { CatBnd = CatBandEnum._160M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._160M).Replace("_", "") },
                   new CatBand { CatBnd = CatBandEnum._80M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._80M).Replace("_", "") },
                  new CatBand { CatBnd = CatBandEnum._40M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._40M).Replace("_", "") },
                   new CatBand { CatBnd = CatBandEnum._20M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._20M).Replace("_", "") },
                  new CatBand { CatBnd = CatBandEnum._15M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._15M).Replace("_", "") },
                  new CatBand { CatBnd = CatBandEnum._10M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._10M).Replace("_", "") }
             );

            context.CatPower.AddOrUpdate(
              p => p.CatPowerName,
              new CatPower { CatPwr = CatPowerrEnum.ALL, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.ALL) },
               new CatPower { CatPwr = CatPowerrEnum.HIGH, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.HIGH) },
              new CatPower { CatPwr = CatPowerrEnum.LOW, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.LOW) },
              new CatPower { CatPwr = CatPowerrEnum.QRP, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.QRP) }
             );

            context.CatAssisted.AddOrUpdate(
              p => p.CatAssistedName,
              new CatAssisted { CatAssist = CatAssistedEnum.ALL, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ALL) },
              new CatAssisted { CatAssist = CatAssistedEnum.ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ASSISTED) },
              new CatAssisted { CatAssist = CatAssistedEnum.NON_ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.NON_ASSISTED).Replace('_', '-') }
             );

            context.CatNoOfTx.AddOrUpdate(
              p => p.CatNoOfTxName,
              new  CatNoOfTx { CatTx = CatNoOfIxEnum.ALL, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.ALL) },
               new CatNoOfTx { CatTx = CatNoOfIxEnum.ONE, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.ONE) },
              new CatNoOfTx { CatTx = CatNoOfIxEnum.TWO, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.TWO) },
              new CatNoOfTx { CatTx = CatNoOfIxEnum.UNLIMITED, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.UNLIMITED) }
            );

        }
    }
}
