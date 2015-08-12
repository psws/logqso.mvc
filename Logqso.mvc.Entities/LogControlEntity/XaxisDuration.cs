using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisDuration : Entity
    {
        public int Id { get; set; }
        public int XaxisDurationTime { get; set; }
        public byte Index { get; set; }
    }
}
