using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;


namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class ContestMap : EntityTypeConfiguration<Contest>
    {
        public ContestMap()
        {
            // Primary Key
            this.HasKey(t => t.ContestId);

            // Properties
            this.Property(t => t.ContestId)
                .IsRequired()
                .HasMaxLength(35);

            this.Property(t => t.ContestName)
                .IsRequired()
                .HasMaxLength(30);

            // Table & Column Mappings
            this.ToTable("Contest");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.ContestName).HasColumnName("ContestName");
            this.Property(t => t.ContestTypeEnum).HasColumnName("ContestTypeEnum");
            this.Property(t => t.QsoModeTypeEnum).HasColumnName("QsoModeTypeEnum");
            this.Property(t => t.StartDateTime).HasColumnName("StartDateTime");
            this.Property(t => t.EndDateTime).HasColumnName("EndDateTime");

            // Relationships
            this.HasRequired(t => t.ContestType)
                .WithMany(t => t.Contests)
                .HasForeignKey(d => d.ContestTypeEnum);
            this.HasRequired(t => t.QsoModeType)
                .WithMany(t => t.Contests)
                .HasForeignKey(d => d.QsoModeTypeEnum);

        }
    }
}
