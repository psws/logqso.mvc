using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class Qso
    {
        public int QsoId { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public int CallsignId { get; set; }
        public System.DateTime QsoDateEime { get; set; }
        public byte RxRst { get; set; }
        public byte TxRst { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Log Log { get; set; }
    }
}
