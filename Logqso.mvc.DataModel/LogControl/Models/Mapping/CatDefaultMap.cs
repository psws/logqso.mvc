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
            this.HasKey(t => new { t.Id, t.CatOpr, t.CatAssist, t.CatBnd, t.CatTx, t.CatPwr, t.UserName });

            // Properties
            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            this.Property(t => t.CatOpr)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatAssist)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatBnd)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatTx)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatPwr)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("CatDefault");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.CatOpr).HasColumnName("CatOpr");
            this.Property(t => t.CatAssist).HasColumnName("CatAssist");
            this.Property(t => t.CatBnd).HasColumnName("CatBnd");
            this.Property(t => t.CatTx).HasColumnName("CatTx");
            this.Property(t => t.CatPwr).HasColumnName("CatPwr");
            this.Property(t => t.UserName).HasColumnName("UserName");

            // Relationships
            this.HasRequired(t => t.CatAssisted)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatAssist);
            this.HasRequired(t => t.CatBand)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatBnd);
            this.HasRequired(t => t.CatNoOfTx)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatTx);
            this.HasRequired(t => t.CatOperator)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatOpr);
            this.HasRequired(t => t.CatPower)
                .WithMany(t => t.CatDefaults)
                .HasForeignKey(d => d.CatPwr);

        }
    }
}
