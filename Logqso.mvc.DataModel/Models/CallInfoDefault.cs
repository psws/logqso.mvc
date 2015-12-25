using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class CallInfoDefault
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
