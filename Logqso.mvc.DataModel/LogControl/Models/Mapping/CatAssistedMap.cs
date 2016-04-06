using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class CatAssistedMap : EntityTypeConfiguration<CatAssisted>
    {
        public CatAssistedMap()
        {
            // Primary Key
            this.HasKey(t => t.CatAssistedEnum);

            // Properties
            this.Property(t => t.CatAssistedEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatAssistedName)
                .IsRequired()
                .HasMaxLength(15);

            // Table & Column Mappings
            this.ToTable("CatAssisted");
            this.Property(t => t.CatAssistedEnum).HasColumnName("CatAssistedEnum");
            this.Property(t => t.CatAssistedName).HasColumnName("CatAssistedName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
