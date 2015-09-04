using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class XaxisDurationMap : EntityTypeConfiguration<XaxisDuration>
    {
        public XaxisDurationMap()
        {
            // Primary Key
            this.HasKey(t => t.XaxisDurationTime);

            // Properties
            this.Property(t => t.XaxisDurationTime)
                .IsRequired()
                .HasMaxLength(4);

            // Table & Column Mappings
            this.ToTable("XaxisDuration");
            this.Property(t => t.XaxisDurationTime).HasColumnName("XaxisDurationTime");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
