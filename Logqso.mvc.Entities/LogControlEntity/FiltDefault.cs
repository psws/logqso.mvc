using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltDefault : Entity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public int FiltBnd { get; set; }
        public int FiltCont { get; set; }
        public string FiltPref { get; set; }
        public string FiltCQZoneVal { get; set; }
        public virtual FiltBand FiltBand { get; set; }
        public virtual FiltContinent FiltContinent { get; set; }
        public virtual FiltCQZone FiltCQZone { get; set; }
        public virtual FiltPrefix FiltPrefix { get; set; }
    }
}
