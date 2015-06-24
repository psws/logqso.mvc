using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;


namespace Logqso.mvc.common.Interfaces
{
    public interface IQsoRepository 
    {
        QsoDto  CreateQso(Guid LogID);
    }
}
