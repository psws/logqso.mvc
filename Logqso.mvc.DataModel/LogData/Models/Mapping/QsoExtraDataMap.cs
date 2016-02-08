using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class QsoExtraDataMap : EntityTypeConfiguration<QsoExtraData>
    {
        public QsoExtraDataMap()
        {
            // Primary Key
            this.HasKey(t => new { t.QsoNo, t.LogId });

            // Properties
            this.Property(t => t.QsoNo)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.LogId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.QsoExtraDataValue)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("QsoExtraData");
            this.Property(t => t.QsoNo).HasColumnName("QsoNo");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.QsoExtraDataValue).HasColumnName("QsoExtraDataValue");

            // Relationships
            this.HasRequired(t => t.Qso)
                .WithOptional(t => t.QsoExtraData);

        }
    }
}
