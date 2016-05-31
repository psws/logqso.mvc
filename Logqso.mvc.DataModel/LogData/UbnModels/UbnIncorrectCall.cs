using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.UbnModels
{
    public class UbnIncorrectCall
    {
        [Key]
        [Column(Order = 1)]
        public short QsoNo { get; set; } // Log Order
        [Key]
        [Column(Order = 2)]
        //[ForeignKey("Log")]
        public int LogId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public string CorrectCall { get; set; }
    }
}
