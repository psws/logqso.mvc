using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltCQZone : Entity
    {
        public FiltCQZone()
        {
            this.FiltDefaullts = new List<FiltDefault>();
        }

        public string FiltCQZoneVal { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<FiltDefault> FiltDefaullts { get; set; }
    }
}
