using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;


namespace Logqso.Repository.Models.LogControl
{
    public class ControlCategorySettingsEntity 
    {
        public string CatOperator { get; set; }
        public string CatBand { get; set; }
        public string CatPower { get; set; }
        public string CatAssisted { get; set; }
        public string CatNoOfTx { get; set; }
        public bool Disabled { get; set; }
    }
}
