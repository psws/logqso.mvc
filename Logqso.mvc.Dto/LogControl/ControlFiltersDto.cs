using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.Dto.LogControl
{
    public class ControlFiltersDto
    {
        public List<string> FiltBand { get; set; }
        public List<string> FiltContinent { get; set; }
        public List<CountryPrefixtype> FiltCountryInnerHTML { get; set; }
        public List<string> FiltCQZone { get; set; }
    }
    public class CountryPrefixtype
    {
        public int key;
        public string value;
    };

}
