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
    public class LoglvsService
    {
        private readonly ILogRepository _logRepository;

        public LoglvsService(ILogRepository LogRepository)
        {
            _logRepository = LogRepository;

        }

        public Log GetByID(int LogID)
        {
            Log LogEntity = null;
            Logqso.mvc.DataModel.LogData.DataModels.Log Log = null;
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
                LogEntity = AutoMapper.Mapper.Map<Logqso.mvc.DataModel.LogData.DataModels.Log, Log>(Log);
            }
#endif
            return LogEntity;
        }


        public  IReadOnlyList<Log> GetByYear(DateTime Year)
        {
            //Todo Stub for DB
            //IReadOnlyList<Log> Logs = new List<Log> {
            //    new Log() {   };
            //    ;
            IReadOnlyList<Log> LogEntitiess = new List<Log> {
            new Log() {LogId = 1, ContestId = "CQWWSSB2015",  ContestYear = Year    },
            new Log() {LogId = 2, ContestId = "CQWWSSB2015",  ContestYear = Year    },
            };

            return LogEntitiess;
        }
    }
}
