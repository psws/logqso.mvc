using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class CatBandMap : EntityTypeConfiguration<CatBand>
    {
        public CatBandMap()
        {
            // Primary Key
            this.HasKey(t => t.CatBnd);

            // Properties
            this.Property(t => t.CatBnd)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatBandName)
                .IsRequired()
                .HasMaxLength(4);

            // Table & Column Mappings
            this.ToTable("CatBand");
            this.Property(t => t.CatBnd).HasColumnName("CatBnd");
            this.Property(t => t.CatBandName).HasColumnName("CatBandName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
