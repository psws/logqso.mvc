using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Contest : Entity
    {
        public Contest()
        {
            this.CallInfoes = new List<CallInfo>();
            this.Logs = new List<Log>();
        }

        public string ContestId { get; set; }
        public string ContestName { get; set; }
        public int ContestGroup { get; set; }
        public int ContestType { get; set; }
        public System.DateTime StartDateTime { get; set; }
        public System.DateTime EndDateTime { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
    }
}
