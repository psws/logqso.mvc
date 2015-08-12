using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData
{
    //[Table("CallSign")]
    public class CallSign
    {
        public virtual int CallSignId { get; set; }
        [StringLength(20, ErrorMessage  = "The {0} must be at least {2} characters long"), MinLength(3)]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 3)]
        //https://msdn.microsoft.com/en-us/data/gg193958.aspx
        [Column(TypeName = "varchar")]
        [Required]
        public virtual string Call { get; set; }
        public virtual Logqso.mvc.common.Enum.ContinentEnum Continent { get; set; }
    }
}
