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
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
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
            using (IUnitOfWorkDataAsync unitOfWorkData = new UnitOfWorkData(context))
            {
                bool caught = false;
                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWorkData);

                var logService = new LogService(_logRepository);
                try
                {
                    var Logtask = logService.Query(x => x.LogId == 1)
                    .Include(x => x.LogCategory)
                    .Select();


                    LogforId1s = Logtask as List<Log>;

                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogService_Log_GetLogById_Return_Log exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(LogforId1s);
                Assert.IsInstanceOfType(LogforId1s, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(LogforId1s[0].LogId, LogId);
                Assert.IsInstanceOfType(LogforId1s[0].ContestYear, typeof(DateTime));
                Assert.AreEqual(LogforId1s[0].CallsignId, 1);

            }
        }

    }
}
