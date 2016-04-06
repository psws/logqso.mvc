using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class CatBandMap : EntityTypeConfiguration<CatBand>
    {
        public CatBandMap()
        {
            // Primary Key
            this.HasKey(t => t.CatBandEnum);

            // Properties
            this.Property(t => t.CatBandEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatBandName)
                .IsRequired()
                .HasMaxLength(4);

            // Table & Column Mappings
            this.ToTable("CatBand");
            this.Property(t => t.CatBandEnum).HasColumnName("CatBandEnum");
            this.Property(t => t.CatBandName).HasColumnName("CatBandName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
