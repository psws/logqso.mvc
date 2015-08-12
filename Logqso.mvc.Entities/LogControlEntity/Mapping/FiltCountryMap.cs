using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class FiltCountryMap : EntityTypeConfiguration<FiltCountry>
    {
        public FiltCountryMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.Prefix)
                .IsRequired()
                .HasMaxLength(8);

            this.Property(t => t.CountryName)
                .IsRequired()
                .HasMaxLength(24);

            // Table & Column Mappings
            this.ToTable("FiltCountry");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Prefix).HasColumnName("Prefix");
            this.Property(t => t.CountryName).HasColumnName("CountryName");
        }
    }
}
