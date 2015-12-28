using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
   // [Table("Qso")]
    public class ContestType
    {
        [Key]
        public Logqso.mvc.common.Enum.ContestTypeEnum ContestTypeEnum { get; set; }
        [Required]
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string ContestTypeEnumName { get; set; }
        [Required]
        public Logqso.mvc.common.Enum.QsoExchangeTypeEnum QsoExchangeTypeEnum { get; set; }
        [Required]
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string QsoExchangeName { get; set; }

        [Required]
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string QsoMultName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string QsoMult2Name { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string ExtraDataName { get; set; }

        public virtual QsoExchangeType QsoExchangeType { get; set; }

    }
}
