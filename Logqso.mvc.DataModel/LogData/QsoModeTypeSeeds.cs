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
    public class QsoModeTypeSeeds
    {
        //  add to configuration.cs           QsoModeTypeSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.QsoModeType.AddOrUpdate(
            p => p.QsoModeTypeEnum,
                new QsoModeType { QsoModeTypeEnum = QsoModeTypeEnum.SSB, QsoModeEnumName = Enum.GetName(typeof(QsoModeTypeEnum), QsoModeTypeEnum.SSB) },
                 new QsoModeType { QsoModeTypeEnum = QsoModeTypeEnum.CW, QsoModeEnumName = Enum.GetName(typeof(QsoModeTypeEnum), QsoModeTypeEnum.CW) },
                 new QsoModeType { QsoModeTypeEnum = QsoModeTypeEnum.MIXED, QsoModeEnumName = Enum.GetName(typeof(QsoModeTypeEnum), QsoModeTypeEnum.MIXED) },
                  new QsoModeType { QsoModeTypeEnum = QsoModeTypeEnum.RTTY, QsoModeEnumName = Enum.GetName(typeof(QsoModeTypeEnum), QsoModeTypeEnum.RTTY) }

              );


        }

    }
}
