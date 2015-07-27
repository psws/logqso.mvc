using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatAssisted
    {
        [Key]
        public virtual Logqso.mvc.common.Enum.CatAssistedEnum CatAssist { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(15)]
        [Required]
        public virtual string CatAssistedName { get; set; }
    }
}
