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
    //this file allows the MEF to create a IRepositoryAsync with a Respository log.
    // MEF can use this             registerComponent.RegisterType<IRepositoryAsync<Log>, ResposituryLog<Log>>();
    //sinxce the constructor for URF Respository is Repository(IDataContextAsync context, IUnitOfWorkAsync unitOfWork)
    //we create a new interface public interface ILogqsoDataContext : IDataContextAsync
    // we also create  public interface ILogUnitOfWorkAsync : IUnitOfWorkAsync
    //Both of these interface are created with MEF, before  ResposituryLog<Log>> is MEF'd
    //
    //The ResposituryLog constructor uses the Lod DB specific context and UOW to pass to the generic URF Reapository
    //
    // All of this effort is needed to allow Multiple Databases in a prject.
    public class ResposituryLog<TEntity> : Repository<TEntity> ,IRepositoryAsync<TEntity> where TEntity : class, IObjectState
    {
        public ResposituryLog(ILogqsoDataContext context, ILogUnitOfWorkAsync unitOfWork) : base (context, unitOfWork)
        {

        }
    }
}
