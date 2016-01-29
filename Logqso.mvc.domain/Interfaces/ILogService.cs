using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Pattern;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Models;


namespace Logqso.mvc.domain.Interfaces
{
    public interface ILogService : IService<Log>
        /// <summary>
        ///     Add any custom business logic (interface methods) here
        /// </summary>
        {
#if false
            Task<ContestControlEntity> GetContestControlNames();
             //Task<ContestControlsDataEntity> GetContestControlData();
             Task<ContestControlSettingsEntity> GetControlSelections(string Username);
             Task<bool> SaveControlSelections(ContestControlSettingsEntity ContestControlSettingsEntity, string Username);
             Task<T> GetControlSelection<T>(string Username);
#endif
        }
}
