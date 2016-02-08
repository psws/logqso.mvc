using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Station : Entity
    {
        public Station()
        {
            this.CallInfoes = new List<CallInfo>();
            this.Qsoes = new List<Qso>();
        }

        public int LogId { get; set; }
        public string StationName { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual Log Log { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
