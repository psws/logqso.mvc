using System;
using System.Collections.Generic;
using Infrastructure;



namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class Log : Entity
    {
        public Log()
        {
            this.CallInfoes = new List<CallInfo>();
            this.Qsoes = new List<Qso>();
            this.Stations = new List<Station>();
        }

        public int LogId { get; set; }
        public System.DateTime ContestYear { get; set; }
        public int CallsignId { get; set; }
        public string ContestId { get; set; }
        public int LogCategoryId { get; set; }
        public Nullable<short> QsoExchangeNumber { get; set; }
        public string QsoDatabaseServerInstance { get; set; }
        public string QsoDatabaseInstance { get; set; }
        public string QsoDatabaseTableName { get; set; }
        public Nullable<int> CabrilloInfoID { get; set; }
        public Nullable<int> WintestDataID { get; set; }
        public Nullable<int> N1mmDataID { get; set; }
        public virtual CabrilloInfo CabrilloInfo { get; set; }
        public virtual ICollection<CallInfo> CallInfoes { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual LogCategory LogCategory { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
        public virtual ICollection<Station> Stations { get; set; }
    }
}
