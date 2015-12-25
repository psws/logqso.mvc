using System;
using System.Collections.Generic;

namespace Logqso.mvc.DataModel.Models
{
    public partial class Session
    {
        public string UserName { get; set; }
        public string ControlCategorySettingsEntity { get; set; }
        public string ControlFiltersSettingsEntity { get; set; }
        public string ControlXaxisSettingsEntity { get; set; }
        public string ControlYaxisSettingsEntity { get; set; }
        public string CallInfo1 { get; set; }
        public string CallInfo2 { get; set; }
        public string CallInfo3 { get; set; }
        public decimal Subscription { get; set; }
    }
}
