using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class LogCategoryMap : EntityTypeConfiguration<LogCategory>
    {
        public LogCategoryMap()
        {
            // Primary Key
            this.HasKey(t => t.LogCategoryId);

            // Properties
            // Table & Column Mappings
            this.ToTable("LogCategory");
            this.Property(t => t.LogCategoryId).HasColumnName("LogCategoryId");
            this.Property(t => t.CatOperator).HasColumnName("CatOperator");
            this.Property(t => t.CatOperatorOverlay).HasColumnName("CatOperatorOverlay");
            this.Property(t => t.CatBand).HasColumnName("CatBand");
            this.Property(t => t.CatPower).HasColumnName("CatPower");
            this.Property(t => t.CatAssisted).HasColumnName("CatAssisted");
            this.Property(t => t.CatNoOfIx).HasColumnName("CatNoOfIx");
        }
    }
}
