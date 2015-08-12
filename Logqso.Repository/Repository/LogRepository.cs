﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Repository.Interfaces;

namespace Logqso.Repository.Repository
{
    public class LogRepository : ILogRepository, IDisposable
    {
        public Log GetByID(int LogID)
        {
            Log Log = new Log();

            //stubed out. replace by DB call
            Log.LogId = LogID;
            Log.ContestYear = DateTime.Now;
            Log.ContestId = 1;

            return Log;
        }

        public IReadOnlyList<Log> GetByYear(DateTime Year)
        {

            //stubed out. replace by DB call
            IReadOnlyList<Log> Logs = new List<Log> {
            new Log() {LogId = 1,  ContestId = 1, ContestYear = Year    },
            new Log() {LogId = 1,  ContestId = 1, ContestYear = Year    },
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
