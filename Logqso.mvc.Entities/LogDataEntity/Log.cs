using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Log : Entity
    {
        public Log()
        {
            this.Qsoes = new List<Qso>();
        }

        public int LogId { get; set; }
        public System.DateTime ContestYear { get; set; }
        public int ContestId { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
