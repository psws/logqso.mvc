using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel;
using Logqso.mvc.Entities.Interfaces;

namespace Logqso.mvc.persistance
{
    public class LogRepository : ILogRepository, IDisposable
    {
        public Log GetByID(Guid LogID)
        {
            Log Log = new Log();

            //stubed out. replace by DB call
            Log.LogID = LogID;
            Log.CallsignID = 1;
            Log.ContestYear = DateTime.Now;
            Log.ContestID = 1;

            return Log;
        }

        public IReadOnlyList<Log> GetByYear(DateTime Year)
        {

            //stubed out. replace by DB call
            IReadOnlyList<Log> Logs = new List<Log> {
            new Log() {LogID = Guid.NewGuid(), CallsignID = 1, ContestID = 1, ContestYear = Year    },
            new Log() {LogID = Guid.NewGuid(), CallsignID = 2, ContestID = 1, ContestYear = Year    },
            };

            return Logs;
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    //context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }



    }
}
