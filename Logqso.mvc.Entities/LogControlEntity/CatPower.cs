using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatPower : Entity
    {
        public CatPower()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatPwr { get; set; }
        public string CatPowerName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
