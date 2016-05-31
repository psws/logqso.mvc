using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.UbnModels
{
    public class UbnSummary
    {
        [Key]
        [Column(Order = 1)]
        public int CallsignId { get; set; }
        [Key]
        [Column(TypeName = "varchar", Order= 2)]
        [MaxLength(35)]
        [Required]
        public string ContestId { get; set; }

        [DataType(DataType.Date)]
        public DateTime ContestYear { get; set; }
        public int LogCategoryId { get; set; }
        public int DuplicateCount { get; set; }


        public short? Claimed160Qso { get; set; }
        public int? Claimed160Points { get; set; }
        public short? Claimed160Countries { get; set; }
        public short? Claimed160Zones { get; set; }

        public short? Claimed80Qso { get; set; }
        public int? Claimed80Points { get; set; }
        public short? Claimed80Countries { get; set; }
        public short? Claimed80Zones { get; set; }

        public short? Claimed40Qso { get; set; }
        public int? Claimed40Points { get; set; }
        public short? Claimed40Countries { get; set; }
        public short? Claimed40Zones { get; set; }

        public short? Claimed20Qso { get; set; }
        public int? Claimed20Points { get; set; }
        public short? Claimed20Countries { get; set; }
        public short? Claimed20Zones { get; set; }

        public short? Claimed15Qso { get; set; }
        public int? Claimed15Points { get; set; }
        public short? Claimed15Countries { get; set; }
        public short? Claimed15Zone3 { get; set; }

        public short? Claimed10Qso { get; set; }
        public int? Claimed10Points { get; set; }
        public short? Claimed10Countries { get; set; }
        public short? Claimed10Zones { get; set; }

        public int? ClaimedTotalQSO { get; set; }
        public short? ClaimedCountries { get; set; }
        public short? ClaimedZones { get; set; }
        public int? ClaimedTotalPoints { get; set; }
        public int? ClaimedScore { get; set; }

        public short? Final160Qso { get; set; }
        public int? Final160Points { get; set; }
        public short? Final160Countries { get; set; }
        public short? Final160Zones { get; set; }

        public short? Final80Qso { get; set; }
        public int? Final80Points { get; set; }
        public short? Final80Countries { get; set; }
        public short? Final80Zones { get; set; }

        public short? Final40Qso { get; set; }
        public int? Final40Points { get; set; }
        public short? Final40Countries { get; set; }
        public short? Final40Zones { get; set; }

        public short? Final20Qso { get; set; }
        public int? Final20Points { get; set; }
        public short? Final20Countries { get; set; }
        public short? Final20Zones { get; set; }

        public int? Final15Qso { get; set; }
        public int? Final15Points { get; set; }
        public int? Final15Countries { get; set; }
        public int? Final15Zones { get; set; }

        public short? Final10Qso { get; set; }
        public int? Final10Points { get; set; }
        public short? Final10Countries { get; set; }
        public short? Final10Zones { get; set; }


        public int? FinalTotalQSO { get; set; }
        public short? FinalCountries { get; set; }
        public short? FinalZones { get; set; }
        public int? FinalTotalPoints { get; set; }
        public int? FinalScore { get; set; }

        public virtual Logqso.mvc.DataModel.LogData.DataModels.LogCategory LogCategory { get; set; }
        public virtual Logqso.mvc.DataModel.LogData.DataModels.Contest Contest { get; set; }
        public virtual Logqso.mvc.DataModel.LogData.DataModels.CallSign CallSign { get; set; }

   }
}
