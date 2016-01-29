using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
#if nofake
using Logqso.mvc.persistance;
#endif
using Logqso.Repository.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using FakeItEasy;

namespace Logqso.mvc.domain.test.UnitTests
{
    
    [TestClass]
    public class UnitLogTest
    {
        private ILogRepository  _logRepository;
        //private Guid guid;
        int LogId;

        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            //guid = Guid.NewGuid();
            LogId = 5;
            _logRepository = A.Fake<ILogRepository>();
            A.CallTo(() => _logRepository.GetByID(LogId))
                .Returns(new Logqso.mvc.DataModel.LogData.DataModels.Log
                {
                    LogId = LogId,
                    ContestYear = DateTime.Now,
                    ContestId = "CQWWSSB2015",
                });

            //automapper
            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Log, Log>();

        }

        [TestMethod]
        public void Unit_LogService_Log_ValidLogCallsignID_ReturnmLog()
        {
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
           var logService = new LoglvsService(_logRepository);
#endif

           Log LogEntity = logService.GetByID(LogId);
           Assert.IsInstanceOfType(LogEntity, typeof(Log));
           Assert.AreEqual(LogEntity.LogId, LogId);
           Assert.IsInstanceOfType(LogEntity.ContestYear, typeof(DateTime));
           Assert.AreEqual(LogEntity.ContestYear.Year, DateTime.Now.Year);

        }

    }
}
