﻿using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
#if nofake
using Logqso.mvc.persistance;
#endif
using Logqso.mvc.common.Interfaces;
using Logqso.mvc.common.Dto;

using FakeItEasy;

namespace logqso.mvc.domain.test
{
    
    [TestClass]
    public class LogTest
    {
        private ILogRepository  _logRepository;
        private Guid guid;

        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            guid = Guid.NewGuid();
            _logRepository = A.Fake<ILogRepository>();
            A.CallTo(() => _logRepository.GetByID(guid))
                .Returns(new LogDto
                {
                    LogID = guid,
                    CallsignID = 1,
                    ContestYear = DateTime.Now,
                    ContestID = 1,
                });

            //automapper
            AutoMapper.Mapper.CreateMap<LogDto, Log>();

        }

        [TestMethod]
        public void LogService_Log_ValidLogCallsignID_ReturnmLog()
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
           var logService = new LogService(_logRepository);
#endif

            Log log = logService.GetByID(guid);
            Assert.IsInstanceOfType(log, typeof(Log));
            Assert.AreEqual(log.LogID, guid);
            Assert.IsInstanceOfType(log.ContestYear, typeof(DateTime));
            Assert.AreEqual(log.ContestYear.Year, DateTime.Now.Year);

        }

    }
}
