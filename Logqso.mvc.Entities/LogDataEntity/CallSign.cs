using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallSign : Entity
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
