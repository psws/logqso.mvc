using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class YaxisFunction : Entity
    {
        public YaxisFunction()
        {
            this.YaxisDefaults = new List<YaxisDefault>();
        }

        public string YaxisFuncName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<YaxisDefault> YaxisDefaults { get; set; }
    }
}
