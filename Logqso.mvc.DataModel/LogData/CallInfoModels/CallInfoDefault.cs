using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogData.CallInfoModels
{
    public class CallInfoDefault
    {
        [Key]
        public int Id { get; set; }
        [InverseProperty("CallInfoId")]
        public List<CallInfo> CallInfos { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string SessionName { get; set; }
    }
}
