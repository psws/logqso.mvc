using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;

namespace Logqso.Repository.Repository.Models
{
    public class ContestControlEntity : Entity
    {
        public ContestCategoryEntity ContestCategoryEntity;
    }
}
