using System;
using System.Data;
using Infrastructure;
using Repository.Pattern.Repositories;
//jims
using Repository.Pattern.DataContext;

namespace Repository.Pattern.UnitOfWork
{
    public interface IUnitOfWork : IDisposable
    {
        int SaveChanges();
        //jims
        //string GetConnectioString();
        //IDataContextAsync DataContext(string nameOrConnectionString);

        void Dispose(bool disposing);
        IRepository<TEntity> Repository<TEntity>() where TEntity : class, IObjectState;
        void BeginTransaction(IsolationLevel isolationLevel = IsolationLevel.Unspecified);
        bool Commit();
        void Rollback();
    }
}