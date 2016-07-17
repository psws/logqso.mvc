using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using Infrastructure;
using Repository.Pattern.Ef6;
using Repository.Pattern;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.Models;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.Dto.LogData;
using AutoMapper;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogControl;



namespace Logqso.mvc.domain.test.IntegrationTests.Data
{
    [TestClass]
    public class IntegrationDataLogServiceTests
    {
       // private readonly string CatOprName = "Hello Test";
        private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        int LogId = 1;

        public TestContext TestContext { get; set; }  //for trace debuggibg

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\ContestqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_LogService_Log_GetLogById_Return_Log()
        {
            Logqso.mvc.Entities.LogDataEntity.Log LogforId1 = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWorkData = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWorkData);

                var logService = new LogService(_logRepository);
                try
                {
                    var Logtask= logService.GetLogById(LogId);
                    LogforId1 = Logtask.Result;
                  
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_GetLogById_Return_Log exception {0}",ex.Message) );
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(LogforId1);
                Assert.IsInstanceOfType(LogforId1, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(LogId, LogforId1.LogId);
                Assert.IsInstanceOfType(LogforId1.ContestYear, typeof(DateTime));
                Assert.AreEqual( 1,LogforId1.CallsignId );

            }
        }

        [TestMethod]
        public void Integration_LogDataContext_LogService_Query_Log_Include_LogCategory_Return_LogCategories()
        {
            List<Logqso.mvc.Entities.LogDataEntity.Log> LogforId1s = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);

                var logService = new LogService(_logRepository);
                try
                {
                    var Logtask = logService.Query(x => x.LogId == 1)
                    .Include(x => x.LogCategory)
                    .Select();

                    LogforId1s = Logtask.ToList();
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_GetLogById_Return_Log exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(LogforId1s);
                Assert.IsTrue(LogforId1s.Count > 0);
                Assert.IsInstanceOfType(LogforId1s[0], typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(LogId, LogforId1s[0].LogId );
                Assert.IsInstanceOfType(LogforId1s[0].ContestYear, typeof(DateTime));
                Assert.AreEqual(1, LogforId1s[0].CallsignId );
                Assert.IsNotNull(LogforId1s[0].LogCategory);

            }
        }


        [TestMethod]  //No async Task return type requirement, void is OK
        public  void Integration_LogDataContext_LogService_Log_GetDataCallInfoSelections_Return_DataCallInfoDto()
        {
            bool caught = false;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {

                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);

                var logService = new LogService(_logRepository);
                try
                {
                    List<DataCallInfoDto> Dtos = null;
                    Task<IEnumerable<DataCallInfoDto>> DataCallInfoDtos = null;
                    DataCallInfoDtos = logService.GetDataCallInfoSelections("default");
                    //GetDataCallInfoSelections() is  async method of Logservice.
                    //Since we are not waiting with await on logService.GetDataCallInfoSelections(),
                    //It will run asynchronously
                    //it will return a Task<IEnumerable<DataCallInfoDto>>
                    //This must be converted to a List<DataCallInfoDto> that is used in the asseert.
                    Dtos = DataCallInfoDtos.Result as List<DataCallInfoDto>;


                    Assert.IsNotNull(Dtos);
                    Assert.IsInstanceOfType(DataCallInfoDtos, typeof(Task<IEnumerable<DataCallInfoDto>>));
                    Assert.IsInstanceOfType(Dtos[0].RadioNames, typeof(ICollection<RadioNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].StationNames, typeof(ICollection<StationNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].ContestNames, typeof(ICollection<ContestNamestype>));
                    Assert.AreNotEqual( string.Empty, Dtos[0].SelectedCall);
                    var LogIDDto = Dtos.Where(x => x.LogId == 1).SingleOrDefault();
                    Assert.IsNotNull(LogIDDto);
                    Assert.AreEqual(1, LogIDDto.LogId );
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_GetDataCallInfoSelections_Return_DataCallInfoDto exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception

            }
        }


        [TestMethod]  //task is required for async TestMerhod return type. return type of void not supported
        public async Task Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelections_Return_DataCallInfoDto()
        {
            bool caught = false;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {

                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);

                var logService = new LogService(_logRepository);
                try
                {
                    List<DataCallInfoDto> Dtos = null;

                    //awaut cinverts Task<IEnumerable<DataCallInfoDto>> to IEnumerable<DataCallInfoDto>
                    IEnumerable<DataCallInfoDto> DataCallInfoDtos = await logService.GetDataCallInfoSelections("default");
                    //GetDataCallInfoSelections() is  async method of Logservice.
                    //awaut on logService.GetDataCallInfoSelections() runs asynchronously
                    //converts return type toTask<IEnumerable<DataCallInfoDto>> to IEnumerable<DataCallInfoDto>
                    //it will return a IEnumerable<DataCallInfoDto>
                    //This must be converted to a List<DataCallInfoDto> that is used in the asseert.
                    Dtos = DataCallInfoDtos as List<DataCallInfoDto>;

                    Assert.IsNotNull(Dtos);
                    Assert.IsInstanceOfType(DataCallInfoDtos, typeof(IEnumerable<DataCallInfoDto>));
                    Assert.IsInstanceOfType(Dtos[0].RadioNames, typeof(ICollection<RadioNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].StationNames, typeof(ICollection<StationNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].ContestNames, typeof(ICollection<ContestNamestype>));
                    Assert.AreNotEqual(string.Empty, Dtos[0].SelectedCall );
                    var LogIDDto = Dtos.Where(x => x.LogId == 1).SingleOrDefault();
                    Assert.IsNotNull(LogIDDto);
                    Assert.AreEqual(1, LogIDDto.LogId );
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelections_Return_DataCallInfoDtoo exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception

            }
        }

