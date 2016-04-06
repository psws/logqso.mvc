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
        public Logqso.mvc.common.Enum.CatOperatorEnum CatOperatorEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatOperatorOverlayEnum CatOperatorOverlayEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatBandEnum CatBandEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatPowerEnum CatPowerEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatAssistedEnum CatAssistedEnum { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.CatNoOfTxEnum CatNoOfTxEnum { get; set; }

    }
}
