using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class YaxisFunction : Entity
    {
        public int Id { get; set; }
        public string YaxisFuncName { get; set; }
        public byte Index { get; set; }
    }
}
