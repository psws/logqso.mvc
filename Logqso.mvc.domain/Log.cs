using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.domain
{
    public class Log
    {
        public Guid LogID { get; set; }
        public int CallsignID { get; set; }
        public DateTime ContestYear { get; set; }
        public int ContestID { get; set; }

        //public void FindByID(Guid LogCallsignID)
        //{
        //    this.LogCallsignID = LogCallsignID;
        //    CallsignID = 1;
        //    ContestYear = DateTime.Now;
        //    ContestID = 1;
        //}

        private List<Log> Logs { get; set; }
        public IReadOnlyList<Log> items
        {
            get 
            {
                return Logs;
            }
        }
    }

}
