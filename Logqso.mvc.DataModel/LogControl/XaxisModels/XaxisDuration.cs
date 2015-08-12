using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.XaxisModels
{
    public class XaxisDuration
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public  int XaxisDurationTime { get; set; }
        [Required]
        public  byte Index { get; set; }
    }
}
