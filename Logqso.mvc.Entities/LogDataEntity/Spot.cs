using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Spot : Entity
    {
        public int SpotId { get; set; }
        public string ContestId { get; set; }
        public int CallSignId { get; set; }
        public int SpoterCallSignId { get; set; }
        public System.DateTime SpotDateTime { get; set; }
        public decimal Frequency { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual CallSign CallSign1 { get; set; }
        public virtual Contest Contest { get; set; }
    }
}
