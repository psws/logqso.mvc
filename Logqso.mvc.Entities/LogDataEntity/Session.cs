using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Session : Entity
    {
        public Session()
        {
            this.CallInfoes = new List<CallInfo>();
        }

        public string SessionName { get; set; }
        public string UserName { get; set; }
        public System.DateTime SessionDateTime { get; set; }
        public string CategorySettings { get; set; }
        public string FiltersSettings { get; set; }
        public string XaxisSettings { get; set; }
        public string YaxisSettings { get; set; }
        public Nullable<decimal> Subscription { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
    }
}
