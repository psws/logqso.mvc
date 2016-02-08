using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoExchangeType : Entity
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
