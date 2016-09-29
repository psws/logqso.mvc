using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoExchangeNumber : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public short QsoExhangeNumberValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
