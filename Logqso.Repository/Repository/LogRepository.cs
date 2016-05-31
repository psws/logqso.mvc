using System;
using System.Collections.Generic;
using System.Linq;
using LinqKit;
using System.Collections;
using System.Data.Entity;

using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Dto.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using Repository.Pattern.Repositories;
using Logqso.mvc.common.Enum;
using System.Data;
using Repository.Pattern.DataContext;
using System.Linq.Dynamic;
using Logqso.mvc.Dto.Chart;
using System.Collections.ObjectModel;

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

                //add ALL default to Stations
                StationNamestype StationNamestype = new StationNamestype(0, "ALL");
                foreach (var item in DataCallInfoDtos)
                {
                    item.StationNames.Add(StationNamestype);
                    //var Resuls = item.StationNames.OrderBy(i => i.key == 0 ? 0 : 1).ThenBy(i => i.key).ThenBy(x => x.value);
                    item.StationNames = item.StationNames.OrderBy(i => i.key).ThenBy(x => x.value).ToList();
                }

                //fixup radio

                var LogCategoryRepository = _LogRepository.GetRepository<LogCategory>();
                IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
                var LogCategoryQ = LogCategorys
                    .SelectQueryable(true);


                foreach (var item in DataCallInfoDtos)
	            {
                  //Log log  = LogQ.Where(p=>p.LogId ==item.LogId ).FirstOrDefault();
                  //LogCategory LogCategory = LogCategoryQ.Where(p => p.LogCategoryId == log.LogCategoryId).FirstOrDefault();
                  LogCategory LogCategory = (from lc in LogCategoryQ
                                              join ll in LogQ on lc.LogCategoryId equals ll.LogCategoryId
                                              where ll.LogId == item.LogId
                                              select lc).FirstOrDefault();
                  CatOperatorEnum CatOperatorEnum;
                    ICollection<RadioNamestype> Validnames = new Collection<RadioNamestype>();
                    List<RadioNamestype> RadioNamelist = item.RadioNames.Cast<RadioNamestype>().ToList();

                    Validnames.Add(RadioNamelist.Where(p=>p.value == "ALL").FirstOrDefault() );

                  if (CatOperatorEnum.TryParse(LogCategory.CatOperatorEnum.ToString(), true, out CatOperatorEnum) == true)
                  {
                      switch (CatOperatorEnum)
                      {
                          case CatOperatorEnum.ALL:
                              break;
                          case CatOperatorEnum.SINGLE_OP:
                                    Validnames.Add(RadioNamelist.Where(p=>p.value == "Run").FirstOrDefault() );
                                    Validnames.Add(RadioNamelist.Where(p=>p.value == "S_P").FirstOrDefault() );
                              break;
                          case CatOperatorEnum.MULTI_OP:
                                if (LogCategory.CatNoOfTxEnum == (int)CatNoOfTxEnum.ONE)
                                {
                                    Validnames.Add(RadioNamelist.Where(p=>p.value == "Mult").FirstOrDefault() );
                                    Validnames.Add(RadioNamelist.Where(p=>p.value == "Run").FirstOrDefault() );
                                }
                                else if (LogCategory.CatNoOfTxEnum == (int)CatNoOfTxEnum.TWO)
	                            {
                                   Validnames.Add(RadioNamelist.Where(p=>p.value == "R1").FirstOrDefault() );
                                   Validnames.Add(RadioNamelist.Where(p=>p.value == "R2").FirstOrDefault() );
	                            }
                                else
                                {
                                }
                                break;
                          case CatOperatorEnum.CHECKLOG:
                              break;
                          default:
                              break;
                      }
                      item.RadioNames = Validnames;
                  }
	            }

