using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class FiltCQZoneMap : EntityTypeConfiguration<FiltCQZone>
    {
        public FiltCQZoneMap()
        {
            // Primary Key
            this.HasKey(t => t.FiltCQZoneVal);

            // Properties
            this.Property(t => t.FiltCQZoneVal)
                .IsRequired()
                .HasMaxLength(6);

            // Table & Column Mappings
            this.ToTable("FiltCQZone");
            this.Property(t => t.FiltCQZoneVal).HasColumnName("FiltCQZoneVal");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
