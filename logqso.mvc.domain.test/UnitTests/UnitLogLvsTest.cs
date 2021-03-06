﻿using System;
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
    public class UnitLogLvsTest
    {
        private ILogLvsRepository  _logRepository;
        //private Guid guid;
        int LogId;

        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            //guid = Guid.NewGuid();
            LogId = 5;
            _logRepository = A.Fake<ILogLvsRepository>();
            A.CallTo(() => _logRepository.GetByID(LogId))
                .Returns(new Logqso.mvc.DataModel.LogData.DataModels.Log
                {
                    LogId = LogId,
                    ContestYear = DateTime.Now,
                    ContestId = "CQWWSSB2002",
                });

            //automapper
            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Log, Logqso.mvc.Entities.LogDataEntity.Log>();

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
           var logService = new LogLvsService(_logRepository);
#endif

           Logqso.mvc.Entities.LogDataEntity.Log  LogEntity = logService.GetByID(LogId);
           Assert.IsInstanceOfType(LogEntity, typeof( Logqso.mvc.Entities.LogDataEntity.Log));
           Assert.AreEqual(  LogId, LogEntity.LogId);
           Assert.IsInstanceOfType(LogEntity.ContestYear, typeof(DateTime));
           Assert.AreEqual( DateTime.Now.Year, LogEntity.ContestYear.Year);

        }

    }
}
