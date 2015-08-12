using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData
{
   // [Table("Qso")]
    public class Qso
    {
        //http://go.microsoft.com/fwlink/?LinkId=386388
        [Key]
        [Column(Order = 1)]
        public virtual int QsoId { get; set; }
        [Key]
        [Column(Order = 2)]
        public virtual int LogId { get; set; }
        public virtual int CallsignId { get; set; }
        [DataType(DataType.Date)]
        public virtual DateTime QsoDateEime { get; set; }
        public virtual byte RxRst { get; set; }
        public virtual byte TxRst { get; set; }
        public virtual Log Log { get; set; }
        public virtual CallSign CallSign { get; set; }
    }
}
