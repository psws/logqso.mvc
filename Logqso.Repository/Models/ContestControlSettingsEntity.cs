using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;
using Logqso.mvc.Dto.LogControl;

namespace Logqso.Repository.Models
{
    public class ContestControlSettingsEntity 
    {
        bool force;
        public ControlCategorySettingsEntity ControlCategorySettingsEntity;
        public ControlFiltersSettingsEntity ControlFiltersSettingsEntity;
        public ControlXaxisSettingsEntity ControlXaxisSettingsEntity;
        public ControlYaxisSettingsEntity ControlYaxisSettingsEntity;
    }
}
