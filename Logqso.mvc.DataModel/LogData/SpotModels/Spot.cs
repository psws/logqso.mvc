using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Logqso.mvc.DataModel.LogData.DataModels;
using googleutils;

namespace Logqso.mvc.DataModel.LogData.SpotModels
{
    public class Spot
    {

        [Key]
        public int SpotId { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(35)]
        [Required]
        public string ContestId { get; set; }
        [Required]
        [ForeignKey("CallSign")]
        public int CallSignId { get; set; }
        [Required]
        [ForeignKey("SpoterCallSign")]
        public int SpoterCallSignId { get; set; }
        [DataType(DataType.Date)]
        [Required]
        public DateTime SpotDateTime { get; set; }
        [Column(TypeName = "decimal")]
        public decimal Frequency { get; set; }


        public virtual CallSign CallSign { get; set; }
        public virtual CallSign SpoterCallSign { get; set; }
        public virtual Contest Contest { get; set; }


    }
}
