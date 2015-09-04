using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Pattern;
using Logqso.mvc.Entities.LogControlEntity;
using Logqso.Repository.Models;


namespace Logqso.mvc.domain.Interfaces
{
    public interface IControlService : IService<CatOperator>
        /// <summary>
        ///     Add any custom business logic (interface methods) here
        /// </summary>
        {
             Task<ContestControlEntity> GetContestControlNames();
             Task<ContestControlsDataEntity> GetContestControlData();
             Task<ContestControlSettingsEntity> GetControlSelections(string Username);
             Task<bool> SaveControlSelections(ContestControlSettingsEntity ContestControlSettingsEntity, string Username);
             Task<T> GetControlSelection<T>(string Username);
        }
}
