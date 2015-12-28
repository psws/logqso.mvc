using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.common.Enum
{

    public enum ContestTypeEnum
    {
        CQWW = 1,
        CQWPX,
        CQ160,
        RUSDXC,

    }

    public enum QsoModeTypeEnum
    {
        SSB = 1,
        CW,
        MIXED,
        RTTY,
    }

    public enum QsoExchangeTypeEnum
    {
        QsoExchangeNumber = 1,
        QsoExchangeAlpha,
        QsoExchangeMixed,
    }
}
