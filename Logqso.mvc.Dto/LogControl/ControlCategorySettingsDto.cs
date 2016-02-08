using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Logqso.mvc.Dto.LogControl
{
    public class ControlCategorySettingsDto 
    {
        public string CatOperator { get; set; }
        public string CatBand { get; set; }
        public string CatPower { get; set; }
        public string CatAssisted { get; set; }
        public string CatNoOfTx { get; set; }
        public bool Disabled { get; set; }
    }
}
