using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class CatDefault : Entity
    {
        public int Id { get; set; }
        public int CatOpr { get; set; }
        public int CatAssist { get; set; }
        public int CatBnd { get; set; }
        public int CatTx { get; set; }
        public int CatPwr { get; set; }
        public string UserName { get; set; }
        public virtual CatAssisted CatAssisted { get; set; }
        public virtual CatBand CatBand { get; set; }
        public virtual CatNoOfTx CatNoOfTx { get; set; }
        public virtual CatOperator CatOperator { get; set; }
        public virtual CatPower CatPower { get; set; }
    }
}
