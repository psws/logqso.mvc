using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Logqso.Repository.Interfaces;
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

        
        public CallSign GetCallSignID(string Call)
        {
            CallSign CallSignEntity = null;
            Logqso.mvc.DataModel.LogData.DataModels.CallSign CallSign = null;
            // dependency injection

            CallSign = _CallRepository.GetCallSignID(Call);
#warning  Move this mapper CreateMap<CallSign, CallSignEntity>();
            Mapper.CreateMap<Logqso.mvc.DataModel.LogData.DataModels.CallSign, CallSign>();
            CallSignEntity = AutoMapper.Mapper.Map<Logqso.mvc.DataModel.LogData.DataModels.CallSign, CallSign>(CallSign);

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
