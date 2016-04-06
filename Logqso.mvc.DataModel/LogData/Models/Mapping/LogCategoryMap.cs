using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
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
            this.Property(t => t.CatOperatorEnum).HasColumnName("CatOperatorEnum");
            this.Property(t => t.CatOperatorOverlayEnum).HasColumnName("CatOperatorOverlayEnum");
            this.Property(t => t.CatBandEnum).HasColumnName("CatBandEnum");
            this.Property(t => t.CatPowerEnum).HasColumnName("CatPowerEnum");
            this.Property(t => t.CatAssistedEnum).HasColumnName("CatAssistedEnum");
            this.Property(t => t.CatNoOfTxEnum).HasColumnName("CatNoOfTxEnum");
        }
    }
}
