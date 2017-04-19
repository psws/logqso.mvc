using System;
using System.Collections.Generic;
using System.Linq;
using LinqKit;
using System.Collections;
using System.Data.Entity;
using System.Diagnostics;
using Logqso.mvc.Exceptions;

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
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Data.Common;

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
                                                          value = cn.QsoRadioTypeName,
                                                          disabled = false
                                                      }).ToList(),

                                        Disabled = lc.Disabled
                                    }).OrderBy(x=>x.CallGroup).ToList();

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

                    ICollection<RadioNamestype> Validnames = null;
                    List<RadioNamestype> RadioNamelist = item.RadioNames.Cast<RadioNamestype>().ToList();


                    GetValidRadioNamelist(item.LogId, LogCategory, RadioNamelist, LogRepository, out Validnames);
                    item.RadioNames = Validnames;

                }

#endif

            }
            catch (Exception ex)
            {
                Debug.WriteLine(string.Format("GetDataCallInfoSelections exception {0}", ex.Message));
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
            //string filepath = "chart.png";
            DataTable DataTable = new DataTable();
            return Task.FromResult(DataTable);
        }


        public static async Task<DataCalls> GetCategorizedCallsAsync(this IRepositoryAsync<Log> LogRepository, LogCategory LogCategory,
            string SelectedContestName, string CallChar, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, bool Disabled, string Username)
        {
            return await GetCategorizedCalls(LogRepository, LogCategory, SelectedContestName, CallChar, CallGroup, Disabled, Username);
        }

        //both GetCategorizedCalls and GetCategorizedCall2 methoda work.
        //GetCategorizedCalls2 uses the predicate builder along with asExpandable()
        //GetCategorizedCalls uses the Where extensions in DynamicLibrary.cs in the using System.Data.Entity namespace
        public static Task<DataCalls> GetCategorizedCalls(this IRepositoryAsync<Log> _LogRepository, LogCategory LogCategory,
            string SelectedContestName, string SelectedCall, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, bool Disabled, string Username)
        {
            //The passed in _LogRepository has a DataContext from Dependency resolver
            //The Unit of work DataContext does not match the DataContext of the _Logrespository
            //SOLUTION: use the _LogRepository to get a LogRespositpry with the  UoW DataContext
            //This allows the join below to have all of the expression trees point to the same DBContext.
            //This hook fixes a problem that should not occur,
            var LogRepository = _LogRepository.GetRepository<Log>();

            DataCalls DataCalls = new DataCalls();
            string CallChar = SelectedCall.Substring(0, 1);
       

            if ( (int)CallChar[0] >= 48 && (int)CallChar[0] <= 57)
            {
                CallChar = "1";
            }

            var LogCategoryRepository = LogRepository.GetRepository<LogCategory>();
            IQueryFluent<LogCategory> LogCategorys = LogCategoryRepository.Query();
            var LogCategoryQ = LogCategorys.SelectQueryable(false);

            if (Disabled == false)
            {// business rules
                if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.SINGLE_OP)
                {
                    LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;

                }
                else if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.MULTI_OP)
                {
                    LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                    if (LogCategory.CatNoOfTxEnum != (int)CatNoOfTxEnum.ONE)
                    {
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                    }
                    LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                }
                else if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.CHECKLOG)
                {
                    LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                    LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                    LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                    LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;
                }
                else
                { //all

                }
            }
            else
            {//all disabled
                LogCategory.CatOperatorEnum = (int)CatOperatorEnum.ALL;
                LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;
            }

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
            if ( LogCategory.CatOperatorOverlayEnum != (int)CatOperatorOverlayEnum.NONE)
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

                FunctionException e = new FunctionException("GetCategorizedCallsAsync", ex.InnerException);
                throw e;
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
            string SelectedContestName, string SelectedCall, Logqso.mvc.common.Enum.CallGroupEnum CallGroup, bool Disabled, string Username)
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
            if (Disabled == false)
            {// business rules
                if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.SINGLE_OP)
                {
                    LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;

                }
                else if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.MULTI_OP)
                {
                    LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                    if (LogCategory.CatNoOfTxEnum != (int)CatNoOfTxEnum.ONE)
                    {
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                    }
                    LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                }
                else if (LogCategory.CatOperatorEnum == (int)CatOperatorEnum.CHECKLOG)
                {
                    LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                    LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                    LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                    LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;
                }
                else
                { //all

                }
            }
            else
            {//all disabled
                LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;
            }


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
            if (LogCategory.CatOperatorOverlayEnum != (int)CatOperatorOverlayEnum.NONE)
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
                FunctionException e = new FunctionException("GetCategorizedCalls2()", ex.InnerException);
                throw e;
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

            return Task.FromResult(ContestInfoDTO);
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

            try
            {
                DbContext DbContext = QsoRepository.GetDbContext() as DbContext;
                ChartQsoRateDTO = DbContext.Database.SqlQuery<ChartQsoRateDTO>(ContestViewParmsDTO.sQSOQuery).ToList();
            }
            catch (Exception ex)
            {
                ChartException e = new ChartException()
                {
                    sChartFunction = ContestViewParmsDTO.sChartFunction,
                    sIntvTime = ContestViewParmsDTO.sIntvTime,
                    sQSOQuery = ContestViewParmsDTO.sQSOQuery,
                    sTitle = ContestViewParmsDTO.sTitle,
                    sYAxis = ContestViewParmsDTO.sYAxis,
                    bSum = ContestViewParmsDTO.bSum,
                    MessageTxt = ex.Message,
                    Function = "GetChartDataTableAsync(this IRepositoryAsync<Log> _LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username)"

                };
                throw e;
            }

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
                    //fixup SelectedStationName
                    //StationNamestype = DataCallInfoDtoResult.StationNames.Where(p => p.value == DataCallInfoDtoResult.SelectedStationName).FirstOrDefault();
                    //if (StationNamestype == null)
                    //{
                    //    DataCallInfoDtoResult.SelectedStationName = "ALL";
                    //}

                    // force default ALL wheb Call chabges
                    DataCallInfoDtoResult.SelectedStationName = "ALL";

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

                    ICollection<RadioNamestype> Validnames = null;
                    List<RadioNamestype> RadioNamelist = DataCallInfoDtoResult.RadioNames.Cast<RadioNamestype>().ToList();


                    GetValidRadioNamelist(DataCallInfoDtoResult.LogId, LogCategory, RadioNamelist, LogRepository, out Validnames);
                    
                    DataCallInfoDtoResult.RadioNames = Validnames;
                    RadioNamestype RadioNamestype = DataCallInfoDtoResult.RadioNames.Where(p => p.value == Enum.GetName(typeof(QsoRadioTypeEnum), DataCallInfoDtoResult.QsoRadioType)).FirstOrDefault();
                    if (RadioNamestype == null || RadioNamestype.disabled == true)
                    {
                        DataCallInfoDtoResult.QsoRadioType = QsoRadioTypeEnum.ALL;
                    }



                }
            }
            catch (Exception ex)
            {

                FunctionException e = new FunctionException("GetUpdatedDataCallInfoDto()", ex.InnerException);
                throw e;
            }

            return Task.FromResult(DataCallInfoDtoResult);
        }


        public static async Task<LogPageDTO> GetContestLogsAsync(this IRepositoryAsync<Log> LogRepository, LogCtlDataSettingsDto LogCtlDataSettingsDto, string username)
        {
            return await GetContestLogs(LogRepository, LogCtlDataSettingsDto, username);
        }

        public static Task<LogPageDTO> GetContestLogs(this IRepositoryAsync<Log> _LogRepository, LogCtlDataSettingsDto LogCtlDataSettingsDto, string username)
        {
            LogPageDTO LogPageDTO = new mvc.Dto.LogData.LogPageDTO() {
                    page = LogCtlDataSettingsDto.LogPageRequestDTO.page,
                    records = new List<LogPageRecordDTO>(),
                    rows = 0,
                    total = 0
                };

            var LogRepository = _LogRepository.GetRepository<Log>();
            var CallSignRepository = LogRepository.GetRepository<CallSign>();
            IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();
            var CallSignQ = CallSigns.SelectQueryable(true);

            var QsoRepository = LogRepository.GetRepository<Qso>();
            IQueryFluent<Qso> Qsos = QsoRepository.Query();
            var QsoQ = Qsos.SelectQueryable(true);

            //var UniqueRepository = LogRepository.GetRepository<UbnUnique>();
            //IQueryFluent<UbnUnique> Uniques = UniqueRepository.Query();
            //var UniquesQ = Uniques.SelectQueryable(true);

            //var BadRepository = LogRepository.GetRepository<UbnIncorrectCall>(); //not in log
            //IQueryFluent<UbnIncorrectCall> Bads = BadRepository.Query();
            //var BadQ = Bads.SelectQueryable(true);

            //var NilRepository = LogRepository.GetRepository<UbnNotInLog>(); //not in log
            //IQueryFluent<UbnNotInLog> Nils = NilRepository.Query();
            //var NilQ = Nils.SelectQueryable(true);

            //var DupeRepository = LogRepository.GetRepository<UbnDupe>();
            //IQueryFluent<UbnDupe> Dupes = DupeRepository.Query();
            //var DupesQ = Dupes.SelectQueryable(true);

            //var XchgRepository = LogRepository.GetRepository<UbnIncorrectExchange>();
            //IQueryFluent<UbnIncorrectExchange> Xchngs = XchgRepository.Query();
            //var XchgsQ = Xchngs.SelectQueryable(true);

        //https://msdn.microsoft.com/en-us/data/jj691402.aspx
            DbContext DbContext = QsoRepository.GetDbContext() as DbContext;

            var time = LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisStarttime.Substring(0,5);
            var StartTime = DateTime.Parse("1900-01-01 " + LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisStarttime.Substring(0,5) );

            //int StartDay = int.Parse( LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisStarttime.Substring(11,1) );
            int StartDay = LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisDay;

            int EndDay = 1;
            var EndTime = DateTime.Parse("1900-01-01 " + StartTime.AddHours(double.Parse(LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisDuration)%24).AddMinutes(-1).ToShortTimeString() );
            
            if (StartDay == 1)
            {
                var HoursToEndDay1 = 24 - StartTime.Hour;
                if (int.Parse(LogCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisDuration) > HoursToEndDay1)
                {
                    EndDay = 2;
                }
            }
            else
            {
                EndDay = 2;
            }

            DbCommand command = DbContext.Database.Connection.CreateCommand();
            try
            {
                decimal FreqLow = 0;
                decimal  FreqHigh = 0;
                ContinentEnum ContinentEnum = mvc.common.Enum.ContinentEnum.ALL;
                string Country = string.Empty;
                short Zone = 0;
                string Station= string.Empty;
                QsoRadioTypeEnum Radio = QsoRadioTypeEnum.NONE;

                command.CommandType = CommandType.StoredProcedure;
                //This proc does not work if any of the 3 LogIDs are equal
                //command.CommandText = "[dbo].[CQD_sp_GetContestLogs]";
                command.CommandText = "[dbo].[CQD_sp_GetContestLogsUnion]";
                
                //logid? = -1 if no call selected
                if (LogCtlDataSettingsDto.DataCallInfoDtos[0].Disabled == false)
                {
                    command.AddParameterWithValue("@Logid1", DbType.Int32, LogCtlDataSettingsDto.DataCallInfoDtos[0].LogId);
                    if (LogUtilities.LogGetStation(LogCtlDataSettingsDto.DataCallInfoDtos[0], out Station) == true)
                    {
                        command.AddParameterWithValue("@Station1", DbType.String, Station);
                    }
                    if (LogUtilities.LogGetRadio(LogCtlDataSettingsDto.DataCallInfoDtos[0], out Radio) == true)
                    {
                        command.AddParameterWithValue("@Radio1", DbType.Int32, (Int32)Radio);
                    }
                }
                else
                {
                    command.AddParameterWithValue("@Logid1", DbType.Int32, -1);
                }
                if (LogCtlDataSettingsDto.DataCallInfoDtos[1].Disabled == false)
                {
                    command.AddParameterWithValue("@Logid2", DbType.Int32, LogCtlDataSettingsDto.DataCallInfoDtos[1].LogId);
                    if (LogUtilities.LogGetStation(LogCtlDataSettingsDto.DataCallInfoDtos[1], out Station) == true)
                    {
                        command.AddParameterWithValue("@Station2", DbType.String, Station);
                    }
                    if (LogUtilities.LogGetRadio(LogCtlDataSettingsDto.DataCallInfoDtos[1], out Radio) == true)
                    {
                        command.AddParameterWithValue("@Radio2", DbType.Int32, (Int32)Radio);
                    }
                }
                else
                {
                    command.AddParameterWithValue("@Logid2", DbType.Int32, -1);
                }
                if (LogCtlDataSettingsDto.DataCallInfoDtos[2].Disabled == false)
                {
                    command.AddParameterWithValue("@Logid3", DbType.Int32, LogCtlDataSettingsDto.DataCallInfoDtos[2].LogId);
                    if (LogUtilities.LogGetStation(LogCtlDataSettingsDto.DataCallInfoDtos[2], out Station) == true)
                    {
                        command.AddParameterWithValue("@Station3", DbType.String, Station);
                    }
                    if (LogUtilities.LogGetRadio(LogCtlDataSettingsDto.DataCallInfoDtos[2], out Radio) == true)
                    {
                        command.AddParameterWithValue("@Radio3", DbType.Int32, (Int32)Radio);
                    }
                }
                else
                {
                    command.AddParameterWithValue("@Logid3", DbType.Int32, -1);
                }

                command.AddParameterWithValue("@StartDay", DbType.Int32, StartDay);
                command.AddParameterWithValue("@EndDay", DbType.Int32, EndDay);
                command.AddParameterWithValue("@StartTime", DbType.DateTime, StartTime);
                command.AddParameterWithValue("@EndTime", DbType.DateTime, EndTime);
                if (LogCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto.Disabled == false)
                {

                    if (LogUtilities.LogGetFrequencyRange(LogCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto, out FreqLow, out FreqHigh) == true)
                    {
                        command.AddParameterWithValue("@FreqLow", DbType.Decimal, FreqLow);
                        command.AddParameterWithValue("@FreqHigh", DbType.Decimal, FreqHigh);
                    }
                    if (LogUtilities.LogGetContinent(LogCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto, out ContinentEnum) == true)
                    {
                        command.AddParameterWithValue("@ContinentEnum", DbType.Int32, (Int32)ContinentEnum);
                    }
                    if (LogUtilities.LogGetCountry(LogCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto, out Country) == true)
                    {
                        command.AddParameterWithValue("@Country", DbType.String, Country);
                    }
                    if (LogUtilities.LogGetZone(LogCtlDataSettingsDto.DataCallInfoDtos, LogCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto, out Zone) == true)
                    {
                        command.AddParameterWithValue("@Zone", DbType.UInt16, Zone);
                    }
                }

            }
            catch (Exception ex)
            {
                FunctionException e = new FunctionException("GetContestLogs()", ex.InnerException);
                throw e;
            } 



            //command.CommandText = string.Format("EXEC [dbo].[CQD_sp_GetContestLogs] @Logid1 = {0}, @Logid2 = {1}, @Logid3 = {2}, "
            //    + " @StartDay = {3} , @EndDay = {4} , @StartTime = {5}, @Endtime = {6}",
            //    LogCtlDataSettingsDto.DataCallInfoDtos[0].LogId,
            //    LogCtlDataSettingsDto.DataCallInfoDtos[1].LogId,
            //    LogCtlDataSettingsDto.DataCallInfoDtos[2].LogId,
            //    StartDay, EndDay,
            //    StartTime.ToString("yyyy-mm-dd HH:mm"), EndTime.ToString("yyyy-mm-dd HH:mm")
            //    );
           //append Log filter, SQl defaults null if not specified
                 //@FreqLow decimal,
                 //@FreqHigh decimal,
                 //@ContinentEnum int,
                 //@Country varchar(10),
                 //@Zone smallint,
            //Append Log X-Axus
                 //@StartTime datetime,

                 //@Endtime datetime

            List<LogPageRecord> LogPageRecords;
            List<LogPageUBNRecord> LogPageUniqueRecords;
            List<LogPageUBNRecord> LogPageNilRecords;
            List<LogPageUBNRecord> LogPageDupeRecords;
            List<LogPageUbnIncorrectCallRecord> LogPageUbnIncorrectCallRecords;
            List<LogPageUbnIncorrectExchangeRecord> LogPageUbnIncorrectExchangeRecords;
            try
            {
                DbContext.Database.Connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    LogPageRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageRecord>(reader)
                            .ToList(); // all ubndx data is included

                    reader.NextResult();

                    LogPageUniqueRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageUBNRecord>(reader)
                            .ToList();

                    reader.NextResult();

                    LogPageNilRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageUBNRecord>(reader)
                            .ToList();

                    reader.NextResult();

                    LogPageDupeRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageUBNRecord>(reader)
                            .ToList();

                    reader.NextResult();

                    LogPageUbnIncorrectCallRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageUbnIncorrectCallRecord>(reader)
                            .ToList();

                    reader.NextResult();

                    LogPageUbnIncorrectExchangeRecords =
                        ((IObjectContextAdapter)DbContext)
                            .ObjectContext
                            .Translate<LogPageUbnIncorrectExchangeRecord>(reader)
                            .ToList();

                    int DaysInContest = 2;
                    int weekday = 1;
                    int index = 0;
                    int DayIndex = 0;

                    LogPageDTO.I1Cnt = LogPageRecords.Where(x => x.CGroup == 1).Count();
                    LogPageDTO.I2Cnt = LogPageRecords.Where(x => x.CGroup == 2).Count();
                    LogPageDTO.I3Cnt = LogPageRecords.Where(x => x.CGroup == 3).Count();


                    for (int d = 1; d <= DaysInContest; d++, weekday++)
                    {
                        index = 0;
                        //LogPageRecords = LogPageRecords.Where(x => x.W == day).OrderBy(x => x.Time).ToList();
                        int size = LogPageRecords.Where(x => x.W == weekday).Count();

                        while (size != 0 && index < size)
                        {
                            DateTime DateTimeCur = LogPageRecords.ElementAt(DayIndex).Time;
                            byte  Day = (byte)LogPageRecords.ElementAt(DayIndex).W;
                            int CGroupCur;
                            List<LogPageRecord> LogPageRecordsCur = LogPageRecords.Where(x => x.W == weekday && x.Time == DateTimeCur)
                                .OrderBy(x => x.Time)
                                //.OrderBy(x => x.W).ThenBy(x => x.Time.Hour).ThenBy(x => x.Time.Minute)
                                //.OrderBy(x => x.W).ThenBy(x => DbFunctions.CreateTime(x.Time.Hour, x.Time.Minute, x.Time.Second) )
                                .ToList();
                            index += LogPageRecordsCur.Count;
                            DayIndex += LogPageRecordsCur.Count;
                           // LogPageRecord LogPageRecord1;
                            LogPageRecord LogPageRecord2;
                            LogPageRecord LogPageRecord3;

                            List<LogPageRecord> LogPageRecords1 = LogPageRecordsCur.Where(x => x.CGroup == 1).ToList();
                            List<LogPageRecord> LogPageRecords2 = LogPageRecordsCur.Where(x => x.CGroup == 2).ToList();
                            List<LogPageRecord> LogPageRecords3 = LogPageRecordsCur.Where(x => x.CGroup == 3).ToList();

                            int LogPageRecords1Count = LogPageRecords1.Count;
                            int LogPageRecords2Count = LogPageRecords2.Count;
                            int LogPageRecords3Count = LogPageRecords3.Count;
                            int LogPageRecords1Index = -1;
                            int LogPageRecords2Index = -1;
                            int LogPageRecords3Index = -1;

                            //fill in LogPageDTO


                            while (LogPageRecords1Count != 0 || LogPageRecords2Count != 0 || LogPageRecords3Count != 0)
                            {
                                LogPageRecord LogPageRecord = LogPageRecordsCur.FirstOrDefault();
                                CGroupCur = LogPageRecord.CGroup;


                                LogPageRecordDTO LogPageRecordDTO = new LogPageRecordDTO()
                                {
                                    T = DateTimeCur.ToString("HH:mm"),
                                    W = Day
                                };
        //if  (LogPageRecord.Call == "PJ2T")
        //{


        //}

                                if (CGroupCur == 1)
                                {
                                    LogPageRecordDTO.I1 = LogPageRecord.Call;
                                    LogPageRecordDTO.F1 = (LogPageRecord.Freq == 0) ? string.Empty : LogPageRecord.Freq.ToString("0.#");
                                    LogPageRecordDTO.C1 = LogPageRecord.C;
                                    LogPageRecordDTO.Z1 = LogPageRecord.Z;
                                    LogPageRecordDTO.P1 = LogPageRecord.P;
                                    LogPageRecordDTO.U1 = LogPageRecord.U;
                                    LogPageRecordDTO.B1 = LogPageRecord.B;
                                    LogPageRecordDTO.BC1 = LogPageRecord.BC;
                                    LogPageRecordDTO.N1 = LogPageRecord.N;
                                    LogPageRecordDTO.D1 = LogPageRecord.D;
                                    LogPageRecordDTO.X1 = LogPageRecord.X;
                                    LogPageRecordDTO.XC1 = LogPageRecord.XC;
                                    LogPageRecordDTO.R1 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord.R);
                                    LogPageRecordDTO.S1 = LogPageRecord.S;

                                    LogPageRecords1Index = (LogPageRecords1Index == -1) ? 0 : LogPageRecords1Index;
                                    LogPageRecords1Index++;
                                    LogPageRecords1Count--;
                                    //remove from list
                                    LogPageRecordsCur.Remove(LogPageRecord);

                                    if (LogPageRecords2Count > 0)
                                    {
                                        LogPageRecords2Index = (LogPageRecords2Index == -1) ? 0 : LogPageRecords2Index;
                                        LogPageRecord2 = LogPageRecords2.ElementAt(LogPageRecords2Index);
                                        LogPageRecordDTO.I2 = LogPageRecord2.Call;
                                        LogPageRecordDTO.F2 = (LogPageRecord2.Freq == 0) ? string.Empty : LogPageRecord2.Freq.ToString("0.#");
                                        LogPageRecordDTO.C2 = LogPageRecord2.C;
                                        LogPageRecordDTO.Z2 = LogPageRecord2.Z;
                                        LogPageRecordDTO.P2 = LogPageRecord2.P;
                                        LogPageRecordDTO.U2 = LogPageRecord2.U;
                                        LogPageRecordDTO.B2 = LogPageRecord2.B;
                                        LogPageRecordDTO.BC2 = LogPageRecord2.BC;
                                        LogPageRecordDTO.N2 = LogPageRecord2.N;
                                        LogPageRecordDTO.D2 = LogPageRecord2.D;
                                        LogPageRecordDTO.X2 = LogPageRecord2.X;
                                        LogPageRecordDTO.XC2 = LogPageRecord2.XC;
                                        LogPageRecordDTO.R2 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord2.R);
                                        LogPageRecordDTO.S2 = LogPageRecord2.S;

                                        LogPageRecords2Index++;
                                        LogPageRecords2Count--;
                                        LogPageRecordsCur.Remove(LogPageRecord2);

                                    }
                                    if (LogPageRecords3Count > 0)
                                    {
                                        LogPageRecords3Index = (LogPageRecords3Index == -1) ? 0 : LogPageRecords3Index;
                                        LogPageRecord3 = LogPageRecords3.ElementAt(LogPageRecords3Index);
                                        LogPageRecordDTO.I3 = LogPageRecord3.Call;
                                        LogPageRecordDTO.F3 = (LogPageRecord3.Freq == 0) ? string.Empty : LogPageRecord3.Freq.ToString("0.#");
                                        LogPageRecordDTO.C3 = LogPageRecord3.C;
                                        LogPageRecordDTO.Z3 = LogPageRecord3.Z;
                                        LogPageRecordDTO.P3 = LogPageRecord3.P;
                                        LogPageRecordDTO.U3 = LogPageRecord3.U;
                                        LogPageRecordDTO.B3 = LogPageRecord3.B;
                                        LogPageRecordDTO.BC3 = LogPageRecord3.BC;
                                        LogPageRecordDTO.N3 = LogPageRecord3.N;
                                        LogPageRecordDTO.D3 = LogPageRecord3.D;
                                        LogPageRecordDTO.X3 = LogPageRecord3.X;
                                        LogPageRecordDTO.XC3 = LogPageRecord3.XC;
                                        LogPageRecordDTO.R3 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord3.R);
                                        LogPageRecordDTO.S3 = LogPageRecord3.S;

                                        LogPageRecords3Index++;
                                        LogPageRecords3Count--;
                                        LogPageRecordsCur.Remove(LogPageRecord3);
                                    }
                                }
                                else if (CGroupCur == 2)
                                {
                                    LogPageRecordDTO.I2 = LogPageRecord.Call;
                                    LogPageRecordDTO.F2 = (LogPageRecord.Freq == 0) ? string.Empty : LogPageRecord.Freq.ToString("0.#");
                                    LogPageRecords2Index = (LogPageRecords2Index == -1) ? 0 : LogPageRecords2Index;
                                    LogPageRecordDTO.C2 = LogPageRecord.C;
                                    LogPageRecordDTO.Z2 = LogPageRecord.Z;
                                    LogPageRecordDTO.P2 = LogPageRecord.P;
                                    LogPageRecordDTO.U2 = LogPageRecord.U;
                                    LogPageRecordDTO.B2 = LogPageRecord.B;
                                    LogPageRecordDTO.BC2 = LogPageRecord.BC;
                                    LogPageRecordDTO.N2 = LogPageRecord.N;
                                    LogPageRecordDTO.D2 = LogPageRecord.D;
                                    LogPageRecordDTO.X2 = LogPageRecord.X;
                                    LogPageRecordDTO.XC2 = LogPageRecord.XC;
                                    LogPageRecordDTO.R2 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord.R);
                                    LogPageRecordDTO.S2 = LogPageRecord.S;

                                    LogPageRecords2Index++;
                                    LogPageRecords2Count--;
                                    LogPageRecordsCur.Remove(LogPageRecord);
                                    if (LogPageRecords3Count > 0)
                                    {
                                        LogPageRecords3Index = (LogPageRecords3Index == -1) ? 0 : LogPageRecords3Index;
                                        LogPageRecord3 = LogPageRecords3.ElementAt(LogPageRecords3Index);
                                        LogPageRecordDTO.I3 = LogPageRecord3.Call;
                                        LogPageRecordDTO.F3 = (LogPageRecord3.Freq == 0) ? string.Empty : LogPageRecord3.Freq.ToString("0.#");
                                        LogPageRecordDTO.C3 = LogPageRecord3.C;
                                        LogPageRecordDTO.Z3 = LogPageRecord3.Z;
                                        LogPageRecordDTO.P3 = LogPageRecord3.P;
                                        LogPageRecordDTO.U3 = LogPageRecord3.U;
                                        LogPageRecordDTO.B3 = LogPageRecord3.B;
                                        LogPageRecordDTO.BC3 = LogPageRecord3.BC;
                                        LogPageRecordDTO.N3 = LogPageRecord3.N;
                                        LogPageRecordDTO.D3 = LogPageRecord3.D;
                                        LogPageRecordDTO.X3 = LogPageRecord3.X;
                                        LogPageRecordDTO.XC3 = LogPageRecord3.XC;
                                        LogPageRecordDTO.R3 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord3.R);
                                        LogPageRecordDTO.S3 = LogPageRecord3.S;
                                     
                                        LogPageRecords3Index++;
                                        LogPageRecords3Count--;
                                        LogPageRecordsCur.Remove(LogPageRecord3);
                                    }
                                }
                                else if (CGroupCur == 3)
                                {
                                    LogPageRecordDTO.I3 = LogPageRecord.Call;
                                    LogPageRecordDTO.F3 = (LogPageRecord.Freq == 0) ? string.Empty : LogPageRecord.Freq.ToString("0.#");
                                    LogPageRecords3Index = (LogPageRecords3Index == -1) ? 0 : LogPageRecords3Index;
                                    LogPageRecordDTO.U3 = LogPageRecord.U;
                                    LogPageRecordDTO.C3 = LogPageRecord.C;
                                    LogPageRecordDTO.Z3 = LogPageRecord.Z;
                                    LogPageRecordDTO.P3 = LogPageRecord.P;
                                    LogPageRecordDTO.B3 = LogPageRecord.B;
                                    LogPageRecordDTO.BC3 = LogPageRecord.BC;
                                    LogPageRecordDTO.N3 = LogPageRecord.N;
                                    LogPageRecordDTO.D3 = LogPageRecord.D;
                                    LogPageRecordDTO.X3 = LogPageRecord.X;
                                    LogPageRecordDTO.XC3 = LogPageRecord.XC;
                                    LogPageRecordDTO.R3 = Enum.GetName(typeof(QsoRadioTypeEnum), LogPageRecord.R);
                                    LogPageRecordDTO.S3 = LogPageRecord.S;

                                    LogPageRecords3Index++;
                                    LogPageRecords3Count--;
                                    LogPageRecordsCur.Remove(LogPageRecord);
                                }

                                LogPageDTO.records.Add(LogPageRecordDTO);
                            }
                        }
                    }
		 

                }

            }
            catch (Exception ex)
            {

                FunctionException e = new FunctionException("GetContestLogs()_2", ex.InnerException);
                throw e;
            }
            finally
            {
                DbContext.Database.Connection.Close();
            }



