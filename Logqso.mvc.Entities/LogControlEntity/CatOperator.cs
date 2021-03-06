using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatOperator : Entity
    {
        public CatOperator()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatOperatorEnum { get; set; }
        public string CatOprName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
