using System;
using System.Collections.Generic;
using Infrastructure;



namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Session : Entity
    {
        public Nullable<int> CallInfo1Id { get; set; }
        public Nullable<int> CallInfo2Id { get; set; }
        public Nullable<int> CallInfo3Id { get; set; }
        public string SessionName { get; set; }
        public string UserName { get; set; }
        public System.DateTime SessionDateTime { get; set; }
        public string ControlCategorySettingsEntity { get; set; }
        public string ControlFiltersSettingsEntity { get; set; }
        public string ControlXaxisSettingsEntity { get; set; }
        public string ControlYaxisSettingsEntity { get; set; }
        public Nullable<decimal> Subscription { get; set; }
        public virtual CallInfo CallInfo { get; set; }
        public virtual CallInfo CallInfo1 { get; set; }
        public virtual CallInfo CallInfo2 { get; set; }
    }
}
