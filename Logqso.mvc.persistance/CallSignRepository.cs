using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;

namespace Logqso.mvc.persistance
{
    class CallSignRepository
    {
        public CallSignDto GetCallSignID(string Call)
        {
           //TODO Stubbed out
            CallSignDto CallSignDto = new CallSignDto
            {
                Call = Call,
                CallSignID = 1,
            };
            return CallSignDto;
        }
    }
}
