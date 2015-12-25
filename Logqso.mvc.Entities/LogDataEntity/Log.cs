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
            this.Stations = new List<Station>();
        }

        public int LogId { get; set; }
        public System.DateTime ContestYear { get; set; }
        public int CallsignId { get; set; }
        public string ContestId { get; set; }
        public int LogCategoryId { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual LogCategory LogCategory { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
        public virtual ICollection<Station> Stations { get; set; }
    }
}
