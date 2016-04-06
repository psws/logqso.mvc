using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    [Serializable()] 
    public class CatDefault
    {
        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        public Logqso.mvc.common.Enum.CatOperatorEnum CatOperatorEnum { get; set; }
        public Logqso.mvc.common.Enum.CatAssistedEnum CatAssistedEnum { get; set; }
        public Logqso.mvc.common.Enum.CatBandEnum CatBandEnum { get; set; }
        public Logqso.mvc.common.Enum.CatNoOfTxEnum CatNoOfTxEnum { get; set; }
        public Logqso.mvc.common.Enum.CatPowerEnum CatPowerEnum { get; set; }
        public virtual CatOperator CatOperator { get; set; }
        public virtual CatAssisted CatAssisted { get; set; }
        public virtual CatBand CatBand { get; set; }
        public virtual CatNoOfTx CatNoOfTx { get; set; }
        public virtual CatPower CatPower { get; set; }


    }
}
