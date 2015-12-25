using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class LogCategory
    {
        [Key]
        public int LogCategoryId { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatOperatorEnum CatOperator { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatOperatorOverlayEnum CatOperatorOverlay { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatBandEnum CatBand { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatPowerrEnum CatPower { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatAssistedEnum CatAssisted { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatNoOfIxEnum CatNoOfIx { get; set; }

    }
}
