using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoExchangeAlpha : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string QsoExhangeAlphaValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
