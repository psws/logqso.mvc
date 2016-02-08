using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class UbnSummary : Entity
    {
        public int CallsignId { get; set; }
        public string ContestId { get; set; }
        public System.DateTime ContestYear { get; set; }
        public int LogCategoryId { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual LogCategory LogCategory { get; set; }
    }
}