        [TestMethod]  //task is required for async TestMerhod return type. return type of void not supported
        public async Task Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelectionsAsync_Return_DataCallInfoDto()
        {
            bool caught = false;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {

                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);

                var logService = new LogService(_logRepository);
                try
                {
                    List<DataCallInfoDto> Dtos = null;

                    //awaut cinverts Task<IEnumerable<DataCallInfoDto>> to IEnumerable<DataCallInfoDto>
                    IEnumerable<DataCallInfoDto> DataCallInfoDtos = await logService.GetDataCallInfoSelectionsAsync("default");
                    //GetDataCallInfoSelections() is  async method of Logservice.
                    //awaut on logService.GetDataCallInfoSelections() runs asynchronously
                    //converts return type toTask<IEnumerable<DataCallInfoDto>> to IEnumerable<DataCallInfoDto>
                    //it will return a IEnumerable<DataCallInfoDto>
                    //This must be converted to a List<DataCallInfoDto> that is used in the asseert.
                    Dtos = DataCallInfoDtos as List<DataCallInfoDto>;

                    Assert.IsNotNull(Dtos);
                    Assert.IsInstanceOfType(DataCallInfoDtos, typeof(IEnumerable<DataCallInfoDto>));
                    Assert.IsInstanceOfType(Dtos[0].RadioNames, typeof(ICollection<RadioNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].StationNames, typeof(ICollection<StationNamestype>));
                    Assert.IsInstanceOfType(Dtos[0].ContestNames, typeof(ICollection<ContestNamestype>));
                    Assert.AreNotEqual(Dtos[0].SelectedCall, string.Empty);
                    var LogIDDto = Dtos.Where(x => x.LogId == 1).SingleOrDefault();
                    Assert.IsNotNull(LogIDDto);
                    Assert.AreEqual(1, LogIDDto.LogId );
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelections_Return_DataCallInfoDtoo exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception

            }
        }


       [TestMethod]  
        public async Task Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelectionsAsync_Return_DataCalls()
        {
            bool caught = false;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new ContestqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {

                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);
                //Task<DataCalls> DataCalls = null;
                DataCalls DataCalls = null;
                string SelectedCall=  "CN2R";

                var logService = new LogService(_logRepository);
                try
                {


                    dataCallObjDTO dataCallObjDTO = new Dto.LogData.dataCallObjDTO()
                    {
                        ControlCategorySettingsDto = new   ControlCategorySettingsDto()
                        {
                            CatAssisted = Enum.GetName( typeof(CatAssistedEnum), CatAssistedEnum.ASSISTED ).Replace('_','-'),
                            CatBand = Enum.GetName( typeof(CatBandEnum), CatBandEnum.ALL ),
                            CatNoOfTx = Enum.GetName( typeof(CatNoOfTxEnum), CatNoOfTxEnum.TWO ),
                            CatOperator = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.MULTI_OP).Replace('_', '-'),
                            CatPower = Enum.GetName( typeof(CatPowerEnum), CatPowerEnum.HIGH ),
                            CatOperatorOverlay = Enum.GetName( typeof(CatOperatorOverlayEnum), CatOperatorOverlayEnum.NONE )
                        },
                        DataCallInfoDto = new DataCallInfoDto()
                        {
                            CallGroup =   CallGroupEnum.CALL1,
                            SelectedCall =  SelectedCall,
                            SelectedContestName = "Cqww Ssb 2002"
                        },
                        CallTab = "C"
                    };

                    DataCalls = await logService.GetCategorizedCallsAsync(dataCallObjDTO, "default");
                    //GetCategorizedCallsAsync() is  async method of Logservice.
                    //awaut on logService.GetCategorizedCallsAsync() runs asynchronously
                    //converts return type Task<DataCalls> to DataCalls
                    //it will return a DataCalls

                    Assert.IsNotNull(DataCalls);
                    Assert.IsInstanceOfType(DataCalls, typeof(DataCalls) );
                    Assert.AreEqual(CallGroupEnum.CALL1, DataCalls.CallGroup );
                    Assert.AreEqual( "C", DataCalls.SelectedCall );
                    Assert.IsInstanceOfType(DataCalls.Calls, typeof(ICollection<CallGroupCall>));
                    Assert.AreNotEqual(0, DataCalls.Calls.Count() );
                    Assert.AreEqual( SelectedCall.Substring(0,1), DataCalls.Calls.ElementAt(0).Call.Substring(0,1) );
              }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelectionsAsync_Return_DataCalls exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception

            }
        }


    }
}
