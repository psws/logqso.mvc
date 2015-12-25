using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
using Logqso.Repository.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using FakeItEasy;

namespace Logqso.mvc.domain.test.UnitTests
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
                .Returns(new Logqso.mvc.DataModel.LogData.DataModels.Log
                {
                    LogId = LogId,
                    ContestYear = DateTime.Now,
                    ContestId = "CQWWSSB2015",
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
                .Returns(new Logqso.mvc.DataModel.LogData.DataModels.Qso
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
            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Log, Log>();
            _logService = new LogService(_logRepository);

            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Qso, Qso>();
            _qsoService = new QsoService(_QsoRepository);

        }


        [TestMethod]
        public void Unit_QsoService_CreaeQso_ValidLog_CreateNewQso()
        {
            //arrange
            Log LogEntity = _logService.GetByID(LogId);
            //act
            Qso newQso = _qsoService.CreateQso(LogEntity.LogId);
            //assert
            Assert.IsInstanceOfType(newQso, typeof(Qso));
            Assert.AreEqual(newQso.LogId, LogEntity.LogId);
        }
    }
}
