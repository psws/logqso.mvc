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
            this.Property(t => t.ContestId)
                .HasMaxLength(25);

            // Table & Column Mappings
            this.ToTable("Log");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.ContestYear).HasColumnName("ContestYear");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.LogCategoryId).HasColumnName("LogCategoryId");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.CallsignId);
            this.HasOptional(t => t.Contest)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.ContestId);
            this.HasRequired(t => t.LogCategory)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.LogCategoryId);

        }
    }
}
