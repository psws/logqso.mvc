using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatOperator
    {
        [Key]
        public virtual Logqso.mvc.common.Enum.CatOperatorEnum CatOpr { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(15)]
        [Required]
        public virtual string CatOprName { get; set; }
    }
}
