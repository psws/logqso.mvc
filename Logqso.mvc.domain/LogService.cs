using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Interfaces;
using Logqso.mvc.Exceptions;

//using Logqso.mvc.persistance;

namespace Logqso.mvc.domain
{
    public class LogService
    {
        private readonly ILogRepository _logRepository;

        public LogService(ILogRepository LogRepository)
        {
            _logRepository = LogRepository;

        }

        public LogEntity GetByID(int LogID)
        {
            LogEntity LogEntity = null;
            Log Log = null;
            //LogRepository LogRepository1 = new LogRepository();
            //LogDto  LogDto = LogRepository1.GetByID(LogCallsignID);
           // dependency injection

            Log = _logRepository.GetByID(LogID);

#if noautomap
            var log = new Log();
            log.LogID = LogDto.LogID;
            log.CallsignID = LogDto.CallsignID;
            log.ContestYear = LogDto.ContestYear;
            log.ContestID = LogDto.ContestID;
#else
            if (Log == null)
            {
                LogNotFoundException LogNotFoundException = new LogNotFoundException("Log does not exist for ");
                LogNotFoundException.LogID = LogID; 
                throw LogNotFoundException;
            }else {
                LogEntity = AutoMapper.Mapper.Map<Log, LogEntity>(Log);
            }
#endif
            return LogEntity;
        }


        public  IReadOnlyList<LogEntity> GetByYear(DateTime Year)
        {
            //Todo Stub for DB
            //IReadOnlyList<Log> Logs = new List<Log> {
            //    new Log() {   };
            //    ;
            IReadOnlyList<LogEntity> LogEntitiess = new List<LogEntity> {
            new LogEntity() {LogId = 1, ContestId = 1,  ContestYear = Year    },
            new LogEntity() {LogId = 1, ContestId = 2,  ContestYear = Year    },
            };

            return LogEntitiess;
        }
    }
}
