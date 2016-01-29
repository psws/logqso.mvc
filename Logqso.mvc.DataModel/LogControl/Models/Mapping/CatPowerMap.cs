using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class CatPowerMap : EntityTypeConfiguration<CatPower>
    {
        public CatPowerMap()
        {
            // Primary Key
            this.HasKey(t => t.CatPwr);

            // Properties
            this.Property(t => t.CatPwr)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatPowerName)
                .IsRequired()
                .HasMaxLength(6);

            // Table & Column Mappings
            this.ToTable("CatPower");
            this.Property(t => t.CatPwr).HasColumnName("CatPwr");
            this.Property(t => t.CatPowerName).HasColumnName("CatPowerName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
