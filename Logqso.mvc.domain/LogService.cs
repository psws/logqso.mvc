using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;
using Logqso.mvc.common.Interfaces;
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

        public Log GetByID(Guid LogID)
        {
            LogDto LogDto = null;
            Log  log = null;
            //LogRepository LogRepository1 = new LogRepository();
            //LogDto  LogDto = LogRepository1.GetByID(LogCallsignID);
           // dependency injection

            LogDto = _logRepository.GetByID(LogID);

#if noautomap
            var log = new Log();
            log.LogID = LogDto.LogID;
            log.CallsignID = LogDto.CallsignID;
            log.ContestYear = LogDto.ContestYear;
            log.ContestID = LogDto.ContestID;
#else
            if (LogDto == null)
            {
                LogNotFoundException LogNotFoundException = new LogNotFoundException("Log does not exist for ");
                LogNotFoundException.LogID = LogID; 
                throw LogNotFoundException;
            }else {
                log  = AutoMapper.Mapper.Map<LogDto, Log>(LogDto);
            }
#endif
            return log;
        }


        public  IReadOnlyList<Log> GetByYear(DateTime Year)
        {
            //Todo Stub for DB
            //IReadOnlyList<Log> Logs = new List<Log> {
            //    new Log() {   };
            //    ;
            IReadOnlyList<Log> Logs = new List<Log> {
            new Log() {LogID = Guid.NewGuid(), CallsignID = 1, ContestID = 1, ContestYear = Year    },
            new Log() {LogID = Guid.NewGuid(), CallsignID = 2, ContestID = 1, ContestYear = Year    },
            };

            return Logs;
        }
    }
}
