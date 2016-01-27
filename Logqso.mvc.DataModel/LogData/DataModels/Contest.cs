using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    //[Table("Contest")]
    public class Contest
    {
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(35)]
        [Required]
        public string ContestId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(30)]
        [Required]
        public  string ContestName { get; set; }
        public Logqso.mvc.common.Enum.ContestTypeEnum ContestTypeEnum { get; set; }
        public Logqso.mvc.common.Enum.QsoModeTypeEnum QsoModeTypeEnum { get; set; }
        [DataType(DataType.DateTime)]
        public virtual DateTime StartDateTime { get; set; }
        [DataType(DataType.DateTime)]
        public virtual DateTime EndDateTime { get; set; }
        [Column(TypeName = "bit")]
        public bool Active = true;

        public virtual ContestType ContestType { get; set; }
        public virtual QsoModeType QsoModeType { get; set; }

    }

}
