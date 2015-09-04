using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.YaxisModels
{
    public class YaxisDefault
    {
        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(256)]
        [Required]
        public string UserName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public  string YaxisFuncName { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(4)]
        [Required]
        public string YaxisIntvVal { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(20)]
        [Required]
        public  string YaxisViewTypeName { get; set; }
        public virtual YaxisFunction YaxisFunction { get; set; }
        public virtual YaxisInterval YaxisInterval { get; set; }
        public virtual YaxisViewType YaxisViewType { get; set; }
    }
}

