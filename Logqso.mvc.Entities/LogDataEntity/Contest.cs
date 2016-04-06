using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Contest : Entity
    {
        public Contest()
        {
            this.CabrilloInfoes = new List<CabrilloInfo>();
            this.CallInfoes = new List<CallInfo>();
            this.Logs = new List<Log>();
            this.UbnSummaries = new List<UbnSummary>();
        }

        public string ContestId { get; set; }
        public string ContestName { get; set; }
        public int ContestTypeEnum { get; set; }
        public int QsoModeTypeEnum { get; set; }
        public System.DateTime StartDateTime { get; set; }
        public System.DateTime EndDateTime { get; set; }
        public bool Active { get; set; }
        public virtual ICollection<CabrilloInfo> CabrilloInfoes { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual ContestType ContestType { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
        public virtual ICollection<UbnSummary> UbnSummaries { get; set; }
    }
}
