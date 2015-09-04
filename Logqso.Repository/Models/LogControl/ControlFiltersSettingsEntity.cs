using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.Repository.Models.LogControl
{
    public class ControlFiltersSettingsEntity
    {
        public string FiltBand { get; set; }
        public string FiltContinent { get; set; }
        public string FiltCountry { get; set; }
        public int FiltCountryIndex { get; set; }
        public string FiltCQZone { get; set; }
        public bool Disabled { get; set; }
    }
}
