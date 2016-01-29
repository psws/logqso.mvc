using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;


namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class QsoModeTypeMap : EntityTypeConfiguration<QsoModeType>
    {
        public QsoModeTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.QsoModeTypeEnum);

            // Properties
            this.Property(t => t.QsoModeTypeEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.QsoModeEnumName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("QsoModeType");
            this.Property(t => t.QsoModeTypeEnum).HasColumnName("QsoModeTypeEnum");
            this.Property(t => t.QsoModeEnumName).HasColumnName("QsoModeEnumName");
        }
    }
}
