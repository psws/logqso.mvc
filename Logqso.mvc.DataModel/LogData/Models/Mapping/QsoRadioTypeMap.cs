using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class QsoRadioTypeMap : EntityTypeConfiguration<QsoRadioType>
    {
        public QsoRadioTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.QsoRadioTypeEnum);

            // Properties
            this.Property(t => t.QsoRadioTypeEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.QsoRadioTypeName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("QsoRadioType");
            this.Property(t => t.QsoRadioTypeEnum).HasColumnName("QsoRadioTypeEnum");
            this.Property(t => t.QsoRadioTypeName).HasColumnName("QsoRadioTypeName");
        }
    }
}
