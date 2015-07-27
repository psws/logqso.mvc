using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatBand
    {
        [Key]
        public virtual Logqso.mvc.common.Enum.CatBandEnum CatBnd { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public virtual string CatBandName { get; set; }
    }
}
