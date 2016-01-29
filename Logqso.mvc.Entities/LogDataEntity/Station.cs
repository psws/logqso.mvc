using System;
using System.Collections.Generic;
using Infrastructure;



namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Station : Entity
    {
        public int StationId { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public virtual Log Log { get; set; }
    }
}
