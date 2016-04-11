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

    public enum QsoRadioTypeEnum
    {
        NONE = 7,
        ALL = 1,
        R1 = 2,
        R2 = 3,
        Run,
        Mult,
        S_P
    }
}
