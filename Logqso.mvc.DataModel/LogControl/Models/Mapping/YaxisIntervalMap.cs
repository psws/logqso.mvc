using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class YaxisIntervalMap : EntityTypeConfiguration<YaxisInterval>
    {
        public YaxisIntervalMap()
        {
            // Primary Key
            this.HasKey(t => t.YaxisIntvVal);

            // Properties
            this.Property(t => t.YaxisIntvVal)
                .IsRequired()
                .HasMaxLength(4);

            // Table & Column Mappings
            this.ToTable("YaxisInterval");
            this.Property(t => t.YaxisIntvVal).HasColumnName("YaxisIntvVal");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
