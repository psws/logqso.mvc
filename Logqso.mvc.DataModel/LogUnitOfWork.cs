using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;

using Repository.Pattern.Extensions.interfaces;

namespace Logqso.mvc.DataModel
{
    public class LogUnitOfWork : UnitOfWork, ILogUnitOfWorkAsync
    {
        public LogUnitOfWork(ILogqsoDataContext datacontext) : base (datacontext)
        {

        }
    }
}
