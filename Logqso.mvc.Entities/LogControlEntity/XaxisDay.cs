using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisDay : Entity
    {
        public XaxisDay()
        {
            this.XaxisDefaults = new List<XaxisDefault>();
        }

        public int Xaxisday { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<XaxisDefault> XaxisDefaults { get; set; }
    }
}

