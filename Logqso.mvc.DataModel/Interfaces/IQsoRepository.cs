using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel.LogData;


namespace Logqso.mvc.DataModel.Interfaces
{
    public interface IQsoRepository 
    {
        Qso  CreateQso(int LogID);
    }
}
