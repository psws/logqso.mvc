using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
using Logqso.mvc.DataModel.Interfaces;
using Logqso.mvc.Entities.Dto;
using Logqso.mvc.DataModel.LogData;
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

        //private Guid guid;
        //private Guid Badguid;
        private int LogId;
        private int badLogId;

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

#if true
            _QsoRepository = A.Fake<IQsoRepository>();
            A.CallTo(() => _QsoRepository.CreateQso(LogId))
                .Returns(new Qso
                    {
                        LogId = LogId,
                        CallsignId = 2,
                        QsoId = 1,
                        QsoDateEime = DateTime.Now,
                        RxRst = 59,
                        TxRst = 59,

                    });
#else
            _QsoRepository = new QsoRepository();

#endif


            //automapper
            AutoMapper.Mapper.CreateMap<Log, LogEntity>();
            _logService = new LogService(_logRepository);

            AutoMapper.Mapper.CreateMap<Qso, QsoEntity>();
            _qsoService = new QsoService(_QsoRepository);

        }


        [TestMethod]
        public void QsoService_CreaeQso_ValidLog_CreateNewQso()
        {
            //arrange
            LogEntity LogEntity = _logService.GetByID(LogId);
            //act
            QsoEntity newQso = _qsoService.CreateQso(LogEntity.LogID);
            //assert
            Assert.IsInstanceOfType(newQso, typeof(QsoEntity));
            Assert.AreEqual(newQso.LogID, LogEntity.LogID);
        }
    }
}
