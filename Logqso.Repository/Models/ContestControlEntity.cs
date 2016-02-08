using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repository.Pattern.Ef6;
using Logqso.mvc.Dto.LogControl;

namespace Logqso.Repository.Models
{
    public class ContestControlEntity 
    {
        public ControlCategoryEntity ControlCategoryEntity;
        public ControlFiltersEntity ControlFiltersEntity;
        public ControlXaxisEntity ControlXaxisEntity;
        public ControlYaxisEntity ControlYaxisEntity;
    }
}
