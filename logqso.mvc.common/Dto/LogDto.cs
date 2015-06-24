using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.common.Dto
{
    public class LogDto
    {
        public Guid LogID { get; set; }
        public int? CallsignID { get; set; }
        public string Callsign { get; set; }
        public DateTime ContestYear { get; set; }
        public int ContestID { get; set; }
    }
}
