using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class FiltContinentMap : EntityTypeConfiguration<FiltContinent>
    {
        public FiltContinentMap()
        {
            // Primary Key
            this.HasKey(t => t.FiltCont);

            // Properties
            this.Property(t => t.FiltCont)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.FiltContName)
                .IsRequired()
                .HasMaxLength(3);

            // Table & Column Mappings
            this.ToTable("FiltContinent");
            this.Property(t => t.FiltCont).HasColumnName("FiltCont");
            this.Property(t => t.FiltContName).HasColumnName("FiltContName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
