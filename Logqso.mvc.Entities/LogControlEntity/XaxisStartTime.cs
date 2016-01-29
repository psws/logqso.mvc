using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisStartTime : Entity
    {
        public XaxisStartTime()
        {
            this.XaxisDefaults = new List<XaxisDefault>();
        }

        public string XaxisStrtTime { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<XaxisDefault> XaxisDefaults { get; set; }
    }
}
