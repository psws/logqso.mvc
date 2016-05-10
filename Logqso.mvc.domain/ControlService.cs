using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Threading.Tasks;
using Logqso.mvc.domain.Interfaces;

using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.mvc.Dto.LogControl;
using Logqso.Repository;
using Logqso.Repository.Repository;


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
        /// 
    public class ControlService : Service<CatOperator>, IControlService
    {


        private readonly IRepositoryAsync<CatOperator> _repository;

        public ControlService(IRepositoryAsync<CatOperator> repository)
            : base(repository)
        {
            _repository = repository;
        }

#if false
        //old depredated method
        public Task<ContestControlsDataEntity> GetContestControlData()
        {
            ContestControlsDataEntity ContestControlsDataEntity = new ContestControlsDataEntity();

            ContestControlsDataEntity.ControlCategorysEntity = new ControlCategorysEntity();
            ContestControlsDataEntity.ControlCategorysEntity.CatOperator = _repository.GetContestCategorys();

            return Task.FromResult(ContestControlsDataEntity);
        }
#endif


        public  Task<ContestControlDto> GetContestControlNames()
        {
            ContestControlDto ContestControlDto = new ContestControlDto();

            ContestControlDto.ControlCategoryDto = new ControlCategoryDto();
            ContestControlDto.ControlCategoryDto.CatOperator = _repository.GetContestCategoryNames() as List<string>;
            var CatAssisteds= _repository.GetRepository<CatAssisted>();
            ContestControlDto.ControlCategoryDto.CatAssisted = CatAssisteds.GetContestAssistedNames() as List<string>;
            var CatBands = _repository.GetRepository<CatBand>();
            ContestControlDto.ControlCategoryDto.CatBand = CatBands.GetContestBandNames() as List<string>;
            var CatNoOfTxs = _repository.GetRepository<CatNoOfTx>();
            ContestControlDto.ControlCategoryDto.CatNoOfTx = CatNoOfTxs.GetContestNoOfTxNames() as List<string>;
            var CatPowers = _repository.GetRepository<CatPower>();
            ContestControlDto.ControlCategoryDto.CatPower = CatPowers.GetContestPowerNames() as List<string>;

            ContestControlDto.ControlFiltersDto = new ControlFiltersDto();
            var FiltPrefixes = _repository.GetRepository<FiltPrefix>();
            ContestControlDto.ControlFiltersDto.FiltCountryInnerHTML = FiltPrefixes.GetFiltPrefixNames() as List<CountryPrefixtype>;
            var FiltBands = _repository.GetRepository<FiltBand>();
            ContestControlDto.ControlFiltersDto.FiltBand = FiltBands.GetFiltBandNames() as List<string>;
            var FiltContinents = _repository.GetRepository<FiltContinent>();
            ContestControlDto.ControlFiltersDto.FiltContinent = FiltContinents.GetFiltContinentNames() as List<string>;
            var FiltCQZones = _repository.GetRepository<FiltCQZone>();
            ContestControlDto.ControlFiltersDto.FiltCQZone = FiltCQZones.GetFiltCQZoneNames() as List<string>;

            ContestControlDto.ControlXaxisDto = new ControlXaxisDto();
            var XaxisDurations = _repository.GetRepository<XaxisDuration>();
            ContestControlDto.ControlXaxisDto.XaxisDuration = XaxisDurations.GetXaxisDurationeVals() as List<string>;
            var XaxisStartTimes = _repository.GetRepository<XaxisStartTime>();
            ContestControlDto.ControlXaxisDto.XaxisStarttime = XaxisStartTimes.GetXaxisStartTimeNames() as List<string>;

            ContestControlDto.ControlYaxisDto = new ControlYaxisDto();
            var YaxisFunctions = _repository.GetRepository<YaxisFunction>();
            ContestControlDto.ControlYaxisDto.YaxisFunction = YaxisFunctions.GetYaxisFunctionNames() as List<string>;
            var YaxisIntervals = _repository.GetRepository<YaxisInterval>();
            ContestControlDto.ControlYaxisDto.YaxisInterval = YaxisIntervals.GetYaxisIntervalVals() as List<string>;
            var YaxisViewTypes = _repository.GetRepository<YaxisViewType>();
            ContestControlDto.ControlYaxisDto.YaxisViewType = YaxisViewTypes.GetYaxisViewTypeNames() as List<string>;

            return Task.FromResult(ContestControlDto);
        }

        public Task<T> GetControlSelection<T>(string Username)
        {
            object valueObj =  default(T);

            if (typeof(T) == typeof(ControlCategorySettingsDto))
            {
                 var CatDefautResp = _repository.GetRepository<CatDefault>();
                valueObj  = CatDefautResp.GetControlCategorySettings(Username);
            }
            else if (typeof(T) == typeof(ControlFiltersSettingsDto))
            {
                var FiltDefautResp = _repository.GetRepository<FiltDefaullt>();
                valueObj = FiltDefautResp.GetControlFilterSettings(Username);

            }
            else if (typeof(T) == typeof(ControlXaxisSettingsDto)  )
            {
                var XaxisDefautResp = _repository.GetRepository<XaxisDefault>();
                valueObj = XaxisDefautResp.GetControlXaxisSettings(Username);
            }
            else if (typeof(T) == typeof(ControlYaxisSettingsDto))
            {
                var YaxisDefautResp = _repository.GetRepository<YaxisDefault>();
                valueObj = YaxisDefautResp.GetControlYaxisSettings(Username);
            }


            return Task.FromResult((T)valueObj);

        }


        public Task<ContestControlSettingsDto> GetControlSelections(string username)
        {
            ContestControlSettingsDto ContestControlSettingsEntity = new ContestControlSettingsDto( );
            var CatDefautResp = _repository.GetRepository<CatDefault>();
            ContestControlSettingsEntity.ControlCategorySettingsDto = CatDefautResp.GetControlCategorySettings(username);
            var FiltDefautResp = _repository.GetRepository<FiltDefaullt>();
            ContestControlSettingsEntity.ControlFiltersSettingsDto = FiltDefautResp.GetControlFilterSettings(username);
            var XaxisDefautResp = _repository.GetRepository<XaxisDefault>();
            ContestControlSettingsEntity.ControlXaxisSettingsDto = XaxisDefautResp.GetControlXaxisSettings(username);
            var YaxisDefautResp = _repository.GetRepository<YaxisDefault>();
            ContestControlSettingsEntity.ControlYaxisSettingsDto = YaxisDefautResp.GetControlYaxisSettings(username);

            return Task.FromResult(ContestControlSettingsEntity);
        }

        public Task<bool> SaveControlSelections(ContestControlSettingsDto ContestControlSettingsEntity, string Username)
        {
            bool bSaved = false;

            //todo  Call into respositiry to save
#warning //Todo Need to add SaveControlSelections()


            return Task.FromResult(bSaved);
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
