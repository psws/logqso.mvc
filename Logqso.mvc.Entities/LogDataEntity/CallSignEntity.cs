using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallSignEntity : Entity
    {
        public CallSignEntity()
        {
            this.Qsoes = new List<QsoEntity>();
        }

        public int CallSignId { get; set; }
        public string Call { get; set; }
        public int Continent { get; set; }
        public virtual ICollection<QsoEntity> Qsoes { get; set; }
    }
}
