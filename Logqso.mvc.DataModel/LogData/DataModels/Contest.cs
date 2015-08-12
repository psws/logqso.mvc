using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData
{
    //[Table("Contest")]
    public class Contest
    {
        public virtual int ContestId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(30)]
        [Required]
        public virtual string ContestName { get; set; }
    }
}
