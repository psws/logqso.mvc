using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CallInfo : Entity
    {
        public int StationId { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public int CallInfoId { get; set; }
        public int CallGroup { get; set; }
        public string ContestId { get; set; }
        public string Call { get; set; }
        public int CallsignId { get; set; }
        public Nullable<int> CallInfoDefault_Id { get; set; }
        public virtual CallInfoDefault CallInfoDefault { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual Station Station { get; set; }
    }
}
