using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatOperator
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Logqso.mvc.common.Enum.CatOperatorEnum CatOpr { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public  string CatOprName { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
