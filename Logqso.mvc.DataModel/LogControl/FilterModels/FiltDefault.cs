using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.FilterModels
{
    public class FiltDefaullt
    {

        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        public virtual Logqso.mvc.common.Enum.CatBandEnum FiltBnd { get; set; }
        public virtual Logqso.mvc.common.Enum.ContinentEnum FiltCont { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(10)]
        [Required]
        public virtual string FiltPref { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(6)]
        [Required]
        public virtual string FiltCQZoneVal { get; set; }
        public virtual FiltBand FiltBand { get; set; }
        public virtual FiltContinent FiltContinent { get; set; }
        public virtual FiltPrefix FiltPrefix { get; set; }
        public virtual FiltCQZone FiltCQZone { get; set; }


    }
}
