using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;


namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class StationMap : EntityTypeConfiguration<Station>
    {
        public StationMap()
        {
            // Primary Key
            this.HasKey(t => new { t.StationId, t.LogId, t.StationName });

            // Properties
            this.Property(t => t.StationId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.LogId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.StationName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Station");
            this.Property(t => t.StationId).HasColumnName("StationId");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.StationName).HasColumnName("StationName");

            // Relationships
            this.HasRequired(t => t.Log)
                .WithMany(t => t.Stations)
                .HasForeignKey(d => d.LogId);

        }
    }
}
