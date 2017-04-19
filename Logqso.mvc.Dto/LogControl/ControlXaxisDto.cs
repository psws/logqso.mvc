using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.Dto.LogControl
{
    public class ControlXaxisDto
    {
        public List<string> XaxisDuration { get; set; }
        public List<string> XaxisStarttime { get; set; }
        public List<int> XaxisDay { get; set; }
    }
}
