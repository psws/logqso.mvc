using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Runtime.Serialization.Formatters.Binary;
using System.Collections.Generic;

using System.IO;
using Logqso.mvc.domain;
using Logqso.mvc.common.Interfaces;
using Logqso.mvc.common.Dto;
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
                .Returns(new LogDto
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
                .Returns( new List<LogDto> {
                new LogDto() {LogID = Guid.NewGuid(), CallsignID = 1, ContestID = 1, ContestYear = Year    },
                new LogDto() {LogID = Guid.NewGuid(), CallsignID = 2, ContestID = 1, ContestYear = Year    },
                } );



            //automapper
            AutoMapper.Mapper.CreateMap<LogDto, Log>();

            _logService = new LogService(_logRepository);
        }

        [TestMethod]
        public void LogService_GetByID_ValidLogID_ReturnsLog()
        {
            //Arrange
            //var logService = new LogService(_logRepository);

            //Axt
            //Log log = logService.GetByID(guid);
            Log log = _logService.GetByID(guid);

            //Assert
            Assert.IsInstanceOfType(log, typeof(Log));
            Assert.AreEqual(log.LogID, guid);
            Assert.IsInstanceOfType(log.ContestYear, typeof(DateTime));
            Assert.AreEqual(log.ContestYear.Year, DateTime.Now.Year);
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

            Log Log = null;

            try
            {
                Log = _logService.GetByID(Badguid);
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
            if (Log != null)
            {
                Assert.Fail("The Invalid LogID {0} does exist", Badguid);
            }

        }
        [TestMethod]
        public void LogService_GetByYear_ValidYear_ReturnsListOfLogs()
        {

            IReadOnlyList<Log> Logs = _logService.GetByYear(Year);

            Assert.IsInstanceOfType(Logs, typeof(IReadOnlyList<Log>));
            Assert.AreEqual(Logs.Count, 2);
            foreach (var item in Logs)
            {
                Assert.AreEqual(item.ContestYear, Year);
            }

        }

    }
}
