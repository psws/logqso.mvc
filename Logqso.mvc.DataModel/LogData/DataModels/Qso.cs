using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    // [Table("Qso")]
    public class Qso
    {
        //http://go.microsoft.com/fwlink/?LinkId=386388
        [Key]
        [Column(Order = 1)]
        public short QsoNo { get; set; } // Log Order
        [Key]
        [Column(Order = 2)]
        //[ForeignKey("Log")]
        //[Column(Order = 1)]
        //public int LogId { get; set; }
        [ForeignKey("Station")]
        //[Column(Order = 3)]
        public int LogId { get; set; }
        [ForeignKey("Station")]
        [Column(Order = 3)]
        [MaxLength(20)]
        public string StationName { get; set; } //selected station
        //We do not ned to FK StationId cuz in this use it can be empty
        //If it has a value the LogID member does not protect the StationName from changing or being deleted
        //This is not an issue cuz QSO rows sets and initialize the corresponding Station row.
        //The row is used to prevent duplicate Log Station Names
        //If the log is deleted all Qsos and Stations for that log are deleted.
        //////public  int? StationId { get; set; }

#if false
        [Required]
        public int LogId { get; set; }
        public Log Log { get; set; }
        //need to turn off CascadeOnDelete on QSO.LogId in LogDataDB.cs
            //https://msdn.microsoft.com/en-us/data/jj591620#RequiredToRequired
            //modelBuilder.Entity<LogData.DataModels.Qso>().HasRequired(p => p.Log)
            //.WithMany().HasForeignKey(c=>c.LogId).WillCascadeOnDelete(false);
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string StationName { get; set; }
#endif

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

#endif
        ////[Column(TypeName = "decimal(7,4)")]
        [Column(TypeName = "decimal")]
        public decimal Frequency { get; set; }


        [Required]
        public int CallsignId { get; set; }
        [DataType(DataType.Date)]
        [Required]
        public DateTime QsoDateTime { get; set; }
        public byte RxRst { get; set; }
        public byte TxRst { get; set; }
        public short? QsoExchangeNumber { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.QsoModeTypeEnum QsoModeTypeEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.QsoRadioTypeEnum QsoRadioTypeEnum { get; set; }



        public virtual CallSign CallSign { get; set; }
        //public Station Station { get; set; }
        //public virtual Log Log { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }
        public virtual QsoRadioType QsoRadioType { get; set; }
        public virtual Station Station { get; set; }

    }
}
