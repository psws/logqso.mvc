using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Pattern;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.Dto.LogData;
using System.IO;


namespace Logqso.mvc.domain.Interfaces
{
    public interface ILogService : IService<Log>
        /// <summary>
        ///     Add any custom business logic (interface methods) here
        /// </summary>
        {

            Task<Log> GetLogById(int i);
            Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelections(string Username);
            Task<IEnumerable<DataCallInfoDto>> GetDataCallInfoSelectionsAsync(string username);
            Task<MemoryStream> UpdateChartSettingsAsync(ChartCtlDataSettingsDto ChartCtlDataSettingsDto, string username);
            Task<DataCalls> GetCategorizedCallsAsync(dataCallObjDTO dataCallObjDTO, string Username);
            Task<DataCallInfoDto> GetUpdatedContestCall(DataCallInfoDto dataCallObjDTO, string Username);
            
#if false
            Task<ContestControlEntity> GetContestControlNames();
             //Task<ContestControlsDataEntity> GetContestControlData();
             Task<ContestControlSettingsEntity> GetControlSelections(string Username);
             Task<bool> SaveControlSelections(ContestControlSettingsEntity ContestControlSettingsEntity, string Username);
             Task<T> GetControlSelection<T>(string Username);
#endif
        }
}
