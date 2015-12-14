using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoEntity : Entity
    {
        public int QsoId { get; set; }
        public int LogId { get; set; }
        public int CallsignId { get; set; }
        public System.DateTime QsoDateEime { get; set; }
        public byte RxRst { get; set; }
        public byte TxRst { get; set; }
        public virtual CallSignEntity CallSign { get; set; }
        public virtual LogEntity Log { get; set; }
    }
}
