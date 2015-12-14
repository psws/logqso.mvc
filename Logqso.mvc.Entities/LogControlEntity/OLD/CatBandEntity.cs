using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.Dto
{
    public partial class CatBandEntity : Entity
    {
        public int CatBnd { get; set; }
        public string CatBandName { get; set; }
    }
}
