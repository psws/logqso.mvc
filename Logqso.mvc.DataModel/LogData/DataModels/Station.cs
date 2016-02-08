using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
 


namespace Logqso.mvc.DataModel.LogData.DataModels
{
    public class Station
    {
        //[Key]
        //[Column(Order = 1)]
        //[System.ComponentModel.DataAnnotations.Schema.DatabaseGenerated(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.Identity)]
        //public int StationId { get; set; }
        [Key]
        [Column(Order =1)]
        public int LogId { get; set; }
        [Key]
        [Column(Order = 2,TypeName = "varchar")]
       // [Column(TypeName = "varchar")]
        [MaxLength(20)]
        //[Required]
        public string StationName { get; set; }
        ////[System.ComponentModel.DataAnnotations.Schema.DatabaseGenerated(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.Identity)]
        ////public int StationId { get; set; }

    }

    
}
