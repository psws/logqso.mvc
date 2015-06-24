using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;


namespace Logqso.mvc.common.Interfaces
{
     public interface ILogRepository :  IDisposable
    {
         LogDto GetByID(Guid LogID);
         IReadOnlyList<LogDto> GetByYear(DateTime Year);
   }

}
