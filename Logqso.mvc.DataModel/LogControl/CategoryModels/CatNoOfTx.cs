using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatNoOfTx
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Logqso.mvc.common.Enum.CatNoOfTxEnum CatNoOfTxEnum { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(12)]
        [Required]
        public  string CatNoOfTxName { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
