using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltBand : Entity
    {
        public int FiltBnd { get; set; }
        public string FiltBandName { get; set; }
        public byte Index { get; set; }
    }
}
