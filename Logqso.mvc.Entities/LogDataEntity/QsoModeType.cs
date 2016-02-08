using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoModeType : Entity
    {
        public QsoModeType()
        {
            this.Contests = new List<Contest>();
            this.Qsoes = new List<Qso>();
        }

        public int QsoModeTypeEnum { get; set; }
        public string QsoModeEnumName { get; set; }
        public virtual ICollection<Contest> Contests { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
