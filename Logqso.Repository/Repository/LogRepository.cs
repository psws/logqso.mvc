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
using System.Data;

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
                                        SelectedCall = lc.CallSign.Call,
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


        public static async Task<DataTable> GenerateChartAsync(this IRepositoryAsync<Log> LogRepository, ChartCtlDataSettingsDto ChartCtlDataSettingsDto, string username)
        {
            return await GenerateChart(LogRepository, ChartCtlDataSettingsDto, username);
        }

        public static Task<DataTable> GenerateChart(this IRepositoryAsync<Log> _LogRepository, ChartCtlDataSettingsDto ChartCtlDataSettingsDto, string username)
        {
            string filepath = "chart.png";
            DataTable DataTable = new DataTable();
            return Task.FromResult(DataTable);
        }


        public static async Task<DataCalls> GetCategorizedCallsAsync(this IRepository<Log> LogRepository, LogCategory LogCategory,
            string SelectedContestName, string CallChar, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, string Username)
        {
            return await GetCategorizedCalls(LogRepository, LogCategory, SelectedContestName, CallChar, CallGroup,  Username);
        }


        public static Task<DataCalls> GetCategorizedCalls(this IRepository<Log> _LogRepository, LogCategory LogCategory,
            string SelectedContestName, string SelectedCall, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, string Username)
        {
            //The passed in _LogRepository has a DataContext from Dependency resolver
            //The Unit of work DataContext does not match the DataContext of the _Logrespository
            //SOLUTION: use the _LogRepository to get a LogRespositpry with the  UoW DataContext
            //This allows the join below to have all of the expression trees point to the same DBContext.
            //This hook fixes a problem that should not occur,

            var LogRepository = _LogRepository.GetRepository<Log>();

            DataCalls DataCalls = new DataCalls();
            string CallChar = SelectedCall.Substring(0, 1);

            var CallSignRepository = LogRepository.GetRepository<CallSign>();
            IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();
            var CallSignQ = CallSigns.SelectQueryable(false);



            var LogCategoryRepository = LogRepository.GetRepository<LogCategory>();
                IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
                var LogCategoryQ = LogCategorys.SelectQueryable(false);

                //LogCategory LogCategoryQ = LogCategorys
                //    .SelectQueryable(false).Where(
                //            l => l.CatAssistedEnum == LogCategory.CatAssistedEnum &&
                //                l.CatBandEnum == LogCategory.CatBandEnum &&
                //                l.CatNoOfTxEnum == LogCategory.CatNoOfTxEnum &&
                //                l.CatOperatorEnum == LogCategory.CatOperatorEnum &&
                //                l.CatOperatorOverlayEnum == LogCategory.CatOperatorOverlayEnum &&
                //                l.CatPowerEnum == LogCategory.CatPowerEnum
                //                       ).SingleOrDefault();


                var ContestRepository = LogRepository.GetRepository<Contest>();
                IQueryFluent<Contest> Contests = ContestRepository.Query();
                var ContestQ = Contests.
                    SelectQueryable(false).Where(x => x.ContestName == SelectedContestName).FirstOrDefault();



                try
                {
                    IQueryFluent<Log> Logs = LogRepository.Query();
                    var LogQ1 = Logs
                        .Include(x => x.CallSign)
                        //.Include(x=>x.LogCategory)
                        .SelectQueryable(false).Where(x => x.ContestId == ContestQ.ContestId);

                    if (LogCategory.CatAssistedEnum != (int)CatAssistedEnum.ALL)
                    {
                        LogQ1 = (from lq in LogQ1
                                        join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                        where (lc.CatAssistedEnum == LogCategory.CatAssistedEnum)
                                        select lq).AsQueryable();
                    }

                    if (LogCategory.CatBandEnum != (int)CatBandEnum.ALL)
                    {
                            LogQ1 = (from lq in LogQ1
                                        join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                        where (lc.CatBandEnum == LogCategory.CatBandEnum)
                                        select lq).AsQueryable();

                    }

#if true
                   if (LogCategory.CatNoOfTxEnum != (int)CatNoOfTxEnum.ALL)
                    {
                        LogQ1 = (from lq in LogQ1
                                    join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                    where (lc.CatNoOfTxEnum == LogCategory.CatNoOfTxEnum)
                                    select lq).AsQueryable();

                    }

                    if (LogCategory.CatOperatorEnum != (int)CatOperatorEnum.ALL)
                    {
                        LogQ1 = (from lq in LogQ1
                                    join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                    where (lc.CatOperatorEnum == LogCategory.CatOperatorEnum)
                                    select lq).AsQueryable();

                    }

                    if (LogCategory.CatOperatorOverlayEnum !=null && LogCategory.CatOperatorOverlayEnum != (int)CatOperatorOverlayEnum.NONE)
                    {
                        LogQ1 = (from lq in LogQ1
                                    join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                    where (lc.CatOperatorEnum == LogCategory.CatOperatorEnum)
                                    select lq).AsQueryable();

                    }


                    if (LogCategory.CatPowerEnum != (int)CatPowerEnum.ALL)
                    {
                        LogQ1 = (from lq in LogQ1
                                    join lc in LogCategoryQ on lq.LogCategoryId equals lc.LogCategoryId
                                    where (lc.CatPowerEnum == LogCategory.CatPowerEnum)
                                    select lq).AsQueryable();

                    }
#endif
                    //var Log = LogQ.ToList();

                    //var cs = CallSignQ.Where(x => x.Call.Substring(0, 1) == CallChar).ToList();
                    //var res = (from lq in LogQ
                    //           join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                    //           where (lc.Call.Substring(0, 1) == CallChar)
                    //           select lq
                    //                ).ToList();

                    //var res2 = (from lq in LogQ
                    //           join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                    //           where (lc.Call.Substring(0, 1) == CallChar)
                    //           select lc
                    //                ).ToList();

                    if (CallChar == "1")
                    {//get all calls beginning with 1 through nine.
                       var  CallGroupCalls = (from lq in LogQ1
                                          join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                          where new[] { "1", "2", "3", "4", "5", "6","7", "8", "9" }.Contains(lc.Call.Substring(0, 1) )

                                          select new CallGroupCall
                                          {
                                              CallSignID = lq.CallSign.CallSignId,
                                              Call = lq.CallSign.Call

                                          }
                                        ).OrderBy(x => x.Call).ToList();

                       DataCalls.CallGroup = CallGroup;
                       DataCalls.SelectedCall = SelectedCall;
                       DataCalls.Calls = CallGroupCalls;
                    }
                    else
                    {
                        var CallGroupCalls = (from lq in LogQ1
                                          join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                          where (lc.Call.Substring(0, 1) == CallChar)
                                          select new CallGroupCall
                                          {
                                              CallSignID = lq.CallSign.CallSignId,
                                              Call = lq.CallSign.Call

                                          }
                                        ).OrderBy(x => x.Call).ToList();

                        DataCalls.CallGroup = CallGroup;
                        DataCalls.SelectedCall = SelectedCall;
                        DataCalls.Calls = CallGroupCalls;
                    }


                }
                catch (Exception ex)
                {

                    throw;
                }



                //tracked
                //log1 = repository.Query(x => x.UserName == Username)
                //    .Include(x => x.Station).Include(x => x.CallSign)
                //    .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
                //    .ToList();

                return Task.FromResult(DataCalls); ;
            }



        }

        public class test9
        {
            string key;
            string value;
        };

}
