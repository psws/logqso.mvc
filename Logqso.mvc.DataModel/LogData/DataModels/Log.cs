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
        public virtual int LogId { get; set; }
        [DataType(DataType.Date)]
        public virtual DateTime ContestYear { get; set; }
        public virtual int ContestId { get; set; }
        public virtual Contest Contest { get; set; }

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
