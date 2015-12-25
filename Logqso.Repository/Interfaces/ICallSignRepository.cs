using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel.LogData.DataModels;

namespace Logqso.Repository.Interfaces
{
    public interface ICallSignRepository
    {
        CallSign  GetCallSignID(string Call);
    }
}
