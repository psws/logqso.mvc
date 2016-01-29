using System;
using System.Collections.Generic;
using Infrastructure;



namespace  Logqso.mvc.Entities.LogDataEntity
{
    public partial class UbnDupe : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
    }
}
