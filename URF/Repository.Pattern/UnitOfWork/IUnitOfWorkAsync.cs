﻿using System.Threading;
using System.Threading.Tasks;
using Infrastructure;
using Repository.Pattern.Repositories;

namespace Repository.Pattern.UnitOfWork
{
    public interface IUnitOfWorkAsync : IUnitOfWork
    {
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
        IRepositoryAsync<TEntity> RepositoryAsync<TEntity>() where TEntity : class, IObjectState;
        Task<int> SaveChangesAsync();
    }

}