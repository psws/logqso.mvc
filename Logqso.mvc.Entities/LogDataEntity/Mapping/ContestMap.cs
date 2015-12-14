using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping
{
    public class ContestMap : EntityTypeConfiguration<Contest>
    {
        public ContestMap()
        {
            // Primary Key
            this.HasKey(t => t.ContestId);

            // Properties
            this.Property(t => t.ContestName)
                .IsRequired()
                .HasMaxLength(30);

            // Table & Column Mappings
            this.ToTable("Contest");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.ContestName).HasColumnName("ContestName");
        }
    }
}
