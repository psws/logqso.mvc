using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Qso : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public decimal Frequency { get; set; }
        public int CallsignId { get; set; }
        public System.DateTime QsoDateTime { get; set; }
        public short RxRst { get; set; }
        public short TxRst { get; set; }
        public Nullable<short> QsoExchangeNumber { get; set; }
        public int QsoModeTypeEnum { get; set; }
        public int QsoRadioTypeEnum { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Log Log { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }
        public virtual QsoRadioType QsoRadioType { get; set; }
        public virtual Station Station { get; set; }
        public virtual QsoExchangeAlpha QsoExchangeAlpha { get; set; }
        public virtual QsoExtraData QsoExtraData { get; set; }
    }
}