#if false
            LogPageDTO = new mvc.Dto.LogData.LogPageDTO()
             {
             };

            try
            {
                var logid1 = LogCtlDataSettingsDto.DataCallInfoDtos[0].LogId;
                var logid2 = LogCtlDataSettingsDto.DataCallInfoDtos[1].LogId;
                var logid3 = LogCtlDataSettingsDto.DataCallInfoDtos[2].LogId;
                var LogPageRecordDTO = (from lqq in QsoQ
                                        select new 
                                       {
                                            Call1 = (from lq in QsoQ
                                                join lc in CallSignQ on lqq.CallsignId equals lc.CallSignId
                                                where lq.LogId == logid1
                                                select new LogPageRecord
                                                   {
                                                       logId = lq.LogId,
                                                       QsoDateTime = lq.QsoDateTime,
                                                       QsoNo = lq.QsoNo,
                                                       Call = lc.Call,
                                                       Freq = (short)lq.Frequency,
                                                       C = lq.QCtyMult,
                                                       Z = lq.QZoneMult,
                                                       P = lq.QPrefixMult,
                                                       //U = luq.QsoNo == lq1.QsoNo,
                                                       //B = lb.QsoNo == lq.QsoNo || lx.QsoNo == lq.QsoNo,
                                                       //N = ln.QsoNo == lq.QsoNo,
                                                       //D = ld.QsoNo == lq.QsoNo,
                                                       //X = lx.QsoNo == lq.QsoNo,
                                                       R = lq.QsoRadioTypeEnum,
                                                       S = lq.StationName
                                                   })//,
                                             //Call2 = (from lq in QsoQ
                                             //   join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                             //   where lq.LogId == logid2
                                             //   select new LogPageRecord
                                             //      {
                                             //          QsoDateTime = lq.QsoDateTime,
                                             //          QsoNo = lq.QsoNo,
                                             //          Call = lc.Call,
                                             //          Freq = (short)lq.Frequency,
                                             //          C = lq.QCtyMult,
                                             //          Z = lq.QZoneMult,
                                             //          P = lq.QPrefixMult,
                                             //          //U = luq.QsoNo == lq1.QsoNo,
                                             //          //B = lb.QsoNo == lq.QsoNo || lx.QsoNo == lq.QsoNo,
                                             //          //N = ln.QsoNo == lq.QsoNo,
                                             //          //D = ld.QsoNo == lq.QsoNo,
                                             //          //X = lx.QsoNo == lq.QsoNo,
                                             //          R = lq.QsoRadioTypeEnum,
                                             //          S = lq.StationName
                                             //      }),
                                             //Call3 = (from lq in QsoQ
                                             //   join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                             //   where lq.LogId == logid3
                                             //   select new LogPageRecord
                                             //      {
                                             //          QsoDateTime = lq.QsoDateTime,
                                             //          QsoNo = lq.QsoNo,
                                             //          Call = lc.Call,
                                             //          Freq = (short)lq.Frequency,
                                             //          C = lq.QCtyMult,
                                             //          Z = lq.QZoneMult,
                                             //          P = lq.QPrefixMult,
                                             //          //U = luq.QsoNo == lq1.QsoNo,
                                             //          //B = lb.QsoNo == lq.QsoNo || lx.QsoNo == lq.QsoNo,
                                             //          //N = ln.QsoNo == lq.QsoNo,
                                             //          //D = ld.QsoNo == lq.QsoNo,
                                             //          //X = lx.QsoNo == lq.QsoNo,
                                             //          R = lq.QsoRadioTypeEnum,
                                             //          S = lq.StationName
                                             //      }),


                                       }).ToList();


                //var Call1 = (from lq in QsoQ
                //            join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                //            where lq.LogId == logid
                //            select new LogPageRecord
                //               {
                //                   Call = lc.Call,
                //                   Freq = (short)lq.Frequency,
                //                   C = lq.QCtyMult,
                //                   Z = lq.QZoneMult,
                //                   P = lq.QPrefixMult,
                //                   //U = luq.QsoNo == lq1.QsoNo,
                //                   //B = lb.QsoNo == lq.QsoNo || lx.QsoNo == lq.QsoNo,
                //                   //N = ln.QsoNo == lq.QsoNo,
                //                   //D = ld.QsoNo == lq.QsoNo,
                //                   //X = lx.QsoNo == lq.QsoNo,
                //                   R = lq.QsoRadioTypeEnum,
                //                   S = lq.StationName
                //               }).ToList(),

                //var t3 = temp3.ToList();



             //   var temp = from lq in QsoQ
             //                 .Where(x => x.LogId == logid)
             //              from lu in UniquesQ
             //                      .Where(x => x.QsoNo == lq.QsoNo)  
             //                      .Where(x => x.LogId == lq.LogId)
             //              //.DefaultIfEmpty()
             //              select lu into luq

             //              //join lu in UniquesQ on lq.LogId equals lu.LogId
             //              from lq1 in QsoQ
             //.Where(x => x.LogId == logid).OrderBy(x => x.QsoDateTime).ThenBy(x => x.QsoNo)
             //              from lc in CallSignQ
             //           .Where(x => x.CallSignId == lq1.CallsignId)
             //              select new LogPageRecord
             //                 {
             //                    QsoDateTime = lq1.QsoDateTime,
             //                     QsoNo = lq1.QsoNo,
             //                     Call = lc.Call,
             //                     Freq = (short)lq1.Frequency,
             //                     C = lq1.QCtyMult,
             //                     Z = lq1.QZoneMult,
             //                     P = lq1.QPrefixMult,
             //                     U = luq.QsoNo == lq1.QsoNo,
             //                     //B = lb.QsoNo == lq.QsoNo || lx.QsoNo == lq.QsoNo,
             //                     //N = ln.QsoNo == lq.QsoNo,
             //                     //D = ld.QsoNo == lq.QsoNo,
             //                     //X = lx.QsoNo == lq.QsoNo,
             //                     R = lq1.QsoRadioTypeEnum,
             //                     S = lq1.StationName
             //                 };
             //   var t = temp.ToList();

                //var temp = from lq in QsoQ
                //              .Where(x => x.LogId == logid) 
                //              select lq into lqq
                //           from lu in UniquesQ
                //               .Where(x => x.QsoNo == lqq.QsoNo)
                //               .Where(x => x.LogId == lqq.LogId)
                //           //select lu into luq

                //           from lb in BadQ
                //           .Where(x => x.QsoNo == lqq.QsoNo)
                //           .Where(y => y.LogId == lqq.LogId)
                //           //select lb into lbq
                //           select lu into luq


                //           //.DefaultIfEmpty()
                //           //from lq in QsoQ
                //           //   .Where(x => x.LogId == logid)
                //           //from lb in BadQ
                //           //.Where(x => x.QsoNo == lq.QsoNo)
                //           //.Where(y => y.LogId == lq.LogId)
                //           //select lb into lbq

                //           //join lu in UniquesQ on lq.LogId equals lu.LogId
                //           from lq1 in QsoQ
                //             .Where(x => x.LogId == logid).OrderBy(x => x.QsoDateTime).ThenBy(x => x.QsoNo)
                //           from lc in CallSignQ
                //        .Where(x => x.CallSignId == lq1.CallsignId)
                //           select new LogPageRecord
                //              {
                //                  QsoDateTime = lq1.QsoDateTime,
                //                  QsoNo = lq1.QsoNo,
                //                  Cal1 = lc.Call,
                //                  Freq = (short)lq1.Frequency,
                //                  C = lq1.QCtyMult,
                //                  Z = lq1.QZoneMult,
                //                  P = lq1.QPrefixMult,
                //                  U = luq.QsoNo == lq1.QsoNo,
                //                  //B = lb.QsoNo == lq1.QsoNo ,//|| lx.QsoNo == lq.QsoNo,
                //                  //N = ln.QsoNo == lq.QsoNo,
                //                  //D = ld.QsoNo == lq.QsoNo,
                //                  //X = lx.QsoNo == lq.QsoNo,
                //                  R = lq1.QsoRadioTypeEnum,
                //                  S = lq1.StationName
                //              };
                //List<LogPageRecord> LogPageRecords1 = temp.ToList();
            }
            catch (Exception ex)
            {

                throw;
            }

