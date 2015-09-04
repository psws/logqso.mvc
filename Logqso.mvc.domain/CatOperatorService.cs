using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.Repository.Models;
using Logqso.Repository.Models.LogControl;
using Logqso.Repository;

namespace Logqso.mvc.domain
{

    ///// <summary>
    /////     Add any custom business logic (methods) here
    ///// </summary>
    //public interface IControlService : IService<CatOperator>
    //{
    //    ContestControlEntity GetContestControls();
    //}


       /// <summary>
        ///     All methods that are exposed from Repository in Service are overridable to add business logic,
        ///     business logic should be in the Service layer and not in repository for separation of concerns.
        /// </summary>
    public class CatOperatorService : Service<CatOperator>, ICatOperatorService
    {
        private readonly IRepositoryAsync<CatOperator> _repository;

        public CatOperatorService(IRepositoryAsync<CatOperator> repository)
            : base(repository)
        {
            _repository = repository;
        }


        public Task<ControlCategoryEntity> GetContestCategoryNames()
        {
            ControlCategoryEntity ControlCategoryEntity = new ControlCategoryEntity();

            ControlCategoryEntity.CatOperator = _repository.GetContestCategoryNames();
            return Task.FromResult(ControlCategoryEntity);
        }

        //public List<string> GetContestCategoryNames()
        //{
        //    List<string> vals  = new List<string>();
        //        //from c in _repository.Queryable()
        //    //            select new { CustomerName = c., LibraryName = l.Name };
        //    //.u_unitOfWork.Repository<CatOperator>.()
        //    //    (from myRow in dc.CatOperator
        //    //                                     select myRow.CatOprName).ToList();
        //    //ContestCategoryEntity.CatPower = (from myRow in dc.CatPower
        //    //                                  select myRow.CatPowerName).ToList();
        //    //ContestCategoryEntity.CatBand = (from myRow in dc.CatBand
        //    //                                 select myRow.CatBandName).ToList();
        //    //ContestCategoryEntity.CatAssisted = (from myRow in dc.CatAssisted
        //    //                                     select myRow.CatAssistedName).ToList();
        //    //ContestCategoryEntity.CatNoOfTx = (from myRow in dc.CatNoOfTx
        //    //select myRow.CatNoOfTxName).ToList();

        //    return vals;

        //}



        public override void Insert(CatOperator entity)
        {
            // e.g. add business logic here before inserting
            base.Insert(entity);
        }

        public override void Delete(object id)
        {
            // e.g. add business logic here before deleting
            base.Delete(id);
        }



    }
}
