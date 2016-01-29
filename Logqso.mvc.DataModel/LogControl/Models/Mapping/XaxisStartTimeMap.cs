using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class XaxisStartTimeMap : EntityTypeConfiguration<XaxisStartTime>
    {
        public XaxisStartTimeMap()
        {
            // Primary Key
            this.HasKey(t => t.XaxisStrtTime);

            // Properties
            this.Property(t => t.XaxisStrtTime)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("XaxisStartTime");
            this.Property(t => t.XaxisStrtTime).HasColumnName("XaxisStrtTime");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
