using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisDefault : Entity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string XaxisDurationTime { get; set; }
        public string XaxisStrtTime { get; set; }
        public int Xaxisday { get; set; }
        public virtual XaxisDuration XaxisDuration { get; set; }
        public virtual XaxisStartTime XaxisStartTime { get; set; }
        public virtual XaxisDay XaxisDay { get; set; }
    }
}
