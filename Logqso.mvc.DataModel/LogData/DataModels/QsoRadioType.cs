using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class QsoRadioType
    {
        [Key]
        public Logqso.mvc.common.Enum.QsoRadioTypeEnum QsoRadioTypeEnum { get; set; }
        [Required]
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string QsoRadioTypeName { get; set; }

    }
}
