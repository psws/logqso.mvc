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
    public class FiltCQZone : Entity
    {
       [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(6)]
        [Required]
        public virtual string FiltCQZoneVal { get; set; }
        [Required]
        public virtual byte Index { get; set; }

    }
}
