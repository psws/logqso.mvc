using System;
using System.Collections.Generic;
using Infrastructure;


namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallInfo : Entity
    {
        public CallInfo()
        {
            this.Sessions = new List<Session>();
            this.Sessions1 = new List<Session>();
            this.Sessions2 = new List<Session>();
        }

        public int CallInfoId { get; set; }
        public int CallGroup { get; set; }
        public string ContestId { get; set; }
        public string SelectedCall { get; set; }
        public int CallsignId { get; set; }
        public string UserName { get; set; }
        public string SessionName { get; set; }
        public int LogId { get; set; }
        public Nullable<int> StationId { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual Log Log { get; set; }
        public virtual ICollection<Session> Sessions { get; set; }
        public virtual ICollection<Session> Sessions1 { get; set; }
        public virtual ICollection<Session> Sessions2 { get; set; }
    }
}
