using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class FiltPrefixMap : EntityTypeConfiguration<FiltPrefix>
    {
        public FiltPrefixMap()
        {
            // Primary Key
            this.HasKey(t => t.FiltPref);

            // Properties
            this.Property(t => t.FiltPref)
                .IsRequired()
                .HasMaxLength(10);

            this.Property(t => t.CountryName)
                .IsRequired()
                .HasMaxLength(24);

            // Table & Column Mappings
            this.ToTable("FiltPrefix");
            this.Property(t => t.FiltPref).HasColumnName("FiltPref");
            this.Property(t => t.CountryName).HasColumnName("CountryName");
        }
    }
}
