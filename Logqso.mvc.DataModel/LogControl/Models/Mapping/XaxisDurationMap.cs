using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
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
