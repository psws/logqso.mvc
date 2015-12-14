using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping

{
    public class LogMap : EntityTypeConfiguration<Log>
    {
        public LogMap()
        {
            // Primary Key
            this.HasKey(t => t.LogId);

            // Properties
            // Table & Column Mappings
            this.ToTable("Log");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.ContestYear).HasColumnName("ContestYear");
            this.Property(t => t.ContestId).HasColumnName("ContestId");

            // Relationships
            this.HasRequired(t => t.Contest)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.ContestId);

        }
    }
}
