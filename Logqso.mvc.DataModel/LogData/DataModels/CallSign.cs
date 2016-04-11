using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using googleutils;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    //[Table("CallSign")]
    public class CallSign
    {
        public CallSign()
        {
            Accuracy = Geo.GAccuracyCode.G_Null;
            GeoCodeChk = false;

        }

        [Key]
        public  int CallSignId { get; set; }
        [StringLength(20, ErrorMessage  = "The {0} must be at least {2} characters long"), MinLength(3)]
        //[StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 3)]
        //https://msdn.microsoft.com/en-us/data/gg193958.aspx
        [Column(TypeName = "varchar")]
        [Index(IsUnique = true)] 
        [Required]
        public virtual string Call { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(10)]
        [Required]
        public virtual string Prefix { get; set; }
        public virtual Logqso.mvc.common.Enum.ContinentEnum ContinentEnum { get; set; }

        public googleutils.Geo.GAccuracyCode Accuracy { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public bool? GeoCodeChk { get; set; }
    }
}
