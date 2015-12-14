using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogControlEntity.Mapping
{
    public class CatOperatorMap : EntityTypeConfiguration<CatOperator>
    {
        public CatOperatorMap()
        {
            // Primary Key
            this.HasKey(t => t.CatOpr);

            // Properties
            this.Property(t => t.CatOpr)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatOprName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("CatOperator");
            this.Property(t => t.CatOpr).HasColumnName("CatOpr");
            this.Property(t => t.CatOprName).HasColumnName("CatOprName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
