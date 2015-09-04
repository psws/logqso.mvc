using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class YaxisFunctionMap : EntityTypeConfiguration<YaxisFunction>
    {
        public YaxisFunctionMap()
        {
            // Primary Key
            this.HasKey(t => t.YaxisFuncName);

            // Properties
            this.Property(t => t.YaxisFuncName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("YaxisFunction");
            this.Property(t => t.YaxisFuncName).HasColumnName("YaxisFuncName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
