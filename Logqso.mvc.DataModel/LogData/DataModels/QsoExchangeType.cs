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
    public class QsoExchangeType
    {
        [Key]
        public Logqso.mvc.common.Enum.QsoExchangeTypeEnum QsoExchangeTypeEnum { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string QsoExchangeTypeEnumName { get; set; }
    }
}
