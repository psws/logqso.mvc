using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
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
