using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class ContestEntity : Entity
    {
        public ContestEntity()
        {
            this.Logs = new List<LogEntity>();
        }

        public int ContestId { get; set; }
        public string ContestName { get; set; }
        public virtual ICollection<LogEntity> Logs { get; set; }
    }
}
