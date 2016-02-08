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
        public List<string> FiltCountryInnerHTML { get; set; }
        public List<string> FiltCQZone { get; set; }
    }
}
