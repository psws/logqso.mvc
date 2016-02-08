using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.Entity;

using Repository.Pattern.DataContext;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;

using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.DataModel.LogData.Models;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.common.Enum;

namespace Logqso.mvc.domain.test.IntegrationTests.Data
{
    [TestClass]
    public class IntegrationURFQuertable
    {
        private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        int LogId = 1;

        public TestContext TestContext { get; set; }  //for trace debuggibg

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\logqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_URF_QueryFluent_CallInfo_Include_StationCallsign_Return_StationCallsign()
        {
            List<CallInfo> callis = null;

            using (IDataContextAsync context = new LogqsoDataContext())
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<CallInfo> _CallinfoRepository = new Repository<CallInfo>(context, unitOfWorkData);

                try
                {
                    TestContext.WriteLine("Integration_LogDataContext_URF_QueryFluent_CallInfo_Include_StationCallsign_Return_StationCallsign");
                    //tracked
                    callis = _CallinfoRepository.Query(x => x.UserName == "default")
                        .Include(x => x.Station).Include(x => x.CallSign)
                        .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
                        .ToList();

                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_QueryFluent_CallInfo_Include_StationCallsign_Return_StationCallsign exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(callis);
                Assert.IsInstanceOfType(callis, typeof(List<CallInfo> ) );
                Assert.AreEqual(callis.Count, 3);
                Assert.IsNotNull(callis[0].CallSign);
                Assert.IsNotNull(callis[0].Station);

            }
        }

        [TestMethod]
        public void Integration_LogDataContext_URF_QueryableTrack_IncludeParam_Station_Return_Station_Track()
        {
            List<CallInfo> callis = null;
            IQueryable<CallInfo> CallInfo1 = null;

            using (IDataContextAsync context = new LogqsoDataContext())
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<CallInfo> _CallinfoRepository = new Repository<CallInfo>(context, unitOfWorkData);
                try
                {
                    //var LogQ = _logRepository.Queryable(x => x.LogId == 1, x => x.Stations, x => x.CallSign);
                    //CallInfo1 = _CallinfoRepository.Item(x => x.UserName == "default", x => x.Station);
                    CallInfo1 = _CallinfoRepository.QueryableTrack(false, x => x.UserName == "default", x => x.Station);
                    callis = CallInfo1.ToList();
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_QueryableTrack_IncludeParam_Station_Return_Station_Track exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(CallInfo1);
                Assert.IsInstanceOfType(CallInfo1, typeof(IQueryable<CallInfo>));
                Assert.AreEqual(callis.Count, 3);
                //check if tracked
                //Assert.AreEqual(CallInfo1.Where(z=>z.CallGroup == (int)CallGroupEnum.CALL1).Select(x=>x.CallsignId).SingleOrDefault().))
                Assert.AreEqual(callis[0].ObjectState, Infrastructure.ObjectState.Unchanged);
                Assert.IsNull(callis[0].CallSign);
                Assert.IsNotNull(callis[0].Station);
               Assert.IsTrue(_CallinfoRepository.GetEntityTrackingState(callis[0]));  
            }
        }
        [TestMethod]
        public void Integration_LogDataContext_URF_QueryableTrack_IncludeParam__Station_Return_Station_NoTrack()
        {
            List<CallInfo> callis = null;
            IQueryable<CallInfo> CallInfo1 = null;

            using (IDataContextAsync context = new LogqsoDataContext())
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<CallInfo> _CallinfoRepository = new Repository<CallInfo>(context, unitOfWorkData);
                try
                {
                    //var LogQ = _logRepository.Queryable(x => x.LogId == 1, x => x.Stations, x => x.CallSign);
                    //CallInfo1 = _CallinfoRepository.Item(x => x.UserName == "default", x => x.Station);
                    CallInfo1 = _CallinfoRepository.QueryableTrack(true, x => x.UserName == "default", x => x.Station);
                    callis = CallInfo1.ToList();



                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_QueryableTrack_IncludeParam__Station_Return_Station_NoTrackexception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(CallInfo1);
                Assert.IsInstanceOfType(CallInfo1, typeof(IQueryable<CallInfo>));
                Assert.AreEqual(callis.Count, 3);
                //check if tracked
                Assert.AreEqual(callis[0].ObjectState, Infrastructure.ObjectState.Unchanged);
                Assert.IsNull(callis[0].CallSign);
                Assert.IsNotNull(callis[0].Station);
                //check if tracked
                Assert.IsFalse(_CallinfoRepository.GetEntityTrackingState(callis[0]));  
            }
        }


