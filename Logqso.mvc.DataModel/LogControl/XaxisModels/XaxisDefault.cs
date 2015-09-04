using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.XaxisModels
{
    public class XaxisDefault
    {
        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public string XaxisDurationTime { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public string XaxisStrtTime { get; set; }
        public virtual XaxisDuration XaxisDuration { get; set; }
        public virtual XaxisStartTime XaxisStartTime { get; set; }
    }
}
