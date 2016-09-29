using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class SpotMap : EntityTypeConfiguration<Spot>
    {
        public SpotMap()
        {
            // Primary Key
            this.HasKey(t => t.SpotId);

            // Properties
            this.Property(t => t.ContestId)
                .IsRequired()
                .HasMaxLength(35);

            // Table & Column Mappings
            this.ToTable("Spot");
            this.Property(t => t.SpotId).HasColumnName("SpotId");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.CallSignId).HasColumnName("CallSignId");
            this.Property(t => t.SpoterCallSignId).HasColumnName("SpoterCallSignId");
            this.Property(t => t.SpotDateTime).HasColumnName("SpotDateTime");
            this.Property(t => t.Frequency).HasColumnName("Frequency");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.Spots)
                .HasForeignKey(d => d.CallSignId);
            this.HasRequired(t => t.CallSign1)
                .WithMany(t => t.Spots1)
                .HasForeignKey(d => d.SpoterCallSignId);
            this.HasRequired(t => t.Contest)
                .WithMany(t => t.Spots)
                .HasForeignKey(d => d.ContestId);

        }
    }
}
