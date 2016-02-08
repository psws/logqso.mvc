﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Pattern;
using Logqso.mvc.Entities.LogControlEntity;
using Logqso.mvc.Dto.LogControl;


namespace Logqso.mvc.domain.Interfaces
{
    public interface IControlService : IService<CatOperator>
        /// <summary>
        ///     Add any custom business logic (interface methods) here
        /// </summary>
        {
             Task<ContestControlDto> GetContestControlNames();
             //Task<ContestControlsDataEntity> GetContestControlData();
             Task<ContestControlSettingsDto> GetControlSelections(string Username);
             Task<bool> SaveControlSelections(ContestControlSettingsDto ContestControlSettingsEntity, string Username);
             Task<T> GetControlSelection<T>(string Username);
        }
}
