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
    public class QsoExchangeTypeSeeds
    {
        //  add to configuration.cs           QsoExchangeTypeSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.QsoExchangeType.AddOrUpdate(
            p => p.QsoExchangeTypeEnum,
                new QsoExchangeType { QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeAlpha, QsoExchangeTypeEnumName = Enum.GetName(typeof(QsoExchangeTypeEnum), QsoExchangeTypeEnum.QsoExchangeAlpha) },
                new QsoExchangeType { QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeNumber, QsoExchangeTypeEnumName = Enum.GetName(typeof(QsoExchangeTypeEnum), QsoExchangeTypeEnum.QsoExchangeNumber) },
                new QsoExchangeType { QsoExchangeTypeEnum = QsoExchangeTypeEnum.QsoExchangeMixed, QsoExchangeTypeEnumName = Enum.GetName(typeof(QsoExchangeTypeEnum), QsoExchangeTypeEnum.QsoExchangeMixed) }

              );


        }

    }
}
