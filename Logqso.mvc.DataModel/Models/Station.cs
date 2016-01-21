using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class Station
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
