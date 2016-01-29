using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltContinent : Entity
    {
        public FiltContinent()
        {
            this.FiltDefaullts = new List<FiltDefault>();
        }

        public int FiltCont { get; set; }
        public string FiltContName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<FiltDefault> FiltDefaullts { get; set; }
    }
}
