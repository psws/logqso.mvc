using System;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.domain.Interfaces
{
    interface ICallSignService
    {
        CallSign GetCallSignID(string Call);
    }
}
