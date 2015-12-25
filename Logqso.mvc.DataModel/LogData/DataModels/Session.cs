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
        [Key]
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        [Column(TypeName = "xml")]
        public string ControlCategorySettingsEntity { get; set; }
        [Column(TypeName = "xml")]
        public string ControlFiltersSettingsEntity { get; set; }
        [Column(TypeName = "xml")]
        public string ControlXaxisSettingsEntity { get; set; }
        [Column(TypeName = "xml")]
        public string ControlYaxisSettingsEntity { get; set; }
        [Column(TypeName = "xml")]
        public string CallInfo1 { get; set; }
        [Column(TypeName = "xml")]
        public string CallInfo2 { get; set; }
        [Column(TypeName = "xml")]
        public string CallInfo3 { get; set; }
        [Column(TypeName = "smallmoney")]
        public decimal Subscription { get; set; }

    }
}