#endif


            return Task.FromResult(LogPageDTO);
        }


        public static void GetValidRadioNamelist(int Logid, LogCategory LogCategory, IList<RadioNamestype> RadioNamelist, IRepository<Log> _LogRepository, out ICollection<RadioNamestype> Validnames)
        {
            Validnames = new Collection<RadioNamestype>();
            Validnames.Add(RadioNamelist.Where(p => p.value == "ALL").FirstOrDefault());

            CatOperatorEnum CatOperatorEnum = mvc.common.Enum.CatOperatorEnum.ALL;

            if (CatOperatorEnum.TryParse(LogCategory.CatOperatorEnum.ToString(), true, out CatOperatorEnum) == true)
            {
                switch (CatOperatorEnum)
                {
                    case CatOperatorEnum.ALL:
                        break;
                    case CatOperatorEnum.SINGLE_OP:
                        //Validnames.Add(RadioNamelist.Where(p => p.value == "Run").FirstOrDefault());
                        //Validnames.Add(RadioNamelist.Where(p => p.value == "S_P").FirstOrDefault());
                        //if log has any QsoRadioTypeEnum.None, then logging program specifies no radio type QsoRadioTypeEnum.NONE
                        IQueryFluent<Log> Logs = _LogRepository.Query();
                        var LogQ1 = Logs
                        .SelectQueryable(false).Where(x => x.LogId == Logid);

                        IRepository<Qso> _QsoRepository = _LogRepository.GetRepository<Qso>();
                        IQueryFluent<Qso> Qsos = _QsoRepository.Query();
                        var QsoQ = Qsos.SelectQueryable(true);
                        var NONETypes = (from ll in LogQ1
                                         join lq in QsoQ on ll.LogId equals lq.LogId
                                        where lq.QsoRadioTypeEnum == (int)QsoRadioTypeEnum.NONE
                                        select new {
                                           lq.QsoRadioTypeEnum
                                        }).FirstOrDefault();


                        foreach (var itemRadio in RadioNamelist)
                        {
                            if (itemRadio.value == "Run"  || itemRadio.value == "S_P"  )
                            {
                                if (NONETypes != null)
                                {// if 1 NONE typr exists then all Qsosin log are NONE
                                    itemRadio.disabled = true;
                                }
                                Validnames.Add(itemRadio);
                            }
                        }
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
            }

        }

        public static  async Task<List<Qso>> GetQsoRangeListAsync(this IRepositoryAsync<Log> _LogRepository, int Logid, short StartQsoNo, short EndQsoNo)
        {
            return await GetQsoRangeList(_LogRepository, Logid, StartQsoNo, EndQsoNo);
        }
        public static  Task<List<Qso>> GetQsoRangeList(this IRepositoryAsync<Log> _LogRepository, int Logid, short StartQsoNo, short EndQsoNo)
        {
            List<Qso> QsoResults = null;

            IRepository<Qso> _QsoRepository = _LogRepository.GetRepository<Qso>();
            IQueryFluent<Qso> Qsos = _QsoRepository.Query();
            var QsoQ = Qsos.Include(x => x.CallSign)
                        .SelectQueryable(true)
                        .OrderBy(t => t.QsoNo);

             QsoResults =  (from lq in QsoQ
                             where lq.LogId == Logid &&
                             lq.QsoNo >= StartQsoNo && lq.QsoNo <= EndQsoNo
                             select lq
                             ).ToList();
             return Task.FromResult(QsoResults);
        }

        public static async Task<QsoInfoDto> GetQsoInfoAsync(this IRepositoryAsync<Log> LogRepository, QsoInfoRequestDto QsoInfoRequestDto, string username)
        {
            return await GetQsoInfo(LogRepository, QsoInfoRequestDto, username);
        }

        public static Task<QsoInfoDto> GetQsoInfo(this IRepositoryAsync<Log> _LogRepository, QsoInfoRequestDto QsoInfoRequestDto, string username)
        {
            QsoInfoDto QsoInfoDtoResult = null;
            var LogRepository = _LogRepository.GetRepository<Log>();
            IQueryFluent<Log> Logs = LogRepository.Query();
            var LogQ = Logs.SelectQueryable(true);

            var CallSignRepository = LogRepository.GetRepository<CallSign>();
            IQueryFluent<CallSign> CallSigns = CallSignRepository.Query();
            var CallSignQ = CallSigns.SelectQueryable(true);

            var ContestRepository = LogRepository.GetRepository<Contest>();
            IQueryFluent<Contest> Contests = ContestRepository.Query();
            var ContestQ = Contests.SelectQueryable(true);

            var QsoRepository = LogRepository.GetRepository<Qso>();
            IQueryFluent<Qso> Qsos = QsoRepository.Query();
            var QsoQ = Qsos.SelectQueryable(true);

            var UniqueRepository = LogRepository.GetRepository<UbnUnique>();
            IQueryFluent<UbnUnique> Uniques = UniqueRepository.Query();
            var UniquesQ = Uniques.SelectQueryable(true);

            var BadRepository = LogRepository.GetRepository<UbnIncorrectCall>(); //not in log
            IQueryFluent<UbnIncorrectCall> Bads = BadRepository.Query();
            var BadQ = Bads.SelectQueryable(true);

            var NilRepository = LogRepository.GetRepository<UbnNotInLog>(); //not in log
            IQueryFluent<UbnNotInLog> Nils = NilRepository.Query();
            var NilQ = Nils.SelectQueryable(true);

            var DupeRepository = LogRepository.GetRepository<UbnDupe>();
            IQueryFluent<UbnDupe> Dupes = DupeRepository.Query();
            var DupesQ = Dupes.SelectQueryable(true);

            var XchgRepository = LogRepository.GetRepository<UbnIncorrectExchange>();
            IQueryFluent<UbnIncorrectExchange> Xchngs = XchgRepository.Query();
            var XchgsQ = Xchngs.SelectQueryable(true);


            var Contest = (from lt in ContestQ
                           where lt.ContestName == QsoInfoRequestDto.DataCallInfoDto.SelectedContestName
                           select lt
                           ).FirstOrDefault();

            int  Day = QsoInfoRequestDto.QsoInfoRequest.Day - 1;
            //string y = QsoInfoRequestDto.QsoInfoRequest.Time.ToString("HH:mm");
            TimeSpan ts = TimeSpan.Parse(QsoInfoRequestDto.QsoInfoRequest.Time);
            TimeSpan tsDay = new TimeSpan(Day,0,0,0);
            ts  += tsDay;
            //DateTime df = DateTime.Parse("2002-10-26 00:00:01.000");
            TimeSpan tsEnd = new TimeSpan(0,0,0,59,999);

            DateTime startdt = Contest.StartDateTime + ts;
            DateTime enddt = Contest.StartDateTime + ts.Add(tsEnd);


            //TimeSpan ts = TimeSpan.Parse(QsoInfoRequestDto.QsoInfoRequest.Time.ToString("HH:mm"));

            try
            {

                QsoInfoDtoResult = (from lq in QsoQ
                                    join lc in CallSignQ on lq.CallsignId equals lc.CallSignId
                                join ll in LogQ on lq.LogId equals ll.LogId
                                join lt in ContestQ on ll.ContestId equals lt.ContestId
                                    where lc.Call == QsoInfoRequestDto.QsoInfoRequest.Call
                                        && lq.QsoDateTime >= startdt && lq.QsoDateTime <= enddt
                                        && lq.LogId == QsoInfoRequestDto.DataCallInfoDto.LogId
                                    select new QsoInfoDto
                                    {
                                        W = QsoInfoRequestDto.QsoInfoRequest.Day,
                                        T = QsoInfoRequestDto.QsoInfoRequest.Time,
                                        I = lc.Call,
                                        F = lq.Frequency,
                                        XR = (short)lq.QsoExchangeNumber,
                                        C = lq.QCtyMult,
                                        Z = lq.QZoneMult,
                                        P = lq.QPrefixMult,
                                        R = lq.QsoRadioType.QsoRadioTypeName,
                                        S = lq.StationName,
                                        U = (from cu in UniquesQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu).Any(),
                                        B = (from cu in BadQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu).Any(),
                                    BC = (from cu in BadQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu.CorrectCall).FirstOrDefault(),
                                    N = (from cu in NilQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu).Any(),
                                    D = (from cu in DupesQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu).Any(),
                                    X = (from cu in XchgsQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu).Any(),

                                    XC = (from cu in XchgsQ
                                                        where(lq.QsoNo == cu.QsoNo && lq.LogId == cu.LogId)
                                                        select cu.CorrectExchange).FirstOrDefault(),
                                }).FirstOrDefault();
            }
            catch (Exception ex )
            {

                FunctionException e = new FunctionException("GetQsoInfo()", ex.InnerException);
                throw e;
            }
            //fixup time
            return Task.FromResult(QsoInfoDtoResult);


        }


        public static async Task<bool> UpdateQsoStationsAsync(this IRepositoryAsync<Log> _LogRepository, QsoUpdateStationNamesDTOCollection QsoUpdateStationNamesDTOCollection)
        {
            return await UpdateQsoStations(_LogRepository, QsoUpdateStationNamesDTOCollection);
        }
        public static Task<bool> UpdateQsoStations(this IRepositoryAsync<Log> _LogRepository, QsoUpdateStationNamesDTOCollection QsoUpdateStationNamesDTOCollection)
        {
            bool results = true;
            DbContext DbContext = _LogRepository.GetDbContext() as DbContext;

            // .Net will call QDUpdateInImsQuoteCollection.GetEnumerator() for each record.
            try 
	        {
                //using (DbContext)
                //{
                    var sqp = new SqlParameter("sqp", SqlDbType.Structured);
                    sqp.Value = QsoUpdateStationNamesDTOCollection;
                    sqp.TypeName = "udt_QsoStationNames";

                    string command = "EXEC " + "CQD_sp_QsoUpdateStationNames" + " @sqp";
                    DbContext.Database.ExecuteSqlCommand(command, sqp);
                //}
            }
	        catch (Exception ex)
	        {
                Debug.WriteLine(string.Format("UpdateQsoStations() exception {0}", ex.Message));
                results = false;
	        }
            finally
            {
                //DbContext.Dispose();
            }
            return Task.FromResult(results);
        }

        public static async Task<bool> SetStationListAsync(this IRepositoryAsync<Log> _LogRepository, int Logid, List<Station> LogStations)
        {
            return await SetStationList(_LogRepository, Logid, LogStations);
        }
        public static Task<bool> SetStationList(this IRepositoryAsync<Log> _LogRepository, int Logid, List<Station> LogStations)
        {
            bool Results = true;
            List<CallInfo> CallInfosWithStationNames = null;
            List<CallInfo> CallInfosWithStationNamesRestore = new List<CallInfo>(); 

            IRepository<Qso> _QsoRepository = _LogRepository.GetRepository<Qso>();
            IQueryFluent<Qso> Qsos = _QsoRepository.Query();
            var QsoQ = Qsos.SelectQueryable(true);

            IRepository<Station> _StationRepository = _LogRepository.GetRepository<Station>();
            IQueryFluent<Station> Stations = _StationRepository.Query();
            var StationsQ = Stations.SelectQueryable(true);

            IRepository<CallInfo> _CallInfoRepository = _LogRepository.GetRepository<CallInfo>();
            IQueryFluent<CallInfo> CallInfos = _CallInfoRepository.Query();
            //non-tracking is no good if the Callinfo is updated and then restored with another update
            //var CallInfoQ = CallInfos.SelectQueryable(true);
            var CallInfoQTrack = CallInfos.SelectQueryable(false);


            var StationsCurrent = (from ls in StationsQ
                          where ls.LogId == Logid 
                          select ls
                            ).ToList();
            //if current sation is being used, we need to remove all Qsos withthis StationName
            var _contextStation = _StationRepository.GetDbContext();
            using (_contextStation)
            {

                //remove the old stationnames from Qsos before deleting old stationnames
                foreach (var item in StationsCurrent)
                {
                    //get all Qs with this stationName
                    var QsosWithStatioName = (from lq in QsoQ
                                              where lq.LogId == Logid &&
                                              lq.StationName == item.StationName
                                              select new QsoUpdateStationNamesDTO
                                              {
                                                  LogId = lq.LogId,
                                                  QsoNo = lq.QsoNo,
                                                  StationName = lq.StationName,
                                                  Frequency = lq.Frequency
                                              }
                                ).ToList();
                    QsoUpdateStationNamesDTOCollection QsoUpdateStationNamesDTOCollectionRestore = new QsoUpdateStationNamesDTOCollection();
                    foreach (var Qso in QsosWithStatioName)
                    {
                        Qso.StationName = null;
                        Qso.Frequency = Math.Truncate(Qso.Frequency); //no decimal in cabrillo
                        QsoUpdateStationNamesDTOCollectionRestore.Add(Qso);
                    }
                    if (QsoUpdateStationNamesDTOCollectionRestore.Count > 0)
                    {
                        //use sp to restore values
                        _LogRepository.UpdateQsoStations(QsoUpdateStationNamesDTOCollectionRestore);
                    }

                    //Now temporarily set stationname to NULL for all CallInfo records with this station name
                    //get all Qs with this stationName
                    CallInfosWithStationNames = (from lc in CallInfoQTrack
                                                 where lc.LogId == Logid &&
                                                 lc.StationName == item.StationName
                                                 select lc
                                ).ToList();

                    if (CallInfosWithStationNames.Count > 0)
                    {

                        foreach (var CallInfo in CallInfosWithStationNames)
                        {
                            CallInfo CallInfoCopy = new mvc.Entities.LogDataEntity.CallInfo()
                            {
                                CallGroup = CallInfo.CallGroup,
                                CallInfoId = CallInfo.CallInfoId,
                                CallsignId = CallInfo.CallsignId,
                                ContestId = CallInfo.ContestId,
                                Disabled = CallInfo.Disabled,
                                LogId = CallInfo.LogId,
                                QsoRadioTypeEnum = CallInfo.QsoRadioTypeEnum,
                                SessionName = CallInfo.SessionName,
                                StationName = CallInfo.StationName,
                                UserName = CallInfo.UserName
                            };
                            //save old entries
                            CallInfosWithStationNamesRestore.Add(CallInfoCopy);
                            CallInfo.StationName = null;
                            _CallInfoRepository.Update(CallInfo);
                        }
                    }


                    // var _context = _QsoRepository.GetDbContext();
                    //now delete the stationName from stationname table
                    _StationRepository.Delete(item);
                }

                try
                {
                    _contextStation.SaveChanges();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(string.Format("SetStationList() exception {0}", ex.Message));
                    Results = false;
                    Task.FromResult(Results);
                    //throw;
                }


                //insert new staytionnames
                foreach (var item in LogStations)
                {
                    _StationRepository.Insert(item);
                }

                if (CallInfosWithStationNamesRestore.Count != 0)
                {
                    foreach (var item in CallInfosWithStationNamesRestore)
                    {
                        if (LogStations.Where(x => x.StationName == item.StationName).Count() != 0)
                        {//restore
                           try
                            {
                               //THIS ERROR MESSAGE IS GENERATED IF THE cALLiNFO OBJECT IS NOT TRACKED
                               //
                              // Attaching an entity of type 'Logqso.mvc.Entities.LogDataEntity.CallInfo' failed because another entity of the same type
                             //already has the same primary key value. This can happen when using the 'Attach' method or setting the state of an entity
                             //to 'Unchanged' or 'Modified' if any entities in the graph have conflicting key values. This may be because some entities
                             //are new and have not yet received database-generated key values. In this case use the 'Add' method or the 'Added' entity state
                             //to track the graph and then set the state of non-new entities
                             //to 'Unchanged' or 'Modified' as appropriate.

                                var CallInfosWithStationName = (from lc in CallInfoQTrack
                                                                where lc.LogId == Logid &&
                                                                lc.CallInfoId == item.CallInfoId &&
                                                                lc.CallGroup == item.CallGroup &&
                                                                lc.UserName == item.UserName
                                                                select lc
                                            ).FirstOrDefault();
                                if (CallInfosWithStationName != null)
                                {
                                    //var val = _CallInfoRepository.GetEntityTrackingState(item);
                                    //val = _CallInfoRepository.GetEntityTrackingState(CallInfosWithStationName);
                                    CallInfosWithStationName.StationName = item.StationName;
                                    //THE UPDATE ENTITY MUST BE TRACKED. tHE QUERY ABOVE DOES THIS
                                    _CallInfoRepository.Update(CallInfosWithStationName);
                                }

                            }
                            catch (Exception ex)
                            {
                                Debug.WriteLine(string.Format("SetStationList()_2 exception {0}", ex.Message));
                                Results = false;
                                Task.FromResult(Results);
                                //throw;
                            }
                        }

                    }
                }

                _contextStation.SaveChanges();
            }
            return Task.FromResult(Results);
        }

    }


    //public class test9
    //{
    //    string key;
    //    string value;
    //};

}
