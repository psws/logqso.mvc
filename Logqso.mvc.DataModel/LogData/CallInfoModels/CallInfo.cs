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
        public string SelectedCall { get; set; }
        public  int CallsignId { get; set; }
        //[Column(TypeName = "varchar")]
        //[MaxLength(20)]
        //public string StationName { get; set; }

        //public int LogId { get; set; }

        ////https://msdn.microsoft.com/en-us/data/jj591583.aspx
        [ForeignKey("Station")]
        [Column(Order = 1)]
        public int StationId { get; set; }
        [ForeignKey("Station")]
        [Column(Order = 2)]
        public int LogId { get; set; }
        [ForeignKey("Station")]
        [Column(Order = 3)]
        public string StationName { get; set; }

        public virtual Contest Contest { get; set; }
        public virtual CallSign CallSign { get; set; }
        //public virtual Log Log { get; set; }

        public  Station Station { get; set; }
    }
}
