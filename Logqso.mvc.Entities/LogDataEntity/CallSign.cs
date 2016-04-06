using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallSign : Entity
    {
        public CallSign()
        {
            this.CabrilloInfoes = new List<CabrilloInfo>();
            this.CallInfoes = new List<CallInfo>();
            this.Logs = new List<Log>();
            this.Qsoes = new List<Qso>();
            this.UbnSummaries = new List<UbnSummary>();
        }

        public int CallSignId { get; set; }
        public string Call { get; set; }
        public int Continent { get; set; }
        public int Accuracy { get; set; }
        public Nullable<double> Latitude { get; set; }
        public Nullable<double> Longitude { get; set; }
        public Nullable<bool> GeoCodeChk { get; set; }
        public virtual ICollection<CabrilloInfo> CabrilloInfoes { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
        public virtual ICollection<UbnSummary> UbnSummaries { get; set; }
    }
}
