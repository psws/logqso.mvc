using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.Dto
{
    public partial class CatOperator : Entity
    {
        public int CatOpr { get; set; }
        public string CatOprName { get; set; }
    }
}
