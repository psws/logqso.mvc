using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Logqso.mvc.Dto.LogControl
{
    public class ControlCategoryDto
    {
        public List<string> CatOperator { get; set; }
        public List<string> CatBand { get; set; }
        public List<string> CatPower { get; set; }
        public List<string> CatAssisted { get; set; }
        public List<string> CatNoOfTx { get; set; }
    }
}
