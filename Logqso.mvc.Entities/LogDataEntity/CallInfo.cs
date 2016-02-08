using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity 
{
    public partial class CallInfo : Entity
    {
        public CallInfo()
        {
        }

        public int CallInfoId { get; set; }
        public int CallGroup { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public string ContestId { get; set; }
        public int CallsignId { get; set; }
        public string UserName { get; set; }
        public string SessionName { get; set; }
        public bool Disabled { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual Session Session { get; set; }
        public virtual Station Station { get; set; }
    }
}