#endif

            }
            catch (Exception ex)
            {
                Console.WriteLine(string.Format("GetDataCallInfoSelections exception {0}", ex.Message));
                throw;
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


        public static async Task<DataCalls> GetCategorizedCallsAsync(this IRepositoryAsync<Log> LogRepository, LogCategory LogCategory,
            string SelectedContestName, string CallChar, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, string Username)
        {
            return await GetCategorizedCalls(LogRepository, LogCategory, SelectedContestName, CallChar, CallGroup, Username);
        }

        //both GetCategorizedCalls and GetCategorizedCall2 methoda work.
        //GetCategorizedCalls2 uses the predicate builder along with asExpandable()
        //GetCategorizedCalls uses the Where extensions in DynamicLibrary.cs in the using System.Data.Entity namespace
        public static Task<DataCalls> GetCategorizedCalls(this IRepositoryAsync<Log> _LogRepository, LogCategory LogCategory,
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

            var LogCategoryRepository = LogRepository.GetRepository<LogCategory>();
            IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
            var LogCategoryQ = LogCategorys.SelectQueryable(false);


            //Using Predicate
            var Predicate = PredicateBuilder.True<LogCategory>();
            if (LogCategory.CatAssistedEnum != (int)CatAssistedEnum.ALL)
            {
                Predicate = Predicate.And(p => p.CatAssistedEnum == LogCategory.CatAssistedEnum);
            }
            if (LogCategory.CatBandEnum != (int)CatBandEnum.ALL)
            {
                Predicate = Predicate.And(p => p.CatBandEnum == LogCategory.CatBandEnum);
            }
            if (LogCategory.CatNoOfTxEnum != (int)CatNoOfTxEnum.ALL)
            {
                Predicate = Predicate.And(p => p.CatNoOfTxEnum == LogCategory.CatNoOfTxEnum);
            }
            if (LogCategory.CatOperatorEnum != (int)CatOperatorEnum.ALL)
            {
                Predicate = Predicate.And(p => p.CatOperatorEnum == LogCategory.CatOperatorEnum);
            }
            if (LogCategory.CatOperatorOverlayEnum != null && LogCategory.CatOperatorOverlayEnum != (int)CatOperatorOverlayEnum.NONE)
            {
                Predicate = Predicate.And(p => p.CatOperatorOverlayEnum == LogCategory.CatOperatorOverlayEnum);
            }
            if (LogCategory.CatPowerEnum != (int)CatPowerEnum.ALL)
            {
                Predicate = Predicate.And(p => p.CatPowerEnum == LogCategory.CatPowerEnum);
            }

            var ContestRepository = LogRepository.GetRepository<Contest>();
            IQueryFluent<Contest> Contests = ContestRepository.Query();
            var ContestQ = Contests.
                SelectQueryable(false).Where(x => x.ContestName == SelectedContestName).FirstOrDefault();


            var CallSignRepository = LogRepository.GetRepository<CallSign>();
            IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();

            IQueryFluent<Log> Logs = LogRepository.Query();
            var LogQ1 = Logs
                        .SelectQueryable(false).Where(x => x.ContestId == ContestQ.ContestId);

            CallSignRepository.SetSQLLogging(true);

            Predicate = Predicate.And(p => LogQ1.Any(o => o.LogCategoryId == p.LogCategoryId && o.ContestId == ContestQ.ContestId));
            //http://www.albahari.com/nutshell/predicatebuilder.aspx
            var LogCateorySBSet = LogCategoryRepository.Queryable();
            var LogCategoryQ2 = LogCateorySBSet.AsExpandable().Where(Predicate);


            //NOTE
            //Unfortunately there's no way to use Predicate<T> in EF linq since it's impossible to map it on SQL query.
            //This can be done with Expressions only because they can be parsed and converted to SQL
            //Predicate works on two tavles that have a relationship ONLY
            // LogCategoryQ2 is an Iqueryable with contes qualified
            //CallsignQ is an Iquertable qualified by the first char CallChar

            ICollection<CallGroupCall> CallGroupCalls = null;
            try
            {
                if (CallChar == "1")
                {//get all calls beginning with 1 through nine.
                    var CallSignQ = CallSigns.SelectQueryable(false);
                    CallGroupCalls = (from lc in CallSignQ
                                      join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                      join lx in LogCategoryQ2 on lq.LogCategoryId equals lx.LogCategoryId
                                      where new[] { "1", "2", "3", "4", "5", "6", "7", "8", "9" }.Contains(lc.Call.Substring(0, 1))
                                      select new CallGroupCall
                                      {
                                          CallSignID = lc.CallSignId,
                                          Call = lc.Call

                                      }
                                                ).OrderBy(x => x.Call).ToList();
                }
                else
                {
                    var CallSignQ = CallSigns.SelectQueryable(false).Where(c => c.Call.Substring(0, 1) == CallChar);

                    CallGroupCalls = (from lc in CallSignQ
                                      join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                      join lx in LogCategoryQ2 on lq.LogCategoryId equals lx.LogCategoryId

                                      select new CallGroupCall
                                      {
                                          CallSignID = lc.CallSignId,
                                          Call = lc.Call

                                      }
                                                ).OrderBy(x => x.Call).ToList();
                }
            }
            catch (Exception ex)
            {

                // throw;
            }

            DataCalls.CallGroup = CallGroup;
            DataCalls.SelectedCall = SelectedCall;
            DataCalls.Calls = CallGroupCalls;
            CallSignRepository.SetSQLLogging(false);
            return Task.FromResult(DataCalls);
        }


        //both GetCategorizedCalls and GetCategorizedCall2 methoda work.
        //GetCategorizedCalls2 uses the predicate builder along with asExpandable()
        //GetCategorizedCalls uses the Where extensions in DynamicLibrary.cs in the using System.Data.Entity namespace
        public static Task<DataCalls> GetCategorizedCalls2(this IRepository<Log> _LogRepository, LogCategory LogCategory,
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



            CallSignRepository.SetSQLLogging(true);


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



            IQueryFluent<Log> Logs = LogRepository.Query();
            var LogQ1 = Logs
                //                     .Include(x => x.CallSign)
                //.Include(x=>x.LogCategory)
                .SelectQueryable(false).Where(x => x.ContestId == ContestQ.ContestId);

            String LogCategoryPredicate = "true "; //string.Empty;

            if (LogCategory.CatAssistedEnum != (int)CatAssistedEnum.ALL)
            {
                LogCategoryPredicate = string.Format("{0} AND CatAssistedEnum = {1} ", LogCategoryPredicate, LogCategory.CatAssistedEnum);
            }
            if (LogCategory.CatBandEnum != (int)CatBandEnum.ALL)
            {
                LogCategoryPredicate = string.Format("{0} AND CatBandEnum = {1} ", LogCategoryPredicate, LogCategory.CatBandEnum);
            }
            if (LogCategory.CatNoOfTxEnum != (int)CatNoOfTxEnum.ALL)
            {
                LogCategoryPredicate = string.Format("{0} AND CatNoOfTxEnum = {1} ", LogCategoryPredicate, LogCategory.CatNoOfTxEnum);
            }
            if (LogCategory.CatOperatorEnum != (int)CatOperatorEnum.ALL)
            {
                LogCategoryPredicate = string.Format("{0} AND CatOperatorEnum = {1} ", LogCategoryPredicate, LogCategory.CatOperatorEnum);
            }
            if (LogCategory.CatOperatorOverlayEnum != null && LogCategory.CatOperatorOverlayEnum != (int)CatOperatorOverlayEnum.NONE)
            {
                LogCategoryPredicate = string.Format("{0} AND CatOperatorOverlayEnum = {1} ", LogCategoryPredicate, LogCategory.CatOperatorOverlayEnum);
            }
            if (LogCategory.CatPowerEnum != (int)CatPowerEnum.ALL)
            {
                LogCategoryPredicate = string.Format("{0} AND CatPowerEnum = {1} ", LogCategoryPredicate, LogCategory.CatPowerEnum);
            }

            var LogCateoryDBSet = LogCategoryRepository.Queryable();
            var LogCategoryQ2 = LogCateoryDBSet.AsExpandable().Where(LogCategoryPredicate);

            ICollection<CallGroupCall> CallGroupCalls = null;


            try
            {
                if (CallChar == "1")
                {//get all calls beginning with 1 through nine.
                    var CallSignQ = CallSigns.SelectQueryable(false);
                    CallGroupCalls = (from lc in CallSignQ
                                      join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                      join lx in LogCategoryQ2 on lq.LogCategoryId equals lx.LogCategoryId
                                      where new[] { "1", "2", "3", "4", "5", "6", "7", "8", "9" }.Contains(lc.Call.Substring(0, 1))
                                      select new CallGroupCall
                                      {
                                          CallSignID = lc.CallSignId,
                                          Call = lc.Call

                                      }
                                                ).OrderBy(x => x.Call).ToList();
                }
                else
                {
                    var CallSignQ = CallSigns.SelectQueryable(false).Where(c => c.Call.Substring(0, 1) == CallChar);

                    CallGroupCalls = (from lc in CallSignQ
                                      join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                      join lx in LogCategoryQ2 on lq.LogCategoryId equals lx.LogCategoryId

                                      select new CallGroupCall
                                      {
                                          CallSignID = lc.CallSignId,
                                          Call = lc.Call

                                      }
                                                ).OrderBy(x => x.Call).ToList();
                }
                DataCalls.CallGroup = CallGroup;
                DataCalls.SelectedCall = SelectedCall;
                DataCalls.Calls = CallGroupCalls;
                CallSignRepository.SetSQLLogging(false);
            }
            catch (Exception ex)
            {

                // throw;
            }

#if false
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
                        var CallGroupCalls = (from lc in CallSignQ
                                              join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                          where new[] { "1", "2", "3", "4", "5", "6","7", "8", "9" }.Contains(lc.Call.Substring(0, 1) )

                                          select new CallGroupCall
                                          {
                                              CallSignID = lc.CallSignId,
                                              Call = lc.Call

                                          }
                                        ).OrderBy(x => x.Call).ToList();
                       DataCalls.CallGroup = CallGroup;
                       DataCalls.SelectedCall = SelectedCall;
                       DataCalls.Calls = CallGroupCalls;
                    }
                    else
                    {
                      ////  string SQLquery2012 = "   SELECT " +
                      //// "[Project1].[CallSignId] AS [CallSignId], " +
                      ////" [Project1].[Call] AS [Call]  " +
                      //// "FROM ( SELECT  " +
                      ////  "   [Extent1].[CallSignId] AS [CallSignId],  " +
                      ////  "   [Extent1].[Call] AS [Call]  " +
                      ////  "   FROM  [dbo].[CallSign] AS [Extent1]  " +
                      ////  "   INNER JOIN [dbo].[Log] AS [Extent2] ON [Extent1].[CallSignId] = [Extent2].[CallsignId]  " +
                      ////   "  WHERE (([Extent2].[ContestId] = 'CQWWSSB2014' )  AND ((SUBSTRING([Extent1].[Call], 0 + 1, 1)) = 'C' ) )  " +
                      ////" )  AS [Project1]";

                      ////  var CallGroupCalls12 = CallSigns.SqlQuery(SQLquery2012).ToList();;
                      ////  //var CallGroupCalls = CallGroupCalls12.ToList<CallGroupCall>();

                   //ef 6 sql2012
                        //declare @p__linq__0 varchar(50)
                        //set  @p__linq__0  = 'CQWWSSB2014'
                        //declare @p__linq__1 varchar(50)
                        //set  @p__linq__1  = 'C'
                        //SELECT 
                        //    [Project1].[CallSignId] AS [CallSignId], 
                        //    [Project1].[Call] AS [Call]
                        //    FROM ( SELECT 
                        //        [Extent1].[CallSignId] AS [CallSignId], 
                        //        [Extent1].[Call] AS [Call]
                        //        FROM  [dbo].[CallSign] AS [Extent1]
                        //        INNER JOIN [dbo].[Log] AS [Extent2] ON [Extent1].[CallSignId] = [Extent2].[CallsignId]
                        //        WHERE (([Extent2].[ContestId] = @p__linq__0) OR (([Extent2].[ContestId] IS NULL) AND (@p__linq__0 IS NULL))) AND (((SUBSTRING([Extent1].[Call], 0 + 1, 1)) = @p__linq__1) OR ((SUBSTRING([Extent1].[Call], 0 + 1, 1) IS NULL) AND (@p__linq__1 IS NULL)))
                        //    )  AS [Project1]
                        //    ORDER BY [Project1].[Call] ASC

                        var CallGroupCalls = (from lc in CallSignQ
                                               join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                                               where (lc.Call.Substring(0, 1) == CallChar)
                                               //where new[] { CallChar }.Contains(lc.Call.Substring(0, 1))
                                               select new CallGroupCall
                                               {
                                                   CallSignID = lc.CallSignId,
                                                   Call = lc.Call

                                               }
                                        ).OrderBy(x => x.Call).ToList();
                       // var CallGroupCalls = CallGroupCalls1.ToList();

                        ////var CallGroupCalls = (from lc in CallSignQ
                        ////                      join lq in LogQ1 on lc.CallSignId equals lq.CallsignId
                        ////                      //where (lc.Call.Substring(0, 1) == CallChar)
                        ////                      where new[] { CallChar }.Contains(lc.Call.Substring(0, 1))
                        ////                      select new CallGroupCall
                        ////                      {
                        ////                          CallSignID = lc.CallSignId,
                        ////                          Call = lc.Call

                        ////                      }
                        ////                ).OrderBy(x => x.Call).ToList();
                        //var CallGroupCalls = (from lq in LogQ1
                        //                  join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                        //                      where (lc.Call.Substring(0, 1) == CallChar)
                        //                  select new CallGroupCall
                        //                  {
                        //                      CallSignID = lq.CallSign.CallSignId,
                        //                      Call = lq.CallSign.Call

                        //                  }
                        //                ).OrderBy(x => x.Call).ToList();
                        DataCalls.CallGroup = CallGroup;
                        DataCalls.SelectedCall = SelectedCall;
                        DataCalls.Calls = CallGroupCalls;
                        CallSignRepository.SetSQLLogging(false);

                    }


                }
                catch (Exception ex)
                {

                    throw;
                }

