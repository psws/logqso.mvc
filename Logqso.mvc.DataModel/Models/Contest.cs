using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class Contest
    {
        public Contest()
        {
            this.CallInfoes = new List<CallInfo>();
            this.Logs = new List<Log>();
        }

        public string ContestId { get; set; }
        public string ContestName { get; set; }
        public int ContestTypeEnum { get; set; }
        public int QsoModeTypeEnum { get; set; }
        public System.DateTime StartDateTime { get; set; }
        public System.DateTime EndDateTime { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual ContestType ContestType { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
    }
}
