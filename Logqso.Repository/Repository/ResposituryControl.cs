using System;
using System.Collections;

using System.Collections.Generic;
using System.Linq;

using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Infrastructure;
using Repository.Pattern.Extensions.interfaces;

namespace Logqso.Repository.Repository
{
    public class ResposituryControl<TEntity> : Repository<TEntity> ,IRepositoryAsync<TEntity> where TEntity : class, IObjectState
    {
        public ResposituryControl(ILogqsoControlContext context, IControlUnitOfWorkAsync unitOfWork) : base (context, unitOfWork)
        {

        }
    }
}
