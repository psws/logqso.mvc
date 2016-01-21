using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class ContestType
    {
        public ContestType()
        {
            this.Contests = new List<Contest>();
        }

        public int ContestTypeEnum { get; set; }
        public string ContestTypeEnumName { get; set; }
        public int QsoExchangeTypeEnum { get; set; }
        public string QsoExchangeName { get; set; }
        public string QsoMultName { get; set; }
        public string QsoMult2Name { get; set; }
        public string ExtraDataName { get; set; }
        public virtual ICollection<Contest> Contests { get; set; }
        public virtual QsoExchangeType QsoExchangeType { get; set; }
    }
}
