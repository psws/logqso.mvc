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
    public class ContestTypeSeeds
    {
        //  add to configuration.cs           ContestTypeSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.ContestType.AddOrUpdate(
            p => p.ContestTypeEnumName,
                new ContestType { ContestTypeEnum  = ContestTypeEnum.CQWW  , ContestTypeEnumName = Enum.GetName(typeof(ContestTypeEnum), ContestTypeEnum.CQWW),
                    QsoExchangeName = "Zone", QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeNumber, QsoMultName = "ZnMlt", QsoMult2Name = "CtyMlt"},
                new ContestType { ContestTypeEnum  = ContestTypeEnum.CQWPX  , ContestTypeEnumName = Enum.GetName(typeof(ContestTypeEnum), ContestTypeEnum.CQWPX),
                    QsoExchangeName = "Rx#", QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeNumber, QsoMultName = "PfxMlt", QsoMult2Name = "", ExtraDataName = "Prefix"},
                new ContestType { ContestTypeEnum  = ContestTypeEnum.CQ160  , ContestTypeEnumName = Enum.GetName(typeof(ContestTypeEnum), ContestTypeEnum.CQ160),
                    QsoExchangeName = "Cty/St/Pv", QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeAlpha, QsoMultName = "Cty/St/Pv-Mlt", QsoMult2Name = ""},
                new ContestType { ContestTypeEnum  = ContestTypeEnum.RUSDXC  , ContestTypeEnumName = Enum.GetName(typeof(ContestTypeEnum), ContestTypeEnum.RUSDXC),
                    QsoExchangeName = "Obl/#", QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeMixed, QsoMultName = "OblMlt", QsoMult2Name = "CtyMlt"}

              );


        }

    }
}
