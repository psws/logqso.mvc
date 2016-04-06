using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class CabrilloInfo
    {
        //[Key]
        //[System.ComponentModel.DataAnnotations.Schema.DatabaseGenerated(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.Identity)]
        //[Column(Order = 1)]
        //public int CabrilloInfoId { get; set; }

        ////[ForeignKey("Log")]
        ////public int LogId { get; set; }
        [Key]
        [ForeignKey("Contest")]
        [Column(Order = 1, TypeName = "varchar")]
        [MaxLength(35)]
        public string ContestId { get; set; }
        [Key]
        [ForeignKey("CallSign")]
        [Column(Order = 2)]
        public int CallSignId { get; set; }


        public int ClaimedScore { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        public string Club { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(200)]
        public string Operators { get; set; }

        [Column(TypeName = "varchar")]
        [MaxLength(200)]
        public string Address { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(100)]
        public string AddressCity { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(100)]
        public string AddressState { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(50)]
        public string AddressPostalCode { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(50)]
        public string AddressCountry { get; set; }


        ////public virtual Log Log { get; set; }
        //FK
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }

    }
}
