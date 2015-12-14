using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.Dto
{
    public partial class CatPowerEntity : Entity
    {
        public int CatPwr { get; set; }
        public string CatPowerName { get; set; }
    }
}
