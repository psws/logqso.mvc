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
        public int DuplicateCount;


        public short? Claimed160Qso;
        public int? Claimed160Points;
        public short? Claimed160Countries;
        public short? Claimed160Zones;

        public short? Claimed80Qso;
        public int? Claimed80Points;
        public short? Claimed80Countries;
        public short? Claimed80Zones;
               
        public short? Claimed40Qso;
        public int? Claimed40Points;
        public short? Claimed40Countries;
        public short? Claimed40Zones;
               
        public short? Claimed20Qso;
        public int? Claimed20Points;
        public short? Claimed20Countries;
        public short? Claimed20Zones;
               
        public short? Claimed15Qso;
        public int? Claimed15Points;
        public short? Claimed15Countries;
        public short? Claimed15Zone3;
               
        public short? Claimed10Qso;
        public int? Claimed10Points;
        public short? Claimed10Countries;
        public short? Claimed10Zones;

        public int? ClaimedTotalQSO;
        public short? ClaimedCountries;
        public short? ClaimedZones;
        public int? ClaimedTotalPoints;
        public int? ClaimedScore;

        public short? Final160Qso;
        public int? Final160Points;
        public short? Final160Countries;
        public short? Final160Zones;

        public short? Final8Qso0;
        public int? Final80Points;
        public short? Final80Countries;
        public short? Final80Zones;

        public short? Final40Qso;
        public int? Final40Points;
        public short? Final40Countries;
        public short? Final40Zones;

        public short? Final20Qso;
        public int? Final20Points;
        public short? Final20Countries;
        public short? Final20Zones;

        public int? Final15Qso;
        public int? Final15Points;
        public int? Final15Countries;
        public int? Final15Zones;

        public short? Final10Qso;
        public int? Final10Points;
        public short? Final10Countries;
        public short? Final10Zones;


        public int? FinalTotalQSO;
        public short? FinalCountries;
        public short? FinalZones;
        public int? FinalTotalPoints;
        public int? FinalScore;

        public virtual Logqso.mvc.DataModel.LogData.DataModels.LogCategory LogCategory { get; set; }
        public virtual Logqso.mvc.DataModel.LogData.DataModels.Contest Contest { get; set; }
        public virtual Logqso.mvc.DataModel.LogData.DataModels.CallSign CallSign { get; set; }

   }
}
