using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatNoOfTx : Entity
    {
        public CatNoOfTx()
        {
            this.CatDefaults = new List<CatDefault>();
        }

        public int CatTx { get; set; }
        public string CatNoOfTxName { get; set; }
        public byte Index { get; set; }
        public virtual ICollection<CatDefault> CatDefaults { get; set; }
    }
}
