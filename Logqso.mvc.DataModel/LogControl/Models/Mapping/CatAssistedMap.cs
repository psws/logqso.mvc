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
            this.HasKey(t => t.CatAssist);

            // Properties
            this.Property(t => t.CatAssist)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatAssistedName)
                .IsRequired()
                .HasMaxLength(15);

            // Table & Column Mappings
            this.ToTable("CatAssisted");
            this.Property(t => t.CatAssist).HasColumnName("CatAssist");
            this.Property(t => t.CatAssistedName).HasColumnName("CatAssistedName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
