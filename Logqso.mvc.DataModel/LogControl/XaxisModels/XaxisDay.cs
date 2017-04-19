using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Logqso.mvc.DataModel.LogControl.XaxisModels
{
   public  class XaxisDay
    {
        [Key]
        public int Xaxisday { get; set; }
        public byte Index { get; set; }
    }
}
