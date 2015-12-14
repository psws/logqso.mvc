using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.DataModel.LogControl.FilterModels
{
    public class FiltBand : Entity
    {
        [Key]
        public virtual Logqso.mvc.common.Enum.CatBandEnum FiltBnd { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public virtual string FiltBandName { get; set; }
        [Required]
        public virtual byte Index { get; set; }
    }
}
