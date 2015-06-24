using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Interfaces;
using Logqso.mvc.common.Dto;
using Logqso.mvc.Exceptions;

namespace Logqso.mvc.domain
{
    public class CallSignService
    {
         private readonly ICallSignRepository _CallRepository;

        public CallSignService(ICallSignRepository CallRepository)
        {
            _CallRepository = CallRepository;

        }

        
        public CallSign GetCallSignID(string Call)
        {
            CallSignDto CallSignDto = null;
            CallSign CallSign = null;
            // dependency injection

            CallSignDto = _CallRepository.GetCallSignID(Call);

            //call exists
            if (CallSignDto == null)
            {
                CallNotFoundException CallNotFoundException = new CallNotFoundException("Log does not exist for ");
                CallNotFoundException.Call = Call;
                throw CallNotFoundException;
            }
            else
            {
                CallSign = AutoMapper.Mapper.Map<CallSignDto, CallSign>(CallSignDto);
            }
            return CallSign;
        }
    }
}
