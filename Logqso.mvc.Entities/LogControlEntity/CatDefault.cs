using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatDefault : Entity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public int CatOperatorEnum { get; set; }
        public int CatAssistedEnum { get; set; }
        public int CatBandEnum { get; set; }
        public int CatNoOfTxEnum { get; set; }
        public int CatPowerEnum { get; set; }
        public virtual CatAssisted CatAssisted { get; set; }
        public virtual CatBand CatBand { get; set; }
        public virtual CatNoOfTx CatNoOfTx { get; set; }
        public virtual CatOperator CatOperator { get; set; }
        public virtual CatPower CatPower { get; set; }
    }
}
