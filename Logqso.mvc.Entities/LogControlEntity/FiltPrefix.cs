using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltPrefix : Entity
    {
        public FiltPrefix()
        {
            this.FiltDefaullts = new List<FiltDefault>();
        }

        public string FiltPref { get; set; }
        public string CountryName { get; set; }
        public virtual ICollection<FiltDefault> FiltDefaullts { get; set; }
    }
}
