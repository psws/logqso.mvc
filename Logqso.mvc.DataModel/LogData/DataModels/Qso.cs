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
        //[Column(Order = 1)]
        public  int QsoId { get; set; }
        //[Key]
        //[Column(Order = 2)]
        //public int LogId { get; set; }

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
        public  int CallsignId { get; set; }
        [DataType(DataType.Date)]
        public  DateTime QsoDateEime { get; set; }
        public  byte RxRst { get; set; }
        public  byte TxRst { get; set; }

        public virtual CallSign CallSign { get; set; }
    }
}
