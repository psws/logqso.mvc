using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel;

namespace Logqso.mvc.persistance
{
    class CallSignRepository
    {
        public CallSign GetCallSignID(string Call)
        {
           //TODO Stubbed out
            CallSign CallSign = new CallSign
            {
                Call = Call,
                CallSignID = 1,
            };

            return CallSign;
        }
    }
}
