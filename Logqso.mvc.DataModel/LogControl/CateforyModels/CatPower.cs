using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatPower
    {
        [Key]
        public virtual Logqso.mvc.common.Enum.CatPowerrEnum CatPwr { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(6)]
        [Required]
        public virtual string CatPowerName { get; set; }
    }
}
