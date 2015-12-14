using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Data.Entity.Validation;
using Logqso.mvc.DataModel.Repository;
using Logqso.mvc.DataModel.Interfaces;
using Logqso.mvc.Entities.Dto;
using Repository.Pattern.Ef6;
using Repository.Pattern.UnitOfWork;


namespace Logqso.mvc.DataModel
{
    

    /// <summary>
    /// Unit of Work class responsible for DB transactions
    /// </summary>
    public class UnitOfWork : IUnitOfWork ,IDisposable
    {
        #region Private member variables...
        
        private LogControl.LogControlDB _context = null;
        private GenericRepository<Logqso.mvc.Entities.Dto.ContestControlEntity> _ControlrRepository;
        #endregion

        public UnitOfWork(Type Type)
        {
            if (Type == typeof(ContestControlEntity) )
            {
                
            }
            _context = new LogControl.LogControlDB();
        }

        #region Public Repository Creation properties...

        /// <summary>
        /// Get/Set Property for product repository.
        /// </summary>
        public GenericRepository<ContestControlEntity> ControlrRepository
        {
            get
            {
                if (this._ControlrRepository == null)
                    this._ControlrRepository = new GenericRepository<ContestControlEntity>(_context);
                return _ControlrRepository;
            }
        }

        #endregion
        #region Public member methods...
        /// <summary>
        /// Save method.
        /// </summary>
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format(
                        "{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now,
                        eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw e;
            }

        }

        #endregion
        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being disposed");
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion

    }
}
