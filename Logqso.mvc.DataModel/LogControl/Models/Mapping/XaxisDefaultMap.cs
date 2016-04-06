using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class XaxisDefaultMap : EntityTypeConfiguration<XaxisDefault>
    {
        public XaxisDefaultMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.XaxisDurationTime)
                .IsRequired()
                .HasMaxLength(4);

            this.Property(t => t.XaxisStrtTime)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("XaxisDefault");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.XaxisDurationTime).HasColumnName("XaxisDurationTime");
            this.Property(t => t.XaxisStrtTime).HasColumnName("XaxisStrtTime");

            // Relationships
            this.HasRequired(t => t.XaxisDuration)
                .WithMany(t => t.XaxisDefaults)
                .HasForeignKey(d => d.XaxisDurationTime);
            this.HasRequired(t => t.XaxisStartTime)
                .WithMany(t => t.XaxisDefaults)
                .HasForeignKey(d => d.XaxisStrtTime);

        }
    }
}
