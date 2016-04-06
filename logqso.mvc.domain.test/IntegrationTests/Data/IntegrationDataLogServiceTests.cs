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
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\logqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_LogService_Log_GetLogById_Return_Log()
        {
            Logqso.mvc.Entities.LogDataEntity.Log LogforId1 = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
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
                Assert.AreEqual(LogforId1.LogId, LogId);
                Assert.IsInstanceOfType(LogforId1.ContestYear, typeof(DateTime));
                Assert.AreEqual(LogforId1.CallsignId, 1);

            }
        }

        [TestMethod]
        public void Integration_LogDataContext_LogService_Query_Log_Include_LogCategory_Return_LogCategories()
        {
            List<Logqso.mvc.Entities.LogDataEntity.Log> LogforId1s = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
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
                Assert.AreEqual(LogforId1s[0].LogId, LogId);
                Assert.IsInstanceOfType(LogforId1s[0].ContestYear, typeof(DateTime));
                Assert.AreEqual(LogforId1s[0].CallsignId, 1);
                Assert.IsNotNull(LogforId1s[0].LogCategory);

            }
        }


        [TestMethod]  //No async Task return type requirement, void is OK
        public  void Integration_LogDataContext_LogService_Log_GetDataCallInfoSelections_Return_DataCallInfoDto()
        {
            bool caught = false;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
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
                    Assert.AreNotEqual(Dtos[0].SelectedCall, string.Empty);
                    var LogIDDto = Dtos.Where(x => x.LogId == 1).SingleOrDefault();
                    Assert.IsNotNull(LogIDDto);
                    Assert.AreEqual(LogIDDto.LogId,1);
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
            using (IDataContextAsync context = new LogqsoDataContext())
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
                    Assert.AreNotEqual(Dtos[0].SelectedCall, string.Empty);
                    var LogIDDto = Dtos.Where(x => x.LogId == 1).SingleOrDefault();
                    Assert.IsNotNull(LogIDDto);
                    Assert.AreEqual(LogIDDto.LogId, 1);
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
            using (IDataContextAsync context = new LogqsoDataContext())
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
                    Assert.AreEqual(LogIDDto.LogId, 1);
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_await_GetDataCallInfoSelections_Return_DataCallInfoDtoo exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception

            }
        }

    }
}
