using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;

namespace Logqso.mvc.common
{
    public static class EnumUtils
    {

        public static  CatBandEnum GetBandEnum(decimal Frequency)
        {
            CatBandEnum CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum.ALL;
            if (Frequency >= 1800.0m && Frequency <= 2000.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._160M;
            }
            else if (Frequency >= 3500.0m && Frequency <= 4000.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._80M;
            }
            else if (Frequency >= 7000.0m && Frequency <= 7300.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._40M;
            }
            else if (Frequency >= 14000.0m && Frequency <= 14350.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._20M;
            }
            else if (Frequency >= 21000.0m && Frequency <= 21450.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._15M;
            }
            else if (Frequency >= 28000.0m && Frequency <= 29700.0m)
            {
                CatBandEnum = Logqso.mvc.common.Enum.CatBandEnum._10M;
            }

            return CatBandEnum;

        }

    }
}