#endif


            //tracked
            //log1 = repository.Query(x => x.UserName == Username)
            //    .Include(x => x.Station).Include(x => x.CallSign)
            //    .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
            //    .ToList();

            return Task.FromResult(DataCalls); ;
        }

        public static async Task<ContestInfoDTO> GetContestInfoAsync(this IRepositoryAsync<Log> LogRepository, DataCallInfoDto DataCallInfoDto, string Username)
        {
            return await GetContestInfo(LogRepository, DataCallInfoDto, Username);
        }

        public static Task<ContestInfoDTO> GetContestInfo(this IRepositoryAsync<Log> _LogRepository, DataCallInfoDto DataCallInfoDto, string Username)
        {
            IRepository<Contest> ContestRespository = _LogRepository.GetRepository<Contest>();
            IQueryFluent<Contest> Contests = ContestRespository.Query();
            var ContestQ = Contests.SelectQueryable(false);

            IRepository<ContestType> ContestTypeRespository = _LogRepository.GetRepository<ContestType>();
            IQueryFluent<ContestType> ContestTypes = ContestTypeRespository.Query();
            var ContestTypeQ = ContestTypes.SelectQueryable(false);

            var LogRepository = _LogRepository.GetRepository<Log>();
            IQueryFluent<Log> Logs = LogRepository.Query();
            var LogQ1 = Logs.SelectQueryable(false);

            var LogCategoryRepository = _LogRepository.GetRepository<LogCategory>();
            IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
            var LogCategoryQ1 = LogCategorys.SelectQueryable(false);

            var CallSignRepository = LogRepository.GetRepository<CallSign>();
            IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();
            var CallSignQ = CallSigns.SelectQueryable(true);



            var ContestInfoDTO = (from ll in LogQ1
                                  join lc in ContestQ on ll.ContestId equals lc.ContestId
                                  join lq in ContestTypeQ on lc.ContestTypeEnum equals lq.ContestTypeEnum
                                     join ls in CallSignQ on ll.CallsignId equals ls.CallSignId
                                     join lx in LogCategoryQ1 on ll.LogCategoryId equals lx.LogCategoryId
                                     where lc.ContestName == DataCallInfoDto.SelectedContestName
                                        && ls.Call == DataCallInfoDto.SelectedCall
                                    select new ContestInfoDTO
                                    {
                                        startTime = lc.StartDateTime,
                                        endTime = lc.EndDateTime,
                                        ContestID = lc.ContestId,
                                        ContestType = lq.ContestTypeEnumName,
                                        CallGroup = DataCallInfoDto.CallGroup,
                                        ContestName = lc.ContestName,
                                        CatOperatorEnum = (CatOperatorEnum)lx.CatOperatorEnum,
                                        CatBandEnum = (CatBandEnum)lx.CatBandEnum,
                                        CatAssistedEnum = (CatAssistedEnum)lx.CatAssistedEnum,
                                        CatNoOfTxEnum = (CatNoOfTxEnum)lx.CatNoOfTxEnum,
                                        CatPowerEnum = (CatPowerEnum)lx.CatPowerEnum,
                                        CatOperatorOverlayEnum = (CatOperatorOverlayEnum)lx.CatOperatorOverlayEnum,
                                        Disabled = DataCallInfoDto.Disabled,
                                        QsoDatabaseServerInstance = ll.QsoDatabaseServerInstance,
                                        QsoDatabaseInstance = ll.QsoDatabaseInstance,
                                        QsoDatabaseTableName = ll.QsoDatabaseTableName,
                                        Call = DataCallInfoDto.SelectedCall,
                                        LogId = ll.LogId
                            
                            

                                    }).FirstOrDefault();

            return Task.FromResult( ContestInfoDTO);
        }

        public static async Task<IEnumerable<ChartQsoRateDTO>> GetChartDataTableAsync(this IRepositoryAsync<Log> _LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            return await GetChartDataTable(_LogRepository, ContestViewParmsDTO, Username);
        }

        public static Task<IEnumerable<ChartQsoRateDTO>> GetChartDataTable(this IRepositoryAsync<Log> _LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            IEnumerable<ChartQsoRateDTO> ChartQsoRateDTO;
            var QsoRepository = _LogRepository.GetRepository<Qso>();
           // var QsoRates = QsoRepository.GetSqlQueryResults<ChartQsoRateDTO>(ContestViewParmsDTO.sQSOQuery);
            DbContext DbContext = QsoRepository.GetDbContext() as DbContext;
            ChartQsoRateDTO = DbContext.Database.SqlQuery<ChartQsoRateDTO>(ContestViewParmsDTO.sQSOQuery).ToList();

            //IQueryFluent<Qso> Qsoss = QsoRepository.Query();
            //var QsoQ1 = Qsoss.SqlQuery(ContestViewParmsDTO.sQSOQuery);
            //QsoQ1.
            //var results = Qsoss.ToList();


            return Task.FromResult(ChartQsoRateDTO);
        }


        public static Task<DataCallInfoDto> GetUpdatedDataCallInfoDto(this IRepositoryAsync<Log> _LogRepository, DataCallInfoDto DataCallInfoDto, string Username)
        {
            DataCallInfoDto DataCallInfoDtoResult = null;
            try
            {

                var LogRepository = _LogRepository.GetRepository<Log>();
                IQueryFluent<Log> Logs = LogRepository.Query();
                var LogQ = Logs
                    .Include(x => x.Stations)
                    //.Include(x => x.Contest)
                    .SelectQueryable(true);

                var CallSignRepository = LogRepository.GetRepository<CallSign>();
                IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();
                var CallSignQ = CallSigns.SelectQueryable(true);

                var ContestRepository = LogRepository.GetRepository<Contest>();
                IQueryFluent<Contest> Contestss = ContestRepository.Query();
                var ContestQ = Contestss
                    .SelectQueryable(true).Where(x => x.Active == true);

                var RadioRepository = LogRepository.GetRepository<QsoRadioType>();
                IQueryFluent<QsoRadioType> RadioTypess = RadioRepository.Query();
                var RadioQ = RadioTypess
                    .SelectQueryable(true);



                DataCallInfoDtoResult = (from lq in LogQ
                                    join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                    join ls in ContestQ on lq.ContestId equals ls.ContestId
                                    where lc.Call == DataCallInfoDto.SelectedCall &&
                                        ls.ContestName == DataCallInfoDto.SelectedContestName
                                    select new DataCallInfoDto
                                    {
                                        CallGroup = (CallGroupEnum)DataCallInfoDto.CallGroup,
                                        SelectedContestName = DataCallInfoDto.SelectedContestName,
                                        SelectedCall = DataCallInfoDto.SelectedCall,
                                        SelectedStationName = DataCallInfoDto.SelectedStationName,
                                        QsoRadioType = (QsoRadioTypeEnum)DataCallInfoDto.QsoRadioType,
                                        //Selecct() flattens
                                        //StationNames = lq.Stations.Select(x => x.StationName).ToList(),
                                        StationNames = (from cn in lq.Stations
                                                        select new StationNamestype
                                                        {
                                                            key = cn.LogId,
                                                            value = cn.StationName
                                                        }).ToList(),

                                        LogId = lq.LogId,


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

                                        Disabled = DataCallInfoDto.Disabled
                                    }).FirstOrDefault();

                if (DataCallInfoDtoResult == null)
                {
                    DataCallInfoDtoResult = DataCallInfoDto;
                    DataCallInfoDtoResult.SelectedCall = string.Empty;
                    DataCallInfoDtoResult.StationNames = new Collection<StationNamestype>()
                        {
                            new StationNamestype(0, "ALL")
                        };

                    DataCallInfoDtoResult.RadioNames = new Collection<RadioNamestype>()
                        {
                            new RadioNamestype()
                                                {
                                                    key = (int)QsoRadioTypeEnum.ALL,
                                                    value = "ALL"
                                                }
                    };

                    DataCallInfoDtoResult.QsoRadioType = QsoRadioTypeEnum.ALL;
                    DataCallInfoDtoResult.LogId = -1;
                    DataCallInfoDtoResult.SelectedStationName = "ALL";
                }
                else
                {
                    //add ALL default to Stations
                    StationNamestype StationNamestype = new StationNamestype(0, "ALL");
                    DataCallInfoDtoResult.StationNames.Add(StationNamestype);
                    //var Resuls = item.StationNames.OrderBy(i => i.key == 0 ? 0 : 1).ThenBy(i => i.key).ThenBy(x => x.value);
                    DataCallInfoDtoResult.StationNames = DataCallInfoDtoResult.StationNames.OrderBy(i => i.key).ThenBy(x => x.value).ToList();

                    //fixup radio

                    var LogCategoryRepository = _LogRepository.GetRepository<LogCategory>();
                    IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
                    var LogCategoryQ = LogCategorys
                        .SelectQueryable(true);


                    //Log log  = LogQ.Where(p=>p.LogId ==item.LogId ).FirstOrDefault();
                    //LogCategory LogCategory = LogCategoryQ.Where(p => p.LogCategoryId == log.LogCategoryId).FirstOrDefault();
                    LogCategory LogCategory = (from lc in LogCategoryQ
                                               join ll in LogQ on lc.LogCategoryId equals ll.LogCategoryId
                                               where ll.LogId == DataCallInfoDtoResult.LogId
                                               select lc).FirstOrDefault();
                    CatOperatorEnum CatOperatorEnum;
                    ICollection<RadioNamestype> Validnames = new Collection<RadioNamestype>();
                    List<RadioNamestype> RadioNamelist = DataCallInfoDtoResult.RadioNames.Cast<RadioNamestype>().ToList();

                    Validnames.Add(RadioNamelist.Where(p => p.value == "ALL").FirstOrDefault());

                    if (CatOperatorEnum.TryParse(LogCategory.CatOperatorEnum.ToString(), true, out CatOperatorEnum) == true)
                    {
                        switch (CatOperatorEnum)
                        {
                            case CatOperatorEnum.ALL:
                                break;
                            case CatOperatorEnum.SINGLE_OP:
                                Validnames.Add(RadioNamelist.Where(p => p.value == "Run").FirstOrDefault());
                                Validnames.Add(RadioNamelist.Where(p => p.value == "S_P").FirstOrDefault());
                                break;
                            case CatOperatorEnum.MULTI_OP:
                                if (LogCategory.CatNoOfTxEnum == (int)CatNoOfTxEnum.ONE)
                                {
                                    Validnames.Add(RadioNamelist.Where(p => p.value == "Mult").FirstOrDefault());
                                    Validnames.Add(RadioNamelist.Where(p => p.value == "Run").FirstOrDefault());
                                }
                                else if (LogCategory.CatNoOfTxEnum == (int)CatNoOfTxEnum.TWO)
                                {
                                    Validnames.Add(RadioNamelist.Where(p => p.value == "R1").FirstOrDefault());
                                    Validnames.Add(RadioNamelist.Where(p => p.value == "R2").FirstOrDefault());
                                }
                                else
                                {
                                }
                                break;
                            case CatOperatorEnum.CHECKLOG:
                                break;
                            default:
                                break;
                        }
                        DataCallInfoDtoResult.RadioNames = Validnames;
                    }


                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return Task.FromResult(DataCallInfoDtoResult);
        }

    }


        public class test9
        {
            string key;
            string value;
        };

}
