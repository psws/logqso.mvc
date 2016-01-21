using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class QsoMap : EntityTypeConfiguration<Qso>
    {
        public QsoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.QsoNo, t.LogId });

            // Properties
            this.Property(t => t.QsoNo)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.LogId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.StationName)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Qso");
            this.Property(t => t.QsoNo).HasColumnName("QsoNo");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.StationName).HasColumnName("StationName");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.QsoDateTime).HasColumnName("QsoDateTime");
            this.Property(t => t.RxRst).HasColumnName("RxRst");
            this.Property(t => t.TxRst).HasColumnName("TxRst");
            this.Property(t => t.QsoModeTypeEnum).HasColumnName("QsoModeTypeEnum");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.CallsignId);
            this.HasRequired(t => t.Log)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.LogId);
            this.HasRequired(t => t.QsoModeType)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.QsoModeTypeEnum);

        }
    }
}
