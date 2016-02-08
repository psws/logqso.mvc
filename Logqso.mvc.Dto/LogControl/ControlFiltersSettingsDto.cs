using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.Dto.LogControl
{
    public class ControlFiltersSettingsDto
    {
        public string FiltBand { get; set; }
        public string FiltContinent { get; set; }
        public string FiltCountryInnerHTML { get; set; }
        public string FiltCQZone { get; set; }
        public bool Disabled { get; set; }
    }
}
