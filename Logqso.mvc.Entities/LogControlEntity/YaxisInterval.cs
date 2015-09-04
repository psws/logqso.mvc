using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class YaxisInterval : Entity
    {
        public YaxisInterval()
        {
            this.YaxisDefaults = new List<YaxisDefault>();
        }

        public string YaxisIntvVal { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<YaxisDefault> YaxisDefaults { get; set; }
    }
}
