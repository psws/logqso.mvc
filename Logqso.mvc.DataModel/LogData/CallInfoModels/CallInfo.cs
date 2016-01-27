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
        [MaxLength(35)]
        [Required]
        public string ContestId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(25)]
        public string SelectedCall { get; set; }
        public  int CallsignId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; } //// UserName can have 3 entries/sessionname
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        ////[Index(IsUnique = true)]  // Session can have 3 entries
        [Required]
        public string SessionName { get; set; }


#if false
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
#else
        public int LogId { get; set; }
        public virtual Log Log { get; set; }
        //We do not ned to FK StationId cuz in this use it can be empty
        //If it has a value the LogID member does not protect the StationName from changing or being deleted
        //This is not an issue cuz QSO rows sets and initialize the corresponding Station row.
        //The row is used to prevent duplicate Log Station Names
        //If the log is deleted all Qsos and Stations for that log are deleted.
        //The calinfo with logid will also be deleted
        public  int? StationId { get; set; }

#endif

        public virtual Contest Contest { get; set; }
        public virtual CallSign CallSign { get; set; }

    }
}
