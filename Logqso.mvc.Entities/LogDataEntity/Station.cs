using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Station : Entity
    {
        public Station()
        {
            this.CallInfoes = new List<CallInfo>();
        }

        public int StationId { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual Log Log { get; set; }
    }
}
