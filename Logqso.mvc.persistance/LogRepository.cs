using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;
using Logqso.mvc.common.Interfaces;

namespace Logqso.mvc.persistance
{
    public class LogRepository : ILogRepository, IDisposable
    {
        public LogDto GetByID(Guid LogID)
        {
            LogDto LogDto = new LogDto();

            //stubed out. replace by DB call
            LogDto.LogID = LogID;
            LogDto.CallsignID = 1;
            LogDto.ContestYear = DateTime.Now;
            LogDto.ContestID = 1;

            return LogDto;
        }

        public IReadOnlyList<LogDto> GetByYear(DateTime Year)
        {
            LogDto LogDto = new LogDto();

            //stubed out. replace by DB call
            IReadOnlyList<LogDto> Logs = new List<LogDto> {
            new LogDto() {LogID = Guid.NewGuid(), CallsignID = 1, ContestID = 1, ContestYear = Year    },
            new LogDto() {LogID = Guid.NewGuid(), CallsignID = 2, ContestID = 1, ContestYear = Year    },
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
