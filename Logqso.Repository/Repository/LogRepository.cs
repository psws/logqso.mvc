using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;

using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Dto.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using Repository.Pattern.Repositories;
using Logqso.mvc.common.Enum;

namespace Logqso.Repository.Repository
{
    public static class LogRepository
    {

        //EXTENSION METHODS for IRepository<tEntity T>
        public static async Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelectionsAsync(this IRepositoryAsync<Log> LogRepository, string Username, bool Active)
        {
            return await GetDataCallInfoSelections(LogRepository, Username, Active);
        }

        public static Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelections(this IRepositoryAsync<Log> _LogRepository, string Username, bool Active)
        {

            IEnumerable<DataCallInfoDto> DataCallInfoDtos = null;



            try
            {

                //URF creates many DataContexts.
                //as many as 3.
                //One for LogQSoData DbContext,
                //One for UnitOfWork.
                //One for Repository.
                //
                //The passed in _LogRepository has a DataContext from Dependency resolver
                //The Unit of work DataContext does not match the DataContext of the _Logrespository
                //SOLUTION: use the _LogRepository to get a LogRespositpry with the  UoW DataContext
                //This allows the join below to have all of the expression trees point to the same DBContext.
                //This hook fixes a problem that should not occur,

                var LogRepository = _LogRepository.GetRepository<Log>();
                IQueryFluent<Log> Logs = LogRepository.Query();
                var LogQ = Logs
                    .Include(x => x.Stations)
                    .Include(x => x.Contest)
                    .SelectQueryable(true);

                var CallInfoRepository = LogRepository.GetRepository<CallInfo>();
                IQueryFluent<CallInfo> CallInfoss = CallInfoRepository.Query(t => t.UserName == Username);
                var CallInfoQ = CallInfoss
                    .Include(x => x.Station).Include(x => x.CallSign).Include(x => x.QsoRadioType)
                    .SelectQueryable(true)
                    .OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup);


                //var ContesttypeRepository = LogRepository.GetRepository<ContestType>();
                //IQueryFluent<ContestType> ContestTypess = ContesttypeRepository.Query();
                //var ContestTypeQ = ContestTypess
                //    .Include(x => x.Contests)
                //    .SelectQueryable(true);

                var ContestRepository = LogRepository.GetRepository<Contest>();
                IQueryFluent<Contest> Contestss = ContestRepository.Query();
                var ContestQ = Contestss
                    .SelectQueryable(true).Where(x => x.Active == Active);


                var RadioRepository = LogRepository.GetRepository<QsoRadioType>();
                IQueryFluent<QsoRadioType> RadioTypess = RadioRepository.Query();
                var RadioQ = RadioTypess
                    .SelectQueryable(true);
#if false
                DataCallInfoDtos = (from lq in LogQ
                                    join lc in CallInfoQ on lq.LogId equals lc.LogId
                                    where lc.UserName == Username
                                    select new DataCallInfoDto
                                    {
                                        SelectedContestName = lc.ContestId
                                    }).ToList();
#else
                DataCallInfoDtos = (from lc in CallInfoQ
                                    join lq in LogQ on lc.LogId equals lq.LogId
                                    where lc.UserName == Username 
                                    select new DataCallInfoDto
                                    {
                                        CallGroup = (CallGroupEnum)lc.CallGroup,
                                        SelectedContestName = lc.Contest.ContestName,
                                        SelectedCall = lq.Contest.ContestName,
                                        SelectedStationName = lc.Station.StationName,
                                        QsoRadioType = (QsoRadioTypeEnum)lc.QsoRadioTypeEnum,
                                        //Selecct() flattens
                                        //StationNames = lq.Stations.Select(x => x.StationName).ToList(),
                                        StationNames = (from cn in lq.Stations 
                                                        select new StationNamestype
                                                      {
                                                          key = cn.LogId,
                                                          value = cn.StationName
                                                      }).ToList(),

                                        LogId = lc.LogId,
                                        //returns only contests that match the Callinfo
                                        //ContestNames = cq.Contests.Where(x => x.ContestName.Contains("cqww")).Select(x => x.ContestName).ToList(),

                                        //return all contests in Db table ordered  by name
                                        //ContestNames = ContestTypeQ.SelectMany(x => x.Contests).OrderBy(x => x.ContestName).Select(x => x.ContestName).ToList(),
                                        //ContestNames = ContestQ.Where(x => x.Active == Active).OrderBy(x => x.ContestName).Select(x => x.ContestName).ToList(),
                                        //ContestNames = ContestQ.Select(x=> new {x.ContestId, x.ContestName}).OrderBy(x => x.ContestName).
                                        //    AsEnumerable().Select(x => new KeyValuePair<string, string>(x.ContestId, x.ContestName)).AsEnumerable().ToList(),

                                        //ContestNames = ContestQ.Select(x => new  { x.ContestId, x.ContestName }).OrderBy(x => x.ContestName).
                                        //   AsEnumerable().ToList < ContestNamestype>(),


                                        ContestNames = (from cn in ContestQ
                                                        select new ContestNamestype
                                                        {
                                                            key = cn.ContestId,
                                                            value = cn.ContestName
                                                        }).ToList(),

                                        //return all WPX contests in Db table ordered  by name
                                        //ContestNames = ContestQ.SelectMany(x => x.Contests).Where(x => x.ContestName.StartsWith("Cqwpx")).OrderBy(x => x.ContestName).Select(x => x.ContestName).ToList(),

                                        //return all contests in Db table 
                                        //RadioNames = RadioQ.Select(x => x.QsoRadioTypeName).ToList(),
                                        RadioNames = (from cn in RadioQ
                                                        select new RadioNamestype
                                                        {
                                                            key = cn.QsoRadioTypeEnum,
                                                            value = cn.QsoRadioTypeName
                                                        }).ToList(),

                                        Disabled = lc.Disabled
                                    }).ToList();
#endif

            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("GetDataCallInfoSelections exception {0}", ex.Message));
                throw;
            }
            //add ALL default to Stations
            StationNamestype StationNamestype = new StationNamestype(0, "ALL");
            foreach (var item in DataCallInfoDtos)
	        {
                item.StationNames.Add(StationNamestype);
                //var Resuls = item.StationNames.OrderBy(i => i.key == 0 ? 0 : 1).ThenBy(i => i.key).ThenBy(x => x.value);
                item.StationNames = item.StationNames.OrderBy(i => i.key).ThenBy(x=>x.value).ToList();
	        }
            return Task.FromResult(DataCallInfoDtos);
        }

        public static IEnumerable<Log> GetDataLogContestsStationsSelections(this IRepository<Log> repository, string Username)
        {
            List<Log> Log = null;

            //tracked
            //log1 = repository.Query(x => x.UserName == Username)
            //    .Include(x => x.Station).Include(x => x.CallSign)
            //    .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
            //    .ToList();

            return Log;
        }



    }
    public class test9
    {
        string key;
        string value;
    };

}
