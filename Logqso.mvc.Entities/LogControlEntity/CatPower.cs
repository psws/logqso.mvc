using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatPower : Entity
    {
        public CatPower()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatPowerEnum { get; set; }
        public string CatPowerName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
