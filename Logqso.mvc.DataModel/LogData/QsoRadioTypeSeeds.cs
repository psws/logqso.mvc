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
    class QsoRadioTypeSeeds
    {
        //  add to configuration.cs           QsoRadioTypeSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.QsoRadioType.AddOrUpdate(
            p => p.QsoRadioTypeEnum,
                new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.ALL, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.ALL) },
                new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.R1, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.R1) },
                 new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.R2, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.R2) },
                 new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.Run, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.Run) },
                  new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.Mult, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.Mult) },
                new QsoRadioType { QsoRadioTypeEnum = QsoRadioTypeEnum.S_P, QsoRadioTypeName = Enum.GetName(typeof(QsoRadioTypeEnum), QsoRadioTypeEnum.S_P) } 

              );


        }
    }
}
