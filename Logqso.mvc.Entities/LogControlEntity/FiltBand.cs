using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltBand : Entity
    {
        public FiltBand()
        {
            this.FiltDefaullts = new List<FiltDefaullt>();
        }

        public int FiltBnd { get; set; }
        public string FiltBandName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<FiltDefaullt> FiltDefaullts { get; set; }
    }
}
