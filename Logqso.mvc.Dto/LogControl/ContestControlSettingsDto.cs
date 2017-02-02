using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Logqso.mvc.Dto.LogControl
{
    public class ContestControlSettingsDto 
    {
        //bool force{ get; set; }
        public ControlCategorySettingsDto ControlCategorySettingsDto;
        public ControlFiltersSettingsDto ControlFiltersSettingsDto;
        public ControlXaxisSettingsDto ControlXaxisSettingsDto;
        public ControlYaxisSettingsDto ControlYaxisSettingsDto;
    }
}
