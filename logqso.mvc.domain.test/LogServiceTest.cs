using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Runtime.Serialization.Formatters.Binary;
using System.Collections.Generic;

using System.IO;
using Logqso.mvc.domain;
using Logqso.mvc.Entities.Interfaces;
using Logqso.mvc.Entities.Dto;
using Logqso.mvc.DataModel;

using Logqso.mvc.Exceptions;
using MSTestExtensions;
using FakeItEasy;

namespace logqso.mvc.domain.test
{
    [TestClass]
    public class LogServiceTest
    {
        private ILogRepository _logRepository;
        private LogService _logService;
        private Guid guid;
        private Guid Badguid;
        private DateTime Year = new DateTime(2015, 10, 28);


        [TestInitialize]
        public void initialize()
        {
            //initialixe serves as the composition root
            guid = Guid.NewGuid();
            _logRepository = A.Fake<ILogRepository>();
            A.CallTo(() => _logRepository.GetByID(guid))
                .Returns(new Log
                {
                    LogID = guid,
                    CallsignID = 1,
                    ContestYear = DateTime.Now,
                    ContestID = 1,
                });

            Badguid = Guid.NewGuid();
            A.CallTo(() => _logRepository.GetByID(Badguid))
               .Returns(null);
            //.Throws<LogNotFoundException>();
            //.Throws(new LogNotFoundException("hello"));

            A.CallTo(() => _logRepository.GetByYear(Year))
                .Returns( new List<Log> {
                new Log() {LogID = Guid.NewGuid(), CallsignID = 1, ContestID = 1, ContestYear = Year    },
                new Log() {LogID = Guid.NewGuid(), CallsignID = 2, ContestID = 1, ContestYear = Year    },
                } );



            //automapper
            AutoMapper.Mapper.CreateMap<Log, LogEntity>();

            _logService = new LogService(_logRepository);
        }

        [TestMethod]
        public void LogService_GetByID_ValidLogID_ReturnsLog()
        {
            //Arrange
            //var logService = new LogService(_logRepository);

            //Axt
            //Log log = logService.GetByID(guid);
            LogEntity LogEntity = _logService.GetByID(guid);

            //Assert
            Assert.IsInstanceOfType(LogEntity, typeof(LogEntity));
            Assert.AreEqual(LogEntity.LogID, guid);
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
        public void LogService_GetByID_InvalidLogID_ThrowsException()
        {
            //act => assert

            LogEntity LogEntity = null;

            try
            {
                LogEntity = _logService.GetByID(Badguid);
            }
            catch (LogNotFoundException ex)
            {
                // service generated exception
                Assert.AreEqual<Guid>(Badguid, ex.LogID);
                //if (ex.Message.Contains("Log does not exist for")   )
                //{
                //    throw ex;
                //}
                Assert.IsTrue(ex.Message.Contains("Log does not exist for"));
            }
            //FakeItEasy generated null for Badguid
            if (LogEntity != null)
            {
                Assert.Fail("The Invalid LogID {0} does exist", Badguid);
            }

        }
        [TestMethod]
        public void LogService_GetByYear_ValidYear_ReturnsListOfLogs()
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
