using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltContinent : Entity
    {
        public int FiltCont { get; set; }
        public string FiltContName { get; set; }
        public byte Index { get; set; }
    }
}
