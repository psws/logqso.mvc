using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class YaxisInterval : Entity
    {
        public int Id { get; set; }
        public int YaxisIntvVal { get; set; }
        public byte Index { get; set; }
    }
}
