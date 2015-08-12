using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class FiltBandMap : EntityTypeConfiguration<FiltBand>
    {
        public FiltBandMap()
        {
            // Primary Key
            this.HasKey(t => t.FiltBnd);

            // Properties
            this.Property(t => t.FiltBnd)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.FiltBandName)
                .IsRequired()
                .HasMaxLength(4);

            // Table & Column Mappings
            this.ToTable("FiltBand");
            this.Property(t => t.FiltBnd).HasColumnName("FiltBnd");
            this.Property(t => t.FiltBandName).HasColumnName("FiltBandName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
