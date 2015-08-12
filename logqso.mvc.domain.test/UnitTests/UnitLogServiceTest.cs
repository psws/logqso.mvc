using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Runtime.Serialization.Formatters.Binary;
using System.Collections.Generic;

using System.IO;
using Logqso.mvc.domain;
using Logqso.Repository.Repository.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;

using Logqso.mvc.Exceptions;
using MSTestExtensions;
using FakeItEasy;

namespace Logqso.mvc.domain.test.UnitTests
{
    [TestClass]
    public class UnitLogServiceTest
    {
        private ILogRepository _logRepository;
        private LogService _logService;
        //private Guid guid;
        //private Guid Badguid;
        private int LogId;
        private int badLogId;
        private DateTime Year = new DateTime(2015, 10, 28);


        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            //guid = Guid.NewGuid();
            LogId = 5;
            _logRepository = A.Fake<ILogRepository>();
            A.CallTo(() => _logRepository.GetByID(LogId))
                .Returns(new Log
                {
                    LogId = LogId,
                    ContestYear = DateTime.Now,
                    ContestId = 1,
                });

            //Badguid = Guid.NewGuid();
            badLogId = -1;
            A.CallTo(() => _logRepository.GetByID(badLogId))
               .Returns(null);
            //.Throws<LogNotFoundException>();
            //.Throws(new LogNotFoundException("hello"));

            A.CallTo(() => _logRepository.GetByYear(Year))
                .Returns( new List<Log> {
                new Log() {LogId = 1,  ContestId = 1, ContestYear = Year    },
                new Log() {LogId = 2,  ContestId = 1, ContestYear = Year    },
                } );



            //automapper
            AutoMapper.Mapper.CreateMap<Log, LogEntity>();

            _logService = new LogService(_logRepository);
        }

        [TestMethod]
        public void Unit_LogService_GetByID_ValidLogID_ReturnsLog()
        {
            //Arrange
            //var logService = new LogService(_logRepository);

            //Axt
            //Log log = logService.GetByID(guid);
            LogEntity LogEntity = _logService.GetByID(LogId);

            //Assert
            Assert.IsInstanceOfType(LogEntity, typeof(LogEntity));
            Assert.AreEqual(LogEntity.LogId, LogId);
            Assert.IsInstanceOfType(LogEntity.ContestYear, typeof(DateTime));
            Assert.AreEqual(LogEntity.ContestYear.Year, DateTime.Now.Year);
        }

        //[TestMethod,ExpectedException(typeof(LogNotFoundException))]
        //public void GetByID_InvalidLogID_ThrowsException()
        //{
        //    //act
        //   Log log = _logService.GetByID(Badguid);


        //    //assert
        //    //MSTestExtensions.ThrowsAssert.Throws(() =>  _logService.GetByID(Badguid), "you cannot supply negative numbers.");
        //}

        [TestMethod]
        //[ExpectedException(typeof(LogNotFoundException), "Log does not exist for")]
        public void Unit_LogService_GetByID_InvalidLogID_ThrowsException()
        {
            //act => assert

            LogEntity LogEntity = null;

            try
            {
                LogEntity = _logService.GetByID(badLogId);
            }
            catch (LogNotFoundException ex)
            {
                // service generated exception
                Assert.AreEqual<int>(badLogId, ex.LogID);
                //if (ex.Message.Contains("Log does not exist for")   )
                //{
                //    throw ex;
                //}
                Assert.IsTrue(ex.Message.Contains("Log does not exist for"));
            }
            //FakeItEasy generated null for Badguid
            if (LogEntity != null)
            {
                Assert.Fail("The Invalid LogID {0} does exist", badLogId);
            }

        }
        [TestMethod]
        public void Unit_LogService_GetByYear_ValidYear_ReturnsListOfLogs()
        {

            IReadOnlyList<LogEntity> Logs = _logService.GetByYear(Year);

            Assert.IsInstanceOfType(Logs, typeof(IReadOnlyList<LogEntity>));
            Assert.AreEqual(Logs.Count, 2);
            foreach (var item in Logs)
            {
                Assert.AreEqual(item.ContestYear, Year);
            }

        }

    }
}
