using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Logqso.mvc.DataModel.LogControl.CategoryModels
{
    public class CatAssisted
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public  Logqso.mvc.common.Enum.CatAssistedEnum CatAssist { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(15)]
        [Required]
        public  string CatAssistedName { get; set; }
        [Required]
        public  byte Index { get; set; }

    }



}

////from northwind project
// public CategoryMap()
//        {
//            // Primary Key
//            HasKey(t => t.CategoryID);

//            // Properties
//            Property(t => t.CategoryName)
//                .IsRequired()
//                .HasMaxLength(15);

//            // Table & Column Mappings
//            ToTable("Categories");
//            Property(t => t.CategoryID).HasColumnName("Category ID");
//            Property(t => t.CategoryName).HasColumnName("Category Name");
//            Property(t => t.Description).HasColumnName("Description");
//            Property(t => t.Picture).HasColumnName("Picture");
//        }

//http://www.codeproject.com/Articles/561584/Repository-Pattern-with-Entity-Framework-using

