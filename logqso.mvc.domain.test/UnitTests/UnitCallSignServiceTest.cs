using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
using Logqso.Repository.Repository.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using FakeItEasy;

namespace Logqso.mvc.domain.test.UnitTests
{
    [TestClass]
    public class UnitCallSignServiceTest
    {
         private ICallSignRepository _CallSignRepository;
        private CallSignService _callSignService;
        string Call = "W7EJ";


        [TestInitialize]
        public void initialize()
        {
            _CallSignRepository = A.Fake<ICallSignRepository>();
            string Call = "W7EJ";
            A.CallTo(() => _CallSignRepository.GetCallSignID(Call))
                .Returns(new Logqso.mvc.Entities.LogDataEntity.CallSign
                {
                    CallSignId = 1,
                    Call = Call,
                });

            //automapper
            AutoMapper.Mapper.CreateMap<CallSign,CallSignEntity >();
            _callSignService = new CallSignService(_CallSignRepository);
        }

        [TestMethod]
        public void Unit_CallSignService_ValidCall_ReturnsCallsignID()
        {
            //Act
            CallSignEntity CallSign = _callSignService.GetCallSignID(Call);

            //Assert
            Assert.AreEqual(CallSign.Call, Call);
            Assert.AreEqual(CallSign.CallSignId, 1);
        }
    }
}