        [TestMethod]
        public void Integration_LogDataContext_URF_Query_IncludeParam_Station_Return_Station_Track()
        {
            List<CallInfo> callis = null;

            using (IDataContextAsync context = new LogqsoDataContext())
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<CallInfo> _CallinfoRepository = new Repository<CallInfo>(context, unitOfWorkData);

                try
                {
                    TestContext.WriteLine("Integration_LogDataContext_URF_Query_IncludeParam_Station_Return_Station_Track");
                    //tracked
                    callis = _CallinfoRepository.Query(x => x.UserName == "default")
                        .Include(x => x.Station).Include(x => x.CallSign)
                        .Select().OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup)
                        .ToList();

                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_Query_IncludeParam_Station_Return_Station_Track exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(callis);
                Assert.IsInstanceOfType(callis, typeof(List<CallInfo> ) );
                Assert.AreEqual(callis.Count, 3);
                Assert.IsNotNull(callis[0].CallSign);
                Assert.IsNotNull(callis[0].Station);
                Assert.IsTrue(_CallinfoRepository.GetEntityTrackingState(callis[0]));  
            }
        }




        [TestMethod]
        public void Integration_LogDataContext_URF_Queryable_DataCallInfoDto_Include_StationCallInfoContestType_Return_DataCallInfoDto()
        {
            List<DataCallInfoDto> DataCallInfoDtos = null;

            using (IDataContextAsync context = new LogqsoDataContext())
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<CallInfo> _CallinfoRepository = new Repository<CallInfo>(context, unitOfWorkData);
                try
                {

                    //var CallInfoss = _CallinfoRepository.QueryableNoTracking();
                    IQueryFluent<CallInfo> CallInfoss = _CallinfoRepository.Query(t => t.UserName == "default");
                    var CallInfoQ = CallInfoss
                        .Include(x => x.Station).Include(x => x.CallSign)
                        .SelectQueryable(true)
                        .OrderBy(t => t.SessionName).ThenBy(t => t.CallGroup);

                    var LogRepository = _CallinfoRepository.GetRepository<Log>();
                    IQueryFluent<Log> Logs = LogRepository.Query();
                    var LogQ = Logs
                        .Include(x => x.Stations)
                        .Include(x => x.Contest)
                        .SelectQueryable(true);

                    var ContesttypeRepository = _CallinfoRepository.GetRepository<ContestType>();
                    IQueryFluent<ContestType> ContestTypess = ContesttypeRepository.Query();
                    var ContestQ = ContestTypess
                        .Include(x => x.Contests)
                        .SelectQueryable(true);


                    DataCallInfoDtos = (from lc in CallInfoQ
                                      join lq in LogQ on lc.LogId equals lq.LogId
                                      where lc.UserName == "default"
                                      select new DataCallInfoDto
                                      {
                                          CallGroup = (CallGroupEnum)lc.CallGroup,
                                          SelectedContestName = lc.ContestId,
                                          SelectedCall = lc.CallSign.Call,
                                          SelectedStationName = lc.Station.StationName,
                                          //Selecct() flattens
                                          StationNames = lq.Stations.Select(x => x.StationName).ToList(), 
                                          //returns only contests that match the Callinfo
                                          //ContestNames = cq.Contests.Where(x => x.ContestName.Contains("cqww")).Select(x => x.ContestName).ToList(),
                                          //return all contests in Db table ordered  by name
                                          ContestNames = ContestQ.SelectMany(x=>x.Contests).OrderBy(x => x.ContestName).Select(x => x.ContestName).ToList(),
                                          //return all WPX contests in Db table ordered  by name
                                          //ContestNames = ContestQ.SelectMany(x => x.Contests).Where(x => x.ContestName.Contains("Cqwpx")).OrderBy(x => x.ContestName).Select(x => x.ContestName).ToList(),
                                          Disabled = lc.Disabled,
                                      }).ToList();

                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_Queryable_DataCallInfoDto_Include_StationCallInfoContestType_Return_DataCallInfoDto exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(DataCallInfoDtos);
                Assert.IsInstanceOfType(DataCallInfoDtos, typeof(List<DataCallInfoDto>));
                Assert.AreEqual(DataCallInfoDtos.Count, 3);
                Assert.IsNotNull(DataCallInfoDtos[0].StationNames);
                Assert.IsNotNull(DataCallInfoDtos[0].ContestNames);
                Assert.IsTrue(DataCallInfoDtos[0].ContestNames.Count >0);
                Assert.IsTrue(DataCallInfoDtos[0].StationNames.Count >= 0);   //some entry ategories do not have STN defined (singleOp)

            }

        }


    }
}
