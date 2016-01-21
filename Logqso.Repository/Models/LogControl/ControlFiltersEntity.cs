using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.Repository.Models.LogControl
{
    public class ControlFiltersEntity
    {
        public List<string> FiltBand { get; set; }
        public List<string> FiltContinent { get; set; }
        public List<string> FiltCountryInnerHTML { get; set; }
        public List<string> FiltCQZone { get; set; }
    }
}
