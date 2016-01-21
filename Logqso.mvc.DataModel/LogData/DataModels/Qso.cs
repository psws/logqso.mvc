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
        public  short QsoNo { get; set; } // Log Order
        [Key]
        [Column(Order = 2)]
        //[ForeignKey("Log")]
        public int LogId { get; set; }
        [Column(TypeName = "decimal(7,4)")]
        [MaxLength(20)]

        public decimal Frequency { get; set; }

        [ForeignKey("Station")]
        [Column(Order = 1)]
        public int StationId { get; set; }

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

        [Required]
        public int CallsignId { get; set; }
        [DataType(DataType.Date)]
        [Required]
        public DateTime QsoDateTime { get; set; }
        public  byte RxRst { get; set; }
        public  byte TxRst { get; set; }
        public int QsoExchangeNumber { get; set; }
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
