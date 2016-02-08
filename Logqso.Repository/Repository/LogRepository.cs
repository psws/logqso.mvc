using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;

using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Entities.LogDataEntity;
using Repository.Pattern.Repositories;
using Logqso.mvc.common.Enum;

namespace Logqso.Repository.Repository
{
    public static class LogRepository
    {

        //EXTENSION METHODS for IRepository<tEntity T>

        public static IEnumerable<CallInfo> GetDataCallInfoSelections(this IRepository<CallInfo> repository, string Username)
        {

#if true
            List<CallInfo>  callis = null;
#else
            IQueryable<CallInfo> CallInfoss = null;
            List<CallInfo> CallInfoUser = null;
#endif

            try
            {
#if true
                //tracked
                callis = repository.Query(x => x.UserName == Username)
                    .Include(x => x.Station).Include(x => x.CallSign)
                    .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
                    .ToList();

                var Logrepo = repository.GetRepository<Log>();
                var CallInfoQ = repository.QueryableNoTracking();
                var LogQ = Logrepo.QueryableNoTracking();
                var entryPoint = (from ep in CallInfoQ
                                  join e in LogQ on ep.LogId equals e.LogId
                                  //join t in dbContext.tbl_Title on e.TID equals t.TID
                                  where ep.UserName == Username
                                  select new DataCallInfoDto
                                  {
                                      CallGroup = (CallGroupEnum)ep.CallGroup,
                                      //TID = e.TID,
                                      //Title = t.Title,
                                      //EID = e.EID
                                  });

#else
                // not tracked no include
                CallInfoss = repository.QueryableNoTracking();
                //no includes for  IQueryable<CallInfo> 
                CallInfoUser = CallInfoss.Where(t => t.UserName == Username).OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup).ToList();
#endif          
            
            }
            catch (Exception ex)
            {
                
                throw;
            }

#if true
            return callis;

#else
            return CallInfoUser;
#endif
        }

        public static IEnumerable<Log> GetDataLogContestsStationsSelections(this IRepository<Log> repository, string Username)
        {
            List<Log> Log= null;

                //tracked
                //log1 = repository.Query(x => x.UserName == Username)
                //    .Include(x => x.Station).Include(x => x.CallSign)
                //    .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
                //    .ToList();

                return Log;
        }



    }
}
