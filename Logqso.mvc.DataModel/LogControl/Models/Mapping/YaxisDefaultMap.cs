using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class YaxisDefaultMap : EntityTypeConfiguration<YaxisDefault>
    {
        public YaxisDefaultMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.YaxisFuncName)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.YaxisIntvVal)
                .IsRequired()
                .HasMaxLength(4);

            this.Property(t => t.YaxisViewTypeName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("YaxisDefault");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.YaxisFuncName).HasColumnName("YaxisFuncName");
            this.Property(t => t.YaxisIntvVal).HasColumnName("YaxisIntvVal");
            this.Property(t => t.YaxisViewTypeName).HasColumnName("YaxisViewTypeName");

            // Relationships
            this.HasRequired(t => t.YaxisFunction)
                .WithMany(t => t.YaxisDefaults)
                .HasForeignKey(d => d.YaxisFuncName);
            this.HasRequired(t => t.YaxisInterval)
                .WithMany(t => t.YaxisDefaults)
                .HasForeignKey(d => d.YaxisIntvVal);

        }
    }
}
