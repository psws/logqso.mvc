using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.Repository.Repository.Interfaces
{
    public interface ICallSignRepository
    {
        CallSign  GetCallSignID(string Call);
    }
}
