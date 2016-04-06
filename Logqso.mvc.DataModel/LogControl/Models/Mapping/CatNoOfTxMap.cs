using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class CatNoOfTxMap : EntityTypeConfiguration<CatNoOfTx>
    {
        public CatNoOfTxMap()
        {
            // Primary Key
            this.HasKey(t => t.CatNoOfTxEnum);

            // Properties
            this.Property(t => t.CatNoOfTxEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.CatNoOfTxName)
                .IsRequired()
                .HasMaxLength(12);

            // Table & Column Mappings
            this.ToTable("CatNoOfTx");
            this.Property(t => t.CatNoOfTxEnum).HasColumnName("CatNoOfTxEnum");
            this.Property(t => t.CatNoOfTxName).HasColumnName("CatNoOfTxName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
