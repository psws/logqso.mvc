using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoExtraData : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string QsoExtraDataValue { get; set; }
        public virtual Qso Qso { get; set; }
    }
}
