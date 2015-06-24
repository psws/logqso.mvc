using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
using Logqso.mvc.common.Interfaces;
using Logqso.mvc.persistance;
using Logqso.mvc.common.Dto;
using FakeItEasy;

namespace logqso.mvc.domain.test
{

    [TestClass]
    public class QsoServiceTest
    {
        private ILogRepository _logRepository;
        private LogService _logService;
        private IQsoRepository _QsoRepository;
        private QsoService _qsoService;
        
        private Guid guid;
        private Guid Badguid;

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

#if true
            _QsoRepository = A.Fake<IQsoRepository>();
            A.CallTo(() => _QsoRepository.CreateQso(guid))
                .Returns(new QsoDto
                    {
                        LogID = guid,
                        CallsignID = null,
                        QsoID = 1,
                        QsoDateEime = DateTime.Now,
                        RxRst = 59,
                        TxRst = 59,

                    } );
#else
            _QsoRepository = new QsoRepository();

#endif


            //automapper
            AutoMapper.Mapper.CreateMap<LogDto, Log>();
           _logService = new LogService(_logRepository);

           AutoMapper.Mapper.CreateMap<QsoDto, Qso>();
           _qsoService = new QsoService(_QsoRepository);

        }


       [TestMethod]
        public void QsoService_CreaeQso_ValidLog_CreateNewQso()
        {
            //arrange
            Log Log = _logService.GetByID(guid);
            //act
            Qso newQso = _qsoService.CreateQso(Log.LogID);
            //assert
            Assert.IsInstanceOfType(newQso, typeof(Qso));
            Assert.AreEqual(newQso.LogID, Log.LogID);
        }
    }
}
