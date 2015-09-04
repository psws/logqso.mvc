using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisDefault : Entity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string XaxisDurationTime { get; set; }
        public string XaxisStrtTime { get; set; }
        public virtual XaxisDuration XaxisDuration { get; set; }
        public virtual XaxisStartTime XaxisStartTime { get; set; }
    }
}
