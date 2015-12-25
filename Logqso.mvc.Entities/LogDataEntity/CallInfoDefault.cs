using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallInfoDefault : Entity
    {
        public CallInfoDefault()
        {
            this.CallInfoes = new List<CallInfo>();
        }

        public int Id { get; set; }
        public string UserName { get; set; }
        public string SessionName { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
    }
}
