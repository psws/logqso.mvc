using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.DataModels;
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
                new CallInfo {  CallGroup = CallGroupEnum.CALL1, CallsignId = 1, SelectedCall = "CN2R",
                                ContestId = "CQWWSSB2014", LogId = 1, SessionName = "Default_cn2r_cn3a_cn2aa",
                                StationId = 3,UserName = "default"},
                 new CallInfo {  CallGroup = CallGroupEnum.CALL1, CallsignId = 2, SelectedCall = "CN3A",
                                ContestId = "CQWWSSB2014", LogId = 2, SessionName = "Default_cn2r_cn3a_cn2aa",
                                StationId = 1,UserName = "default"},
                  new CallInfo {  CallGroup = CallGroupEnum.CALL1, CallsignId = 3, SelectedCall = "CN2AA",
                                ContestId = "CQWWSSB2014", LogId = 3, SessionName = "Default_cn2r_cn3a_cn2aa",
                                UserName = "default"}
              );
           }


    }
}
