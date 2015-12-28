using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class QsoExchangeAlpha
    {
        //http://go.microsoft.com/fwlink/?LinkId=386388
        [Key]
        [ForeignKey("Qso")]
        [Column(Order = 1)]
        public  short QsoNo { get; set; } // Log Order
        [Key]
        [ForeignKey("Qso")]
        [Column(Order = 2)]
        public int LogId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public string QsoExhangeAlphaValue { get; set; }

        public virtual Qso Qso { get; set; }


    }
}
