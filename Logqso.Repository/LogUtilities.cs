using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.Dto.LogControl;
using Logqso.mvc.Dto.LogData;

namespace Logqso.Repository
{
    public static class LogUtilities
    {
        public static bool LogGetFrequencyRange(ControlFiltersSettingsDto ControlFiltersSettingsDto, out decimal FreqLow, out decimal FreqHigh)
        {
            bool bHasRange = false;
            FreqLow = 0;
            FreqHigh = 0;
            if (ControlFiltersSettingsDto.FiltBand != "ALL")
            {
                bHasRange = true;
                CatBandEnum CatBandEnum;
                if (Enum.TryParse("_" + ControlFiltersSettingsDto.FiltBand, out CatBandEnum) == true)
                {
                    Enum.GetName(typeof(CatBandEnum), CatBandEnum);
                    switch (CatBandEnum)
                    {
                        case CatBandEnum._160M:
                            FreqLow=  1800.0m;
                            FreqHigh = 2000.0m;
                            break;
                        case CatBandEnum._80M:
                            FreqLow = 3500.0m;
                            FreqHigh = 4000.0m;
                           break;
                        case CatBandEnum._40M:
                            FreqLow = 7000.0m;
                            FreqHigh = 7300.0m;
                            break;
                        case CatBandEnum._20M:
                            FreqLow = 14000.0m;
                            FreqHigh = 14350.0m;
                            break;
                        case CatBandEnum._15M:
                            FreqLow = 21000.0m;
                            FreqHigh = 21450.0m;
                            break;
                        case CatBandEnum._10M:
                            FreqLow = 28000.0m;
                            FreqHigh = 28700.0m;
                            break;
                        default:
                            break;
                    }
                }
            }
            return bHasRange;
        }


        public static bool LogGetContinent(ControlFiltersSettingsDto ControlFiltersSettingsDto, out ContinentEnum ContinentEnum)
        {
            bool bHasRange = false;
            ContinentEnum = mvc.common.Enum.ContinentEnum.ALL;

            if (ControlFiltersSettingsDto.FiltContinent != "ALL")
            {
                if (Enum.TryParse(ControlFiltersSettingsDto.FiltContinent, out ContinentEnum) == true)
                {
                    bHasRange = true;
                }
            }
            return bHasRange;
        }

        public static bool LogGetCountry(ControlFiltersSettingsDto ControlFiltersSettingsDto, out string prefix)
        {
            bool bHasRange = false;
            prefix = string.Empty;
            if (!ControlFiltersSettingsDto.FiltCountryInnerHTML.value.Contains("ALL&")) //ALL check
            {
                string Search = "&nbsp;&nbsp;&nbsp;&nbsp;";
                int pos = ControlFiltersSettingsDto.FiltCountryInnerHTML.value.IndexOf(Search);
                prefix = ControlFiltersSettingsDto.FiltCountryInnerHTML.value.Substring(pos + Search.Length);
                bHasRange = true;
            }
            return bHasRange;
        }

        public static bool LogGetZone(ControlFiltersSettingsDto ControlFiltersSettingsDto, out short QsoExchangeNumber)
        {
            bool bHasRange = false;
            QsoExchangeNumber = 0; 
            if (short.TryParse(ControlFiltersSettingsDto.FiltCQZone, out QsoExchangeNumber) == true)
            {
                bHasRange = true;
            }
            return bHasRange;
        }

        public static bool LogGetRadio(DataCallInfoDto DataCallInfoDto, out QsoRadioTypeEnum QsoRadioTypeEnum)
        {
            bool bHasRange = false;
            QsoRadioTypeEnum = mvc.common.Enum.QsoRadioTypeEnum.ALL;
            if (DataCallInfoDto.QsoRadioType != QsoRadioTypeEnum.ALL)
            {
                QsoRadioTypeEnum = DataCallInfoDto.QsoRadioType;
                bHasRange = true;
            }

            return bHasRange;
        }

        public static bool LogGetStation(DataCallInfoDto DataCallInfoDto, out string Station)
        {
            bool bHasRange = false;
            Station = string.Empty;
            if (DataCallInfoDto.SelectedStationName != "ALL")
            {
                Station = DataCallInfoDto.SelectedStationName;
                bHasRange = true;
            }

            return bHasRange;
        }

    }
}
