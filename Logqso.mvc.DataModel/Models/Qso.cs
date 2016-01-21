using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class Qso
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public int CallsignId { get; set; }
        public System.DateTime QsoDateTime { get; set; }
        public byte RxRst { get; set; }
        public byte TxRst { get; set; }
        public int QsoModeTypeEnum { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Log Log { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }
        public virtual QsoExchangeAlpha QsoExchangeAlpha { get; set; }
        public virtual QsoExchangeNumber QsoExchangeNumber { get; set; }
        public virtual QsoExtraData QsoExtraData { get; set; }
    }
}
