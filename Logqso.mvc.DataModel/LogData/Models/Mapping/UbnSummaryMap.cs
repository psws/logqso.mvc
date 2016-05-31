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
            this.Property(t => t.DuplicateCount).HasColumnName("DuplicateCount");
            this.Property(t => t.Claimed160Qso).HasColumnName("Claimed160Qso");
            this.Property(t => t.Claimed160Points).HasColumnName("Claimed160Points");
            this.Property(t => t.Claimed160Countries).HasColumnName("Claimed160Countries");
            this.Property(t => t.Claimed160Zones).HasColumnName("Claimed160Zones");
            this.Property(t => t.Claimed80Qso).HasColumnName("Claimed80Qso");
            this.Property(t => t.Claimed80Points).HasColumnName("Claimed80Points");
            this.Property(t => t.Claimed80Countries).HasColumnName("Claimed80Countries");
            this.Property(t => t.Claimed80Zones).HasColumnName("Claimed80Zones");
            this.Property(t => t.Claimed40Qso).HasColumnName("Claimed40Qso");
            this.Property(t => t.Claimed40Points).HasColumnName("Claimed40Points");
            this.Property(t => t.Claimed40Countries).HasColumnName("Claimed40Countries");
            this.Property(t => t.Claimed40Zones).HasColumnName("Claimed40Zones");
            this.Property(t => t.Claimed20Qso).HasColumnName("Claimed20Qso");
            this.Property(t => t.Claimed20Points).HasColumnName("Claimed20Points");
            this.Property(t => t.Claimed20Countries).HasColumnName("Claimed20Countries");
            this.Property(t => t.Claimed20Zones).HasColumnName("Claimed20Zones");
            this.Property(t => t.Claimed15Qso).HasColumnName("Claimed15Qso");
            this.Property(t => t.Claimed15Points).HasColumnName("Claimed15Points");
            this.Property(t => t.Claimed15Countries).HasColumnName("Claimed15Countries");
            this.Property(t => t.Claimed15Zone3).HasColumnName("Claimed15Zone3");
            this.Property(t => t.Claimed10Qso).HasColumnName("Claimed10Qso");
            this.Property(t => t.Claimed10Points).HasColumnName("Claimed10Points");
            this.Property(t => t.Claimed10Countries).HasColumnName("Claimed10Countries");
            this.Property(t => t.Claimed10Zones).HasColumnName("Claimed10Zones");
            this.Property(t => t.ClaimedTotalQSO).HasColumnName("ClaimedTotalQSO");
            this.Property(t => t.ClaimedCountries).HasColumnName("ClaimedCountries");
            this.Property(t => t.ClaimedZones).HasColumnName("ClaimedZones");
            this.Property(t => t.ClaimedTotalPoints).HasColumnName("ClaimedTotalPoints");
            this.Property(t => t.ClaimedScore).HasColumnName("ClaimedScore");
            this.Property(t => t.Final160Qso).HasColumnName("Final160Qso");
            this.Property(t => t.Final160Points).HasColumnName("Final160Points");
            this.Property(t => t.Final160Countries).HasColumnName("Final160Countries");
            this.Property(t => t.Final160Zones).HasColumnName("Final160Zones");
            this.Property(t => t.Final80Qso).HasColumnName("Final80Qso");
            this.Property(t => t.Final80Points).HasColumnName("Final80Points");
            this.Property(t => t.Final80Countries).HasColumnName("Final80Countries");
            this.Property(t => t.Final80Zones).HasColumnName("Final80Zones");
            this.Property(t => t.Final40Qso).HasColumnName("Final40Qso");
            this.Property(t => t.Final40Points).HasColumnName("Final40Points");
            this.Property(t => t.Final40Countries).HasColumnName("Final40Countries");
            this.Property(t => t.Final40Zones).HasColumnName("Final40Zones");
            this.Property(t => t.Final20Qso).HasColumnName("Final20Qso");
            this.Property(t => t.Final20Points).HasColumnName("Final20Points");
            this.Property(t => t.Final20Countries).HasColumnName("Final20Countries");
            this.Property(t => t.Final20Zones).HasColumnName("Final20Zones");
            this.Property(t => t.Final15Qso).HasColumnName("Final15Qso");
            this.Property(t => t.Final15Points).HasColumnName("Final15Points");
            this.Property(t => t.Final15Countries).HasColumnName("Final15Countries");
            this.Property(t => t.Final15Zones).HasColumnName("Final15Zones");
            this.Property(t => t.Final10Qso).HasColumnName("Final10Qso");
            this.Property(t => t.Final10Points).HasColumnName("Final10Points");
            this.Property(t => t.Final10Countries).HasColumnName("Final10Countries");
            this.Property(t => t.Final10Zones).HasColumnName("Final10Zones");
            this.Property(t => t.FinalTotalQSO).HasColumnName("FinalTotalQSO");
            this.Property(t => t.FinalCountries).HasColumnName("FinalCountries");
            this.Property(t => t.FinalZones).HasColumnName("FinalZones");
            this.Property(t => t.FinalTotalPoints).HasColumnName("FinalTotalPoints");
            this.Property(t => t.FinalScore).HasColumnName("FinalScore");

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
