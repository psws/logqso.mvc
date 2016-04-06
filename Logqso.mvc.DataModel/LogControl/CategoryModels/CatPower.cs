using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatPower
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Logqso.mvc.common.Enum.CatPowerEnum CatPowerEnum { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(6)]
        [Required]
        public  string CatPowerName { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
