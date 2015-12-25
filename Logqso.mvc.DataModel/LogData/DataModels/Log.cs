using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    //[Table("Log")]
    public class Log
    {
        [Key]
        public  int LogId { get; set; }
        [DataType(DataType.Date)]
        public  DateTime ContestYear { get; set; }
        public int CallsignId { get; set; }
        public  string ContestId { get; set; }
        public int LogCategoryId { get; set; }

        public List<Station> Stations { get; set; }


        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual LogCategory LogCategory { get; set; }


        //public void FindByID(Guid LogCallsignID)
        //{
        //    this.LogCallsignID = LogCallsignID;
        //    CallsignID = 1;
        //    ContestYear = DateTime.Now;
        //    ContestID = 1;
        //}

        //private List<Log> Logs { get; set; }
        //public IReadOnlyList<Log> items
        //{
        //    get 
        //    {
        //        return Logs;
        //    }
        //}
    }
}
