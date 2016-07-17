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
        private ILogLvsRepository _logRepository;
        private LogLvsService _logService;
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
            _logRepository = A.Fake<ILogLvsRepository>();
            A.CallTo(() => _logRepository.GetByID(LogId))
                .Returns(new Logqso.mvc.DataModel.LogData.DataModels.Log
                {
                    LogId = LogId,
                    ContestYear = DateTime.Now,
                    ContestId = "CQWWSSB2002",
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
                        QsoNo = 1,
                        QsoDateTime = DateTime.Now,
                        RxRst = 59,
                        TxRst = 59,

                    });
#else
            _QsoRepository = new QsoRepository();

#endif


            //automapper
            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Log, Logqso.mvc.Entities.LogDataEntity.Log>();
            _logService = new LogLvsService(_logRepository);

            AutoMapper.Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.Qso, Qso>();
            _qsoService = new QsoService(_QsoRepository);

        }


        [TestMethod]
        public void Unit_QsoService_CreaeQso_ValidLog_CreateNewQso()
        {
            //arrange
            Logqso.mvc.Entities.LogDataEntity.Log LogEntity = _logService.GetByID(LogId);
            //act
            Qso newQso = _qsoService.CreateQso(LogEntity.LogId);
            //assert
            Assert.IsInstanceOfType(newQso, typeof(Qso));
            Assert.AreEqual(LogEntity.LogId, newQso.LogId);
        }
    }
}
