using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class UbnNotInLogMap : EntityTypeConfiguration<UbnNotInLog>
    {
        public UbnNotInLogMap()
        {
            // Primary Key
            this.HasKey(t => new { t.QsoNo, t.LogId });

            // Properties
            this.Property(t => t.QsoNo)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.LogId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Table & Column Mappings
            this.ToTable("UbnNotInLog");
            this.Property(t => t.QsoNo).HasColumnName("QsoNo");
            this.Property(t => t.LogId).HasColumnName("LogId");
        }
    }
}
