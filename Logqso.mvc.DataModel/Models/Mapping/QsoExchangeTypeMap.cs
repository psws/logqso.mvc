using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class QsoExchangeTypeMap : EntityTypeConfiguration<QsoExchangeType>
    {
        public QsoExchangeTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.QsoExchangeTypeEnum);

            // Properties
            this.Property(t => t.QsoExchangeTypeEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.QsoExchangeTypeEnumName)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("QsoExchangeType");
            this.Property(t => t.QsoExchangeTypeEnum).HasColumnName("QsoExchangeTypeEnum");
            this.Property(t => t.QsoExchangeTypeEnumName).HasColumnName("QsoExchangeTypeEnumName");
        }
    }
}
