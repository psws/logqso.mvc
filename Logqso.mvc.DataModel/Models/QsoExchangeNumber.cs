using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class QsoExchangeNumber
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public short QsoExhangeNumberValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
