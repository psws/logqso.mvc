using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisDuration : Entity
    {
        public XaxisDuration()
        {
            this.XaxisDefaults = new List<XaxisDefault>();
        }

        public string XaxisDurationTime { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<XaxisDefault> XaxisDefaults { get; set; }
    }
}
