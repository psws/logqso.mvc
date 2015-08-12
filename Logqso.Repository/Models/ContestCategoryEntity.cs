using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;


namespace Logqso.Repository.Repository.Models
{
    public class ContestCategoryEntity : Entity
    {
        public List<string> CatOperator { get; set; }
        public List<string> CatBand { get; set; }
        public List<string> CatPower { get; set; }
        public List<string> CatAssisted { get; set; }
        public List<string> CatNoOfTx { get; set; }
    }
}
