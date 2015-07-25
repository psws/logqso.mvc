using System;
using Logqso.mvc.Entities.Dto;

namespace Logqso.mvc.domain
{
    interface ICallSignService
    {
        CallSignEntity GetCallSignID(string Call);
    }
}
