using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping
{
    public class SessionMap : EntityTypeConfiguration<Session>
    {
        public SessionMap()
        {
            // Primary Key
            this.HasKey(t => t.UserName);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("Session");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.ControlCategorySettingsEntity).HasColumnName("ControlCategorySettingsEntity");
            this.Property(t => t.ControlFiltersSettingsEntity).HasColumnName("ControlFiltersSettingsEntity");
            this.Property(t => t.ControlXaxisSettingsEntity).HasColumnName("ControlXaxisSettingsEntity");
            this.Property(t => t.ControlYaxisSettingsEntity).HasColumnName("ControlYaxisSettingsEntity");
            this.Property(t => t.CallInfo1).HasColumnName("CallInfo1");
            this.Property(t => t.CallInfo2).HasColumnName("CallInfo2");
            this.Property(t => t.CallInfo3).HasColumnName("CallInfo3");
            this.Property(t => t.Subscription).HasColumnName("Subscription");
        }
    }
}
