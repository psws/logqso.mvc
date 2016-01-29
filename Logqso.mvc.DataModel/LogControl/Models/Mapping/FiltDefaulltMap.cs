using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class FiltDefaulltMap : EntityTypeConfiguration<FiltDefault>
    {
        public FiltDefaulltMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.FiltPref)
                .IsRequired()
                .HasMaxLength(10);

            this.Property(t => t.FiltCQZoneVal)
                .IsRequired()
                .HasMaxLength(6);

            // Table & Column Mappings
            this.ToTable("FiltDefaullt");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.FiltBnd).HasColumnName("FiltBnd");
            this.Property(t => t.FiltCont).HasColumnName("FiltCont");
            this.Property(t => t.FiltPref).HasColumnName("FiltPref");
            this.Property(t => t.FiltCQZoneVal).HasColumnName("FiltCQZoneVal");

            // Relationships
            this.HasRequired(t => t.FiltBand)
                .WithMany(t => t.FiltDefaullts)
                .HasForeignKey(d => d.FiltBnd);
            this.HasRequired(t => t.FiltContinent)
                .WithMany(t => t.FiltDefaullts)
                .HasForeignKey(d => d.FiltCont);
            this.HasRequired(t => t.FiltCQZone)
                .WithMany(t => t.FiltDefaullts)
                .HasForeignKey(d => d.FiltCQZoneVal);
            this.HasRequired(t => t.FiltPrefix)
                .WithMany(t => t.FiltDefaullts)
                .HasForeignKey(d => d.FiltPref);

        }
    }
}
