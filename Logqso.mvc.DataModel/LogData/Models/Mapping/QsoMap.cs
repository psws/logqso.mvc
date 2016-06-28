using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace  Logqso.mvc.DataModel.LogData.Models.Mapping
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
            this.Property(t => t.Frequency).HasColumnName("Frequency");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.QsoDateTime).HasColumnName("QsoDateTime");
            this.Property(t => t.RxRst).HasColumnName("RxRst");
            this.Property(t => t.TxRst).HasColumnName("TxRst");
            this.Property(t => t.QsoExchangeNumber).HasColumnName("QsoExchangeNumber");
            this.Property(t => t.QsoModeTypeEnum).HasColumnName("QsoModeTypeEnum");
            this.Property(t => t.QsoRadioTypeEnum).HasColumnName("QsoRadioTypeEnum");
            this.Property(t => t.QZoneMult).HasColumnName("QZoneMult");
            this.Property(t => t.QCtyMult).HasColumnName("QCtyMult");
            this.Property(t => t.QPrefixMult).HasColumnName("QPrefixMult");
            this.Property(t => t.QPts1).HasColumnName("QPts1");
            this.Property(t => t.QPts2).HasColumnName("QPts2");
            this.Property(t => t.QPts4).HasColumnName("QPts4");
            this.Property(t => t.QPts8).HasColumnName("QPts8");

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
            this.HasRequired(t => t.QsoRadioType)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => d.QsoRadioTypeEnum);
            this.HasOptional(t => t.Station)
                .WithMany(t => t.Qsoes)
                .HasForeignKey(d => new { d.LogId, d.StationName });

        }
    }
}
