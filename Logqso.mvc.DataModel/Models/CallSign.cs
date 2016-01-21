using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class CallSign
    {
        public CallSign()
        {
            this.CallInfoes = new List<CallInfo>();
            this.Logs = new List<Log>();
            this.Qsoes = new List<Qso>();
        }

        public int CallSignId { get; set; }
        public string Call { get; set; }
        public int Continent { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
