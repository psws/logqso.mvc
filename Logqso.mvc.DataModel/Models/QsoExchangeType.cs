using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class QsoExchangeType
    {
        public QsoExchangeType()
        {
            this.ContestTypes = new List<ContestType>();
        }

        public int QsoExchangeTypeEnum { get; set; }
        public string QsoExchangeTypeEnumName { get; set; }
        public virtual ICollection<ContestType> ContestTypes { get; set; }
    }
}
