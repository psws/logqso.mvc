using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class CabrilloInfo
    {
        [Key]
        public int CabrilloInfoId { get; set; }

        ////[ForeignKey("Log")]
        ////public int LogId { get; set; }
        public int ClaimedScore { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string Club { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(200)]
        public string Operators { get; set; }

        ////public virtual Log Log { get; set; }

    }
}
