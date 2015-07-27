﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel.LogData;


namespace Logqso.mvc.DataModel.Interfaces
{
     public interface ILogRepository :  IDisposable
    {
         Log GetByID(int LogID);
         IReadOnlyList<Log> GetByYear(DateTime Year);
   }

}
