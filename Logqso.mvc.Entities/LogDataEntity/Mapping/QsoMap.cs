using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping
{
    public class QsoMap : EntityTypeConfiguration<Qso>
    {
        public QsoMap()
        {
            // Primary Key
            this.HasKey(t => t.QsoId);

            // Properties
            this.Property(t => t.StationName)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Qso");
            this.Property(t => t.QsoId).HasColumnName("QsoId");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.StationName).HasColumnName("StationName");
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
