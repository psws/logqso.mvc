using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Logqso.Repository.Repository.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;

using Logqso.mvc.Exceptions;

namespace Logqso.mvc.domain
{
    public class CallSignService : Logqso.mvc.domain.Interfaces.ICallSignService
    {
         private readonly ICallSignRepository _CallRepository;

        public CallSignService(ICallSignRepository CallRepository)
        {
            _CallRepository = CallRepository;

        }

        
        public CallSignEntity GetCallSignID(string Call)
        {
            CallSignEntity CallSignEntity = null;
            CallSign CallSign = null;
            // dependency injection

            CallSign = _CallRepository.GetCallSignID(Call);
#warning  Move this mapper CreateMap<CallSign, CallSignEntity>();
            Mapper.CreateMap<CallSign, CallSignEntity>();
            CallSignEntity = AutoMapper.Mapper.Map<CallSign, CallSignEntity>(CallSign);

            //call exists
             if (CallSignEntity == null)
            {
                CallNotFoundException CallNotFoundException = new CallNotFoundException("Log does not exist for ");
                CallNotFoundException.Call = Call;
                throw CallNotFoundException;
            }
            else
            {
            }
             return CallSignEntity;
        }
    }
}
