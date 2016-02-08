using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class Session
    {
    
        // for saved sessions
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        ////[Required]
        public string SessionName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        [DataType(DataType.Date)]
        [Required]
        public DateTime SessionDateTime { get; set; }


        [Column(TypeName = "xml")]
        public string CategorySettings { get; set; }
        [Column(TypeName = "xml")]
        public string FiltersSettings { get; set; }
        [Column(TypeName = "xml")]
        public string XaxisSettings { get; set; }
        [Column(TypeName = "xml")]
        public string YaxisSettings { get; set; }

#if false
        //http://stackoverflow.com/questions/5559043/entity-framework-code-first-two-foreign-keys-from-same-table
        [ForeignKey("CallInfo1"), Column(Order = 0)]
        public int? CallInfo1Id { get; set; }
        [ForeignKey("CallInfo2"), Column(Order = 1)]
        public int? CallInfo2Id { get; set; }
        [ForeignKey("CallInfo3"), Column(Order = 2)]
        public int? CallInfo3Id { get; set; }

        //[InverseProperty("Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo.CallInfoId")]
        //[ForeignKey("CallInfo1Id")]
        public virtual Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo CallInfo1 { get; set; }
        //public virtual ICollection<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo> CallInfos { get; set; }

        //[ForeignKey("CallInfo2Id")]
        public virtual Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo CallInfo2 { get; set; }
        //[ForeignKey("CallInfo3Id")]
        public virtual Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo CallInfo3 { get; set; }
#endif

        ////public string CallInfo1 { get; set; }
        ////[Column(TypeName = "xml")]
        ////public string CallInfo2 { get; set; }
        ////[Column(TypeName = "xml")]
        ////public string CallInfo3 { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal? Subscription { get; set; }

    }

}
