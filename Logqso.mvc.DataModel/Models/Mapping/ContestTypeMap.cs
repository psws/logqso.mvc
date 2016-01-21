using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class ContestTypeMap : EntityTypeConfiguration<ContestType>
    {
        public ContestTypeMap()
        {
            // Primary Key
            this.HasKey(t => t.ContestTypeEnum);

            // Properties
            this.Property(t => t.ContestTypeEnum)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ContestTypeEnumName)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.QsoExchangeName)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.QsoMultName)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.QsoMult2Name)
                .HasMaxLength(20);

            this.Property(t => t.ExtraDataName)
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("ContestType");
            this.Property(t => t.ContestTypeEnum).HasColumnName("ContestTypeEnum");
            this.Property(t => t.ContestTypeEnumName).HasColumnName("ContestTypeEnumName");
            this.Property(t => t.QsoExchangeTypeEnum).HasColumnName("QsoExchangeTypeEnum");
            this.Property(t => t.QsoExchangeName).HasColumnName("QsoExchangeName");
            this.Property(t => t.QsoMultName).HasColumnName("QsoMultName");
            this.Property(t => t.QsoMult2Name).HasColumnName("QsoMult2Name");
            this.Property(t => t.ExtraDataName).HasColumnName("ExtraDataName");

            // Relationships
            this.HasRequired(t => t.QsoExchangeType)
                .WithMany(t => t.ContestTypes)
                .HasForeignKey(d => d.QsoExchangeTypeEnum);

        }
    }
}
