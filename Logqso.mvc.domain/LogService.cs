﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Threading.Tasks;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.Repository.Repository;

using Logqso.Repository;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.common.Enum;
using AutoMapper;


namespace Logqso.mvc.domain
{

   
       /// <summary>
        ///     All methods that are exposed from Repository in Service are overridable to add business logic,
        ///     business logic should be in the Service layer and not in repository for separation of concerns.
        /// </summary>
    public class LogService : Service<Log>, ILogService
    {
        private readonly IRepositoryAsync<Log> _repository;

        private static AutoMapper.IMappingExpression<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto> MapperCallInfoDatToCallInfoDto = null; 
 
        public LogService(IRepositoryAsync<Log> repository)
            : base(repository)
        {
            _repository = repository;
        }

        public Task<Log> GetLogById(int ID)
        {
            Log Log = null;
            Log = _repository.Find(ID);
            return Task.FromResult(Log);            
        }

        public Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelections(string username)
        {
            //ContestControlsDataEntity ContestControlsDataEntity = new ContestControlsDataEntity();

            //ContestControlsDataEntity.ControlCategorysEntity = new ControlCategorysEntity();
            //ContestControlsDataEntity.ControlCategorysEntity.CatOperator = _repository.GetContestCategorys();
            var CallInfoRepo =  _repository.GetRepository<CallInfo>();
            //automapper
            if (MapperCallInfoDatToCallInfoDto == null)
            {
                AutoMapper.IMappingExpression<Logqso.mvc.Entities.LogDataEntity.Log, Logqso.mvc.Dto.LogData.DataCallInfoDto> MapperLogDatToCallInfoDto = null;
                //Arrange
                MapperCallInfoDatToCallInfoDto = AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                     ForMember(m => m.SelectedContestName, c => c.MapFrom(s => s.ContestId));
                //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.SelectedCall, c => c.MapFrom(s => s.CallSign.Call));
                //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.SelectedStationName, c => c.MapFrom(s => s.StationName));
                //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.StationNames, c => c.Ignore());
                //AutoMapper.Mapper.CreateMap<Logqso.mvc.Entities.LogDataEntity.CallInfo, Logqso.mvc.Dto.LogData.DataCallInfoDto>().
                MapperCallInfoDatToCallInfoDto.ForMember(m => m.ContestNames, c => c.Ignore());

            }
            AutoMapper.Mapper.AssertConfigurationIsValid();

             List<DataCallInfoDto> DataCallInfoDtos = null;
            var CallInfos = CallInfoRepo.GetDataCallInfoSelections(username);
            if (CallInfos.Count<CallInfo>() != 0)
	        {
                DataCallInfoDtos = new List<DataCallInfoDto>();

               CallInfo CallinfoItem = CallInfos.Where(t => t.CallGroup == (int)CallGroupEnum.CALL1).FirstOrDefault();
                DataCallInfoDtos.Insert(0, new DataCallInfoDto());
                AutoMapper.Mapper.Map(CallinfoItem, DataCallInfoDtos[0]);

                CallinfoItem = CallInfos.Where(t => t.CallGroup == (int)CallGroupEnum.CALL2).FirstOrDefault();
                DataCallInfoDtos.Insert(1, new DataCallInfoDto());
                AutoMapper.Mapper.Map(CallinfoItem, DataCallInfoDtos[1]);
 
                CallinfoItem = CallInfos.Where(t => t.CallGroup == (int)CallGroupEnum.CALL3).FirstOrDefault();
                DataCallInfoDtos.Insert(2, new DataCallInfoDto());
                AutoMapper.Mapper.Map(CallinfoItem, DataCallInfoDtos[2]);

	        }
            //get the collections for combobox.
            //var CallInfoCollections = CallInfoRepo.GetDataCallInfoCollections(username);


            return Task.FromResult(DataCallInfoDtos.AsEnumerable());
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


#if false
        public  Task<ContestControlEntity> GetContestControlNames()
        {
            ContestControlEntity ContestControlEntity = new ContestControlEntity();

            ContestControlEntity.ControlCategoryEntity = new ControlCategoryEntity();
            ContestControlEntity.ControlCategoryEntity.CatOperator = _repository.GetContestCategoryNames() as List<string>;
            var CatAssisteds= _repository.GetRepository<CatAssisted>();
            ContestControlEntity.ControlCategoryEntity.CatAssisted = CatAssisteds.GetContestAssistedNames();
            var CatBands = _repository.GetRepository<CatBand>();
            ContestControlEntity.ControlCategoryEntity.CatBand = CatBands.GetContestBandNames();
            var CatNoOfTxs = _repository.GetRepository<CatNoOfTx>();
            ContestControlEntity.ControlCategoryEntity.CatNoOfTx = CatNoOfTxs.GetContestNoOfTxNames();
            var CatPowers = _repository.GetRepository<CatPower>();
            ContestControlEntity.ControlCategoryEntity.CatPower = CatPowers.GetContestPowerNames();

            ContestControlEntity.ControlFiltersEntity = new ControlFiltersEntity();
            var FiltPrefixes = _repository.GetRepository<FiltPrefix>();
            ContestControlEntity.ControlFiltersEntity.FiltCountryInnerHTML = FiltPrefixes.GetFiltPrefixNames();
            var FiltBands = _repository.GetRepository<FiltBand>();
            ContestControlEntity.ControlFiltersEntity.FiltBand = FiltBands.GetFiltBandNames();
            var FiltContinents = _repository.GetRepository<FiltContinent>();
            ContestControlEntity.ControlFiltersEntity.FiltContinent = FiltContinents.GetFiltContinentNames();
            var FiltCQZones = _repository.GetRepository<FiltCQZone>();
            ContestControlEntity.ControlFiltersEntity.FiltCQZone = FiltCQZones.GetFiltCQZoneNames();

            ContestControlEntity.ControlXaxisEntity = new ControlXaxisEntity();
            var XaxisDurations = _repository.GetRepository<XaxisDuration>();
            ContestControlEntity.ControlXaxisEntity.XaxisDuration = XaxisDurations.GetXaxisDurationeVals();
            var XaxisStartTimes = _repository.GetRepository<XaxisStartTime>();
            ContestControlEntity.ControlXaxisEntity.XaxisStarttime = XaxisStartTimes.GetXaxisStartTimeNames();

            ContestControlEntity.ControlYaxisEntity = new ControlYaxisEntity();
            var YaxisFunctions = _repository.GetRepository<YaxisFunction>();
            ContestControlEntity.ControlYaxisEntity.YaxisFunction = YaxisFunctions.GetYaxisFunctionNames();
            var YaxisIntervals = _repository.GetRepository<YaxisInterval>();
            ContestControlEntity.ControlYaxisEntity.YaxisInterval = YaxisIntervals.GetYaxisIntervalVals();
            var YaxisViewTypes = _repository.GetRepository<YaxisViewType>();
            ContestControlEntity.ControlYaxisEntity.YaxisViewType = YaxisViewTypes.GetYaxisViewTypeNames();

            return Task.FromResult(ContestControlEntity);
        }

        public Task<T> GetControlSelection<T>(string Username)
        {
            object valueObj =  default(T);

            if (typeof(T) == typeof(ControlCategorySettingsEntity))
            {
                 var CatDefautResp = _repository.GetRepository<CatDefault>();
                valueObj  = CatDefautResp.GetControlCategorySettings(Username);
            }
            else if (typeof(T) == typeof(ControlFiltersSettingsEntity))
            {
                var FiltDefautResp = _repository.GetRepository<FiltDefault>();
                valueObj = FiltDefautResp.GetControlFilterSettings(Username);

            }
            else if (typeof(T) == typeof(ControlXaxisSettingsEntity)  )
            {
                var XaxisDefautResp = _repository.GetRepository<XaxisDefault>();
                valueObj = XaxisDefautResp.GetControlXaxisSettings(Username);
            }
            else if (typeof(T) == typeof(ControlYaxisSettingsEntity))
            {
                var YaxisDefautResp = _repository.GetRepository<YaxisDefault>();
                valueObj = YaxisDefautResp.GetControlYaxisSettings(Username);
            }


            return Task.FromResult((T)valueObj);

        }


        public Task<ContestControlSettingsEntity> GetControlSelections(string username)
        {
            ContestControlSettingsEntity ContestControlSettingsEntity = new ContestControlSettingsEntity( );
            var CatDefautResp = _repository.GetRepository<CatDefault>();
            ContestControlSettingsEntity.ControlCategorySettingsEntity = CatDefautResp.GetControlCategorySettings(username);
            var FiltDefautResp = _repository.GetRepository<FiltDefault>();
            ContestControlSettingsEntity.ControlFiltersSettingsEntity = FiltDefautResp.GetControlFilterSettings(username);
            var XaxisDefautResp = _repository.GetRepository<XaxisDefault>();
            ContestControlSettingsEntity.ControlXaxisSettingsEntity = XaxisDefautResp.GetControlXaxisSettings(username);
            var YaxisDefautResp = _repository.GetRepository<YaxisDefault>();
            ContestControlSettingsEntity.ControlYaxisSettingsEntity = YaxisDefautResp.GetControlYaxisSettings(username);

            return Task.FromResult(ContestControlSettingsEntity);
        }

        public Task<bool> SaveControlSelections(ContestControlSettingsEntity ContestControlSettingsEntity, string Username)
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

#endif

        public override void Insert(Log entity)
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
