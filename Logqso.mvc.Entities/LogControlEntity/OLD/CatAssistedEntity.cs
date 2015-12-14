using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.Dto
{
    public partial class CatAssistedEntity : Entity
    {
        public int CatAssist { get; set; }
        public string CatAssistedName { get; set; }
    }
}
