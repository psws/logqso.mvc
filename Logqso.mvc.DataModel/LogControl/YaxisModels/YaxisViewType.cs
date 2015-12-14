using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.DataModel.LogControl.YaxisModels
{
    public class YaxisViewType : Entity
    {
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Index(IsUnique = true)]
        public virtual string YaxisViewTypeName { get; set; }
        [Required]
        public virtual byte Index { get; set; }
    }
}
