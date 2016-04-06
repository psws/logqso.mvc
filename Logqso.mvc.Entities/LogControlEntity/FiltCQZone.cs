using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltCQZone : Entity
    {
        public FiltCQZone()
        {
            this.FiltDefaullts = new List<FiltDefaullt>();
        }

        public string FiltCQZoneVal { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<FiltDefaullt> FiltDefaullts { get; set; }
    }
}
