using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping

{
    public class QsoMap : EntityTypeConfiguration<Qso>
    {
        public QsoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.QsoId, t.LogId });

            // Properties
            this.Property(t => t.QsoId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.LogId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("Qso");
            this.Property(t => t.QsoId).HasColumnName("QsoId");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.QsoDateEime).HasColumnName("QsoDateEime");
            this.Property(t => t.RxRst).HasColumnName("RxRst");
            this.Property(t => t.TxRst).HasColumnName("TxRst");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.CallsignId);
            this.HasRequired(t => t.Log)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.LogId);

        }
    }
}
