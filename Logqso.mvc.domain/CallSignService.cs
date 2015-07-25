using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Logqso.mvc.Entities.Interfaces;
using Logqso.mvc.Entities.Dto;
using Logqso.mvc.DataModel;

using Logqso.mvc.Exceptions;

namespace Logqso.mvc.domain
{
    public class CallSignService : Logqso.mvc.domain.ICallSignService
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
