using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Logqso.mvc.domain;
using Logqso.mvc.common.Interfaces;
using Logqso.mvc.common.Dto;
using FakeItEasy;

namespace Logqso.mvc.domain.test
{
    [TestClass]
    public class CallSignServiceTest
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
                .Returns(new CallSignDto
                {
                    CallSignID = 1,
                    Call = Call,
                });

            //automapper
            AutoMapper.Mapper.CreateMap<CallSignDto, CallSign>();
            _callSignService = new CallSignService(_CallSignRepository);
        }

        [TestMethod]
        public void CallSignService_ValidCall_ReturnsCallsignID()
        {
            //Act
            CallSign CallSign = _callSignService.GetCallSignID(Call);

            //Assert
            Assert.AreEqual(CallSign.Call, Call);
            Assert.AreEqual(CallSign.CallSignID, 1);
        }
    }
}
