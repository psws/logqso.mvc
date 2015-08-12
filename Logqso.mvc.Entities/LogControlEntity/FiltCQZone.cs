using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltCQZone : Entity
    {
        public int Id { get; set; }
        public string FiltCQZoneVal { get; set; }
        public byte Index { get; set; }
    }
}
