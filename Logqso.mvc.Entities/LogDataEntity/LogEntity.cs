using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class LogEntity : Entity
    {
        public LogEntity()
        {
            this.Qsoes = new List<QsoEntity>();
        }

        public int LogId { get; set; }
        public System.DateTime ContestYear { get; set; }
        public int ContestId { get; set; }
        public virtual ContestEntity Contest { get; set; }
        public virtual ICollection<QsoEntity> Qsoes { get; set; }
    }
}
