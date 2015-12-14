using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallSign : Entity
    {
        public CallSign()
        {
            this.Qsoes = new List<Qso>();
        }

        public int CallSignId { get; set; }
        public string Call { get; set; }
        public int Continent { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
