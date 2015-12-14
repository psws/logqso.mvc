using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Contest : Entity
    {
        public Contest()
        {
            this.Logs = new List<Log>();
        }

        public int ContestId { get; set; }
        public string ContestName { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
    }
}
