using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.XaxisModels
{
    public class XaxisStartTime
    {
        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public  string XaxisStrtTime { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
