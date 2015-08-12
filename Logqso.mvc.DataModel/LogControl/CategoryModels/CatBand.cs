using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatBand
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Logqso.mvc.common.Enum.CatBandEnum CatBnd { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public  string CatBandName { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
