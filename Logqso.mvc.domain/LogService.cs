using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Threading.Tasks;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.Entities.LogDataEntity;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.Repository.Repository;

using Logqso.Repository;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Dto.Interfaces;
using Logqso.mvc.Dto.LogControl;

using Logqso.mvc.common.Enum;
using AutoMapper;
using System.IO;
using System.Drawing;
using System.Diagnostics;

using Logqso.mvc.domain.Charting;



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


        public  async Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelections(string username)
        {
             IEnumerable<DataCallInfoDto> DataCallInfoDtos = null;
             DataCallInfoDtos = await _repository.GetDataCallInfoSelections(username, true);


             //return Task.FromResult(DataCallInfoDtos);
             return DataCallInfoDtos;
        }

        public async Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelectionsAsync(string username)
        {
            IEnumerable<DataCallInfoDto> DataCallInfoDtos = null;
            DataCallInfoDtos = await _repository.GetDataCallInfoSelectionsAsync(username, true);


            //return Task.FromResult(DataCallInfoDtos);
            return DataCallInfoDtos;
        }


        public async Task<MemoryStream> UpdateChartSettingsAsync(ChartCtlDataSettingsDto ChartCtlDataSettingsDto, string username)
        {
            MemoryStream MemoryStream = null;
#if true
            Chart RateChart = new Chart();
            MemoryStream = await RateChart.LoadQSORateChart(ChartCtlDataSettingsDto, this._repository, username);
            
            
#else
            //MemoryStream = await _repository.GenerateChart(ChartCtlDataSettingsDto, username);

           //temporary
            String filePath = HostingEnvironment.MapPath("~/Image/chart.png");

            using (FileStream fs = File.OpenRead(filePath))
            {
                fs.CopyTo(MemoryStream);
            }
#endif
            //return Task.FromResult(DataCallInfoDtos);
            return MemoryStream;
        }

        public async Task<DataCalls> GetCategorizedCallsAsync(dataCallObjDTO dataCallObjDTO, string Username)
        {
            DataCalls DataCalls = null;
            //get LogCategory of client
            LogCategory LogCategory = new LogCategory();
            SetLogCategory( LogCategory,  dataCallObjDTO.ControlCategorySettingsDto);

            //Logqso.mvc.common.Enum.CallGroupEnum CallGroup;
            //Enum.TryParse<CallGroupEnum>(dataCallObjDTO.DataCallInfoDto.CallGroup.ToString(), out CallGroup);


            DataCalls = await _repository.GetCategorizedCallsAsync(LogCategory, dataCallObjDTO.DataCallInfoDto.SelectedContestName,
                dataCallObjDTO.CallTab, (CallGroupEnum)dataCallObjDTO.DataCallInfoDto.CallGroup, dataCallObjDTO.ControlCategorySettingsDto.Disabled,  Username);

            return DataCalls;

        }

        public async Task<DataCallInfoDto> GetUpdatedContestCall(DataCallInfoDto DataCallInfoDto, string Username)
        {

            DataCallInfoDto = await _repository.GetUpdatedDataCallInfoDto(DataCallInfoDto, Username);

            return DataCallInfoDto;

        }


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


        public static void SetLogCategory(LogCategory LogCategory, ControlCategorySettingsDto ControlCategorySettingsDto)
        {
            //ALL HAVE TO BE CAST AS INT BECAUSE OF EF BUG
            //ALL names SHOULD MATCH 
            // LogCategory.CatOperator needs to be LogCategory.CatOperatorEnum
            //http://stackoverflow.com/questions/26692965/no-corresponding-object-layer-type-could-be-found-for-the-conceptual-type
            //http://stackoverflow.com/questions/13527400/entity-framework-5-rtm-code-first-enum-support-broken-enums-in-other-namespaces
            //QsoModeTypeEnum, ContestTypeEnum, QsoRadioTypeEnum are ok to map to enum
            try
            {
                switch (ControlCategorySettingsDto.CatAssisted)
                {
                    case "NON-ASSISTED":
                        LogCategory.CatAssistedEnum = (int)CatAssistedEnum.NON_ASSISTED;
                        break;
                    case "ASSISTED":
                        LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ASSISTED;
                        break;
                    case "ALL":
                        LogCategory.CatAssistedEnum = (int)CatAssistedEnum.ALL;
                        break;
                    default:
                        break;
                }

                switch (ControlCategorySettingsDto.CatBand)
                {
                    case "10M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._10M;
                        break;
                    case "15M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._15M;
                        break;
                    case "20M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._20M;
                        break;
                    case "40M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._40M;
                        break;
                    case "80M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._80M;
                        break;
                    case "160M":
                        LogCategory.CatBandEnum = (int)CatBandEnum._160M;
                        break;
                    case "ALL":
                        LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                        break;
                    default:
                        LogCategory.CatBandEnum = (int)CatBandEnum.ALL;
                        break;
                }


                switch (ControlCategorySettingsDto.CatOperator)
                {
                    case "SINGLE-OP":
                        LogCategory.CatOperatorEnum = (int)CatOperatorEnum.SINGLE_OP;
                        break;
                    case "MULTI-OP":
                        LogCategory.CatOperatorEnum = (int)CatOperatorEnum.MULTI_OP;
                        break;
                    case "ALL":
                        LogCategory.CatOperatorEnum = (int)CatOperatorEnum.ALL;
                        break;
                    case "CHECKLOG":
                        LogCategory.CatOperatorEnum = (int)CatOperatorEnum.CHECKLOG;
                        break;
                    default:
                        LogCategory.CatOperatorEnum = (int)CatOperatorEnum.SINGLE_OP;
                        break;
                }


                switch (ControlCategorySettingsDto.CatPower)
                {
                    case "HIGH":
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.HIGH;
                        break;
                    case "LOW":
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.LOW;
                        break;
                    case "ALL":
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.ALL;
                        break;
                    case "QRP":
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.QRP;
                        break;
                    default:
                        LogCategory.CatPowerEnum = (int)CatPowerEnum.LOW;
                        break;
                }

                //if (!string.IsNullOrEmpty(ControlCategorySettingsDto.CatOverlay))
                //{
                //    switch (CabInfo.CatOverlay)
                //    {
                //        case "SINGLE_OP_CLASSIC":
                //            LogCategory.CatOperatorOverlayEnum = CatOperatorOverlayEnum.SINGLE_OP_CLASSIC;
                //            break;
                //        case "SINGLE_OP_ROOKIE":
                //            LogCategory.CatOperatorOverlayEnum = CatOperatorOverlayEnum.SINGLE_OP_ROOKIE;
                //            break;
                //        case "NONE":
                //            LogCategory.CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE;
                //            break;
                //        default:
                //            LogCategory.CatOperatorOverlayEnum = CatOperatorOverlayEnum.NONE;
                //            break;
                //    }
                //}
                //else
                //{
                LogCategory.CatOperatorOverlayEnum = (int)CatOperatorOverlayEnum.NONE;
                //}


                switch (ControlCategorySettingsDto.CatNoOfTx)
                {
                    case "ONE":
                        LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ONE;
                        break;
                    case "TWO":
                        LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.TWO;
                        break;
                    case "ALL":
                        LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ALL;
                        break;
                    case "UNLIMITED":
                        LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.UNLIMITED;
                        break;
                    default:
                        LogCategory.CatNoOfTxEnum = (int)CatNoOfTxEnum.ONE;
                        break;
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(string.Format(" Problem in ControlCategorySettingsDto"));
                throw;
            }



        }

    }
}
