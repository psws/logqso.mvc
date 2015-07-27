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
        public virtual Logqso.mvc.common.Enum.CatNoOfIxEnum CatTx { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(12)]
        [Required]
        public virtual string CatNoOfTxName { get; set; }
    }
}
