using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class XaxisStartTime : Entity
    {
        public int Id { get; set; }
        public string XaxisStrtTime { get; set; }
        public byte Index { get; set; }
    }
}
