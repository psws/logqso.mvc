using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Infrastructure;
using Repository.Pattern.DataContext;


namespace Repository.Pattern.Repositories
{
    public interface IRepository<TEntity> where TEntity : class, IObjectState
    {
        TEntity Find(params object[] keyValues);
        IQueryable<TEntity> SelectQuery(string query, params object[] parameters);
        void Insert(TEntity entity);
        void InsertRange(IEnumerable<TEntity> entities);
        void InsertOrUpdateGraph(TEntity entity);
        void InsertGraphRange(IEnumerable<TEntity> entities);
        void Update(TEntity entity);
        void Delete(object id);
        void Delete(TEntity entity);
        IQueryFluent<TEntity> Query(IQueryObject<TEntity> queryObject);
        IQueryFluent<TEntity> Query(Expression<Func<TEntity, bool>> query);
        IQueryFluent<TEntity> Query();
        IQueryable<TEntity> Queryable();
        IEnumerable<TEntity> Item(Expression<Func<TEntity, bool>> wherePredicate, params Expression<Func<TEntity, object>>[] includeProperties);
        IRepository<T> GetRepository<T>() where T : class, IObjectState;
        //jims
        IQueryable<TEntity> QueryableNoTracking();
        bool GetEntityTrackingState(TEntity Entityc);
        IQueryable<TEntity> QueryableTrack(bool? track, Expression<Func<TEntity, bool>> wherePredicate, params Expression<Func<TEntity, object>>[] includeProperties);
        void SetSQLLogging(bool On);
        IDataContextAsync GetDbContext();
    }
}