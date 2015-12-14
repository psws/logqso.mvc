using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Logqso.mvc.DataModel.LogData.DataModels;

namespace Logqso.mvc.DataModel.LogData.CallInfoModels
{
    public class CallInfo
    {
        [Key]
        public int CallInfoId { get; set; }
        public Logqso.mvc.common.Enum.CallGroupEnum CallGroup { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(25)]
        [Required]
        public string ContestId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(25)]
        public string Callsign { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public string Station { get; set; }
        public virtual Contest Contest { get; set; }
    }
}
