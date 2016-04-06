using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class LogCategory : Entity
    {
        public LogCategory()
        {
            this.Logs = new List<Log>();
            this.UbnSummaries = new List<UbnSummary>();
        }

        public int LogCategoryId { get; set; }
        public int CatOperatorEnum { get; set; }
        public int CatOperatorOverlayEnum { get; set; }
        public int CatBandEnum { get; set; }
        public int CatPowerEnum { get; set; }
        public int CatAssistedEnum { get; set; }
        public int CatNoOfTxEnum { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
        public virtual ICollection<UbnSummary> UbnSummaries { get; set; }
    }
}
