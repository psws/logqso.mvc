using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.common.Enum
{
    public enum CatOperatorEnum
    {
        ALL = 1,
        SINGLE_OP,
        MULTI_OP,
        //SINGLE_OP_CLASSIC,
        //SINGLE_OP_ROOKIE,
        CHECKLOG,
    }

    public enum CatOperatorOverlayEnum
    {
        NONE = 0,
        SINGLE_OP_CLASSIC,
        SINGLE_OP_ROOKIE,
    }

    public enum CatBandEnum
    {
        ALL = 1,
        _160M,
        _80M,
        _40M,
        _20M,
        _15M,
        _10M,
    }

    public enum CatPowerrEnum
    {
        ALL = 1,
        HIGH,
        LOW,
        QRP,
    }

    public enum CatAssistedEnum
    {
        ALL = 1,
        ASSISTED,
        NON_ASSISTED,
    }

    public enum CatNoOfIxEnum
    {
        ALL = 1,
        ONE,
        TWO,
        UNLIMITED,
    }
}
