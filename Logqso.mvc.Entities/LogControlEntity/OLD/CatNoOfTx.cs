using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;


namespace Logqso.mvc.Entities.Dto
{
    public partial class CatNoOfTx : Entity
    {
        public int CatTx { get; set; }
        public string CatNoOfTxName { get; set; }
    }
}
