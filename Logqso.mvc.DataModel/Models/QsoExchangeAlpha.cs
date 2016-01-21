using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class QsoExchangeAlpha
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string QsoExhangeAlphaValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
