using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Service.Pattern;
using Logqso.mvc.Entities.LogControlEntity;
using Logqso.Repository.Models.LogControl;


namespace Logqso.mvc.domain.Interfaces
{
    public interface ICatOperatorService : IService<CatOperator>
        /// <summary>
        ///     Add any custom business logic (interface methods) here
        /// </summary>
        {
        Task<ControlCategoryEntity> GetContestCategoryNames();
        }
}
