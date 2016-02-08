using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class UbnSummaryMap : EntityTypeConfiguration<UbnSummary>
    {
        public UbnSummaryMap()
        {
            // Primary Key
            this.HasKey(t => new { t.CallsignId, t.ContestId });

            // Properties
            this.Property(t => t.CallsignId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ContestId)
                .IsRequired()
                .HasMaxLength(35);

            // Table & Column Mappings
            this.ToTable("UbnSummary");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.ContestYear).HasColumnName("ContestYear");
            this.Property(t => t.LogCategoryId).HasColumnName("LogCategoryId");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.UbnSummaries)
                .HasForeignKey(d => d.CallsignId);
            this.HasRequired(t => t.Contest)
                .WithMany(t => t.UbnSummaries)
                .HasForeignKey(d => d.ContestId);
            this.HasRequired(t => t.LogCategory)
                .WithMany(t => t.UbnSummaries)
                .HasForeignKey(d => d.LogCategoryId);

        }
    }
}
