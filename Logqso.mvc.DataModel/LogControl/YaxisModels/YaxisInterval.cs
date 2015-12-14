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
    public class YaxisInterval : Entity
    {
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public string YaxisIntvVal { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
