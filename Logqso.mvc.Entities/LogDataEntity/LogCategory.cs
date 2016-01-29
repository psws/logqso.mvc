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
        public int CatOperator { get; set; }
        public int CatOperatorOverlay { get; set; }
        public int CatBand { get; set; }
        public int CatPower { get; set; }
        public int CatAssisted { get; set; }
        public int CatNoOfIx { get; set; }
        public virtual ICollection<Log> Logs { get; set; }
        public virtual ICollection<UbnSummary> UbnSummaries { get; set; }
    }
}
