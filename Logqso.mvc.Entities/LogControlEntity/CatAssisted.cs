using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatAssisted : Entity
    {
        public CatAssisted()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatAssistedEnum { get; set; }
        public string CatAssistedName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
