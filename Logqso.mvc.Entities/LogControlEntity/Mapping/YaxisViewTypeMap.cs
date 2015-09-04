using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class YaxisViewTypeMap : EntityTypeConfiguration<YaxisViewType>
    {
        public YaxisViewTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.YaxisViewTypeName);

            // Properties
            this.Property(t => t.YaxisViewTypeName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("YaxisViewType");
            this.Property(t => t.YaxisViewTypeName).HasColumnName("YaxisViewTypeName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
