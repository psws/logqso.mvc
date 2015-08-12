using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class XaxisStartTimeMap : EntityTypeConfiguration<XaxisStartTime>
    {
        public XaxisStartTimeMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.XaxisStrtTime)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("XaxisStartTime");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.XaxisStrtTime).HasColumnName("XaxisStrtTime");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
