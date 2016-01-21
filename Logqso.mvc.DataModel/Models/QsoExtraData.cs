using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class QsoExtraData
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string QsoExtraDataValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
