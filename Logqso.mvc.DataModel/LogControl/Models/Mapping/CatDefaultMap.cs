using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class CatDefaultMap : EntityTypeConfiguration<CatDefault>
    {
        public CatDefaultMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("CatDefault");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.CatOperatorEnum).HasColumnName("CatOperatorEnum");
            this.Property(t => t.CatAssistedEnum).HasColumnName("CatAssistedEnum");
            this.Property(t => t.CatBandEnum).HasColumnName("CatBandEnum");
            this.Property(t => t.CatNoOfTxEnum).HasColumnName("CatNoOfTxEnum");
            this.Property(t => t.CatPowerEnum).HasColumnName("CatPowerEnum");

            // Relationships
            this.HasRequired(t => t.CatAssisted)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatAssistedEnum);
            this.HasRequired(t => t.CatBand)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatBandEnum);
            this.HasRequired(t => t.CatNoOfTx)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatNoOfTxEnum);
            this.HasRequired(t => t.CatOperator)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatOperatorEnum);
            this.HasRequired(t => t.CatPower)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatPowerEnum);

        }
    }
}
