using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.DataModel.LogControl.FilterModels
{
    public class FiltPrefix : Entity
    {
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(10)]
        [Required]
        //[Index(IsUnique = true)] 
        public virtual string FiltPref { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(24)]
        [Required]
        public virtual string CountryName { get; set; }
    }
}
