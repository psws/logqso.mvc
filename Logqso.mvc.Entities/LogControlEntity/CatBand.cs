using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatBand : Entity
    {
        public CatBand()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatBnd { get; set; }
        public string CatBandName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
