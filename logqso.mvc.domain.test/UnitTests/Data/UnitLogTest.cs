using System;
using System.Threading.Tasks;
using FakeItEasy;
using Logqso.mvc.DataModel.LogData.Models;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Interfaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository.Pattern.DataContext;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using Service.Pattern;

namespace Logqso.mvc.domain.test.UnitTests.Data
{
    [TestClass]
    public class UnitLogLvsTest
    {
        private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        int LogId = 1;

        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            //guid = Guid.NewGuid();
            LogId = 1;
            _logRepository = A.Fake<IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log>>();
            A.CallTo(() => _logRepository.Find(LogId))
                .Returns(new Logqso.mvc.Entities.LogDataEntity.Log() //make sure all non-null fields are populated
                {
                    LogId = 1,
                    CallsignId = 1,
                    ContestYear = DateTime.Now,
                    ContestId = "CQWWSSB2002",
                    LogCategoryId = 2,
                    QsoDatabaseServerInstance = @"PSS60\SQL2014",
                    QsoDatabaseInstance = "ContestqsoData",
                    QsoDatabaseTableName = "Qso"
                    
                });

            //A.CallTo(() => _logRepository.Find(LogId)).Returns(Task.FromResult(
            //    new Logqso.mvc.Entities.LogDataEntity.Log
            //    {
            //        LogId = LogId,
            //        ContestYear = DateTime.Now,
            //        ContestId = "CQWWSSB2015",
            //    }));

            //automapper
            //AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Log,
            //                            Logqso.mvc.Entities.LogDataEntity.Log>();

        }

        [TestMethod]
        public  async Task Unit_LogService_Log_ValidLogCallsignID_ReturnLog()
        {
            Logqso.mvc.Entities.LogDataEntity.Log LogforId1 = null;
            //var log = new Log();
            //Guid guid = Guid.NewGuid();
            //log.FindByID(guid);  //need to call this first, ordered dependence!
            //Assert.IsInstanceOfType(log.LogCallsignID, typeof(Guid));
            //Assert.IsInstanceOfType(log.ContestYear, typeof(DateTime));
            //Assert.AreEqual(log.ContestYear.Year, DateTime.Now.Year);

            //Fake eliminates next 3 lines
#if nofake 
           Guid guid = Guid.NewGuid();
           var LogRepository = new LogRepository();
           var logService = new LogService(LogRepository);
#else
            var logService = new LogService(_logRepository);
#endif

            //Logqso.mvc.Entities.LogDataEntity.Log LogEntity = await logService.GetLogById(LogId);
            Task<Logqso.mvc.Entities.LogDataEntity.Log> LogEntitywait = logService.GetLogById(LogId);
            LogforId1 = await LogEntitywait;

            Assert.IsInstanceOfType(LogforId1, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
            Assert.AreEqual(LogforId1.LogId, LogId);
            Assert.IsInstanceOfType(LogforId1.ContestYear, typeof(DateTime));
            Assert.AreEqual( DateTime.Now.Year, LogforId1.ContestYear.Year);
            Assert.AreEqual( 1, LogforId1.CallsignId);

        }

    }


}
