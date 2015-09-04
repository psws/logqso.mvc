using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.Repository.Models.LogControl
{
    public class ControlCategorysEntity
    {
        public List<CatOperator> CatOperator { get; set; }
        public List<CatBand> CatBand { get; set; }
        public List<CatPower> CatPower { get; set; }
        public List<CatAssisted> CatAssisted { get; set; }
        public List<CatNoOfTx> CatNoOfTx { get; set; }
    }
}
