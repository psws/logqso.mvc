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
        public int DuplicateCount { get; set; }
        public Nullable<short> Claimed160Qso { get; set; }
        public Nullable<int> Claimed160Points { get; set; }
        public Nullable<short> Claimed160Countries { get; set; }
        public Nullable<short> Claimed160Zones { get; set; }
        public Nullable<short> Claimed80Qso { get; set; }
        public Nullable<int> Claimed80Points { get; set; }
        public Nullable<short> Claimed80Countries { get; set; }
        public Nullable<short> Claimed80Zones { get; set; }
        public Nullable<short> Claimed40Qso { get; set; }
        public Nullable<int> Claimed40Points { get; set; }
        public Nullable<short> Claimed40Countries { get; set; }
        public Nullable<short> Claimed40Zones { get; set; }
        public Nullable<short> Claimed20Qso { get; set; }
        public Nullable<int> Claimed20Points { get; set; }
        public Nullable<short> Claimed20Countries { get; set; }
        public Nullable<short> Claimed20Zones { get; set; }
        public Nullable<short> Claimed15Qso { get; set; }
        public Nullable<int> Claimed15Points { get; set; }
        public Nullable<short> Claimed15Countries { get; set; }
        public Nullable<short> Claimed15Zone3 { get; set; }
        public Nullable<short> Claimed10Qso { get; set; }
        public Nullable<int> Claimed10Points { get; set; }
        public Nullable<short> Claimed10Countries { get; set; }
        public Nullable<short> Claimed10Zones { get; set; }
        public Nullable<int> ClaimedTotalQSO { get; set; }
        public Nullable<short> ClaimedCountries { get; set; }
        public Nullable<short> ClaimedZones { get; set; }
        public Nullable<int> ClaimedTotalPoints { get; set; }
        public Nullable<int> ClaimedScore { get; set; }
        public Nullable<short> Final160Qso { get; set; }
        public Nullable<int> Final160Points { get; set; }
        public Nullable<short> Final160Countries { get; set; }
        public Nullable<short> Final160Zones { get; set; }
        public Nullable<short> Final80Qso { get; set; }
        public Nullable<int> Final80Points { get; set; }
        public Nullable<short> Final80Countries { get; set; }
        public Nullable<short> Final80Zones { get; set; }
        public Nullable<short> Final40Qso { get; set; }
        public Nullable<int> Final40Points { get; set; }
        public Nullable<short> Final40Countries { get; set; }
        public Nullable<short> Final40Zones { get; set; }
        public Nullable<short> Final20Qso { get; set; }
        public Nullable<int> Final20Points { get; set; }
        public Nullable<short> Final20Countries { get; set; }
        public Nullable<short> Final20Zones { get; set; }
        public Nullable<int> Final15Qso { get; set; }
        public Nullable<int> Final15Points { get; set; }
        public Nullable<int> Final15Countries { get; set; }
        public Nullable<int> Final15Zones { get; set; }
        public Nullable<short> Final10Qso { get; set; }
        public Nullable<int> Final10Points { get; set; }
        public Nullable<short> Final10Countries { get; set; }
        public Nullable<short> Final10Zones { get; set; }
        public Nullable<int> FinalTotalQSO { get; set; }
        public Nullable<short> FinalCountries { get; set; }
        public Nullable<short> FinalZones { get; set; }
        public Nullable<int> FinalTotalPoints { get; set; }
        public Nullable<int> FinalScore { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
        public virtual LogCategory LogCategory { get; set; }
    }
}
