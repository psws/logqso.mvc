﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
//using Logqso.mvc.DataModel.LogData.DataModels;
using Logqso.mvc.DataModel.LogData.CallInfoModels;

namespace Logqso.mvc.DataModel.LogData
{
    class CallInfoSeeds
    {
        //  add to configuration.cs          CallInfoSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
             
            context.CallInfo.AddOrUpdate(
            p => p.CallInfoId,
                new CallInfo { CallInfoId = 0, CallGroup = CallGroupEnum.CALL1, CallsignId = 1,
                                ContestId = "CQWWSSB2002", LogId = 1, SessionName = "default_cn2r_cn3a_cn2aa",
                                QsoRadioTypeEnum= common.Enum.QsoRadioTypeEnum.R1, StationName = "STN1",UserName = "default", Disabled = false},
                 new CallInfo { CallInfoId = 0,  CallGroup = CallGroupEnum.CALL2, CallsignId = 2, 
                                ContestId = "CQWWSSB2002", LogId = 2, SessionName = "default_cn2r_cn3a_cn2aa",
                                QsoRadioTypeEnum= common.Enum.QsoRadioTypeEnum.R2,StationName = "STN2",UserName = "default", Disabled = false},
                  new CallInfo { CallInfoId = 0,  CallGroup = CallGroupEnum.CALL3, CallsignId = 3, 
                                ContestId = "CQWWSSB2002", LogId = 3, SessionName = "default_cn2r_cn3a_cn2aa",
                                QsoRadioTypeEnum= common.Enum.QsoRadioTypeEnum.Run,UserName = "default", Disabled = false}
              );
           }


    }
}
