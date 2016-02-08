using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class SessionMap : EntityTypeConfiguration<Session>
    {
        public SessionMap()
        {
            // Primary Key
            this.HasKey(t => t.SessionName);

            // Properties
            this.Property(t => t.SessionName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("Session");
            this.Property(t => t.SessionName).HasColumnName("SessionName");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.SessionDateTime).HasColumnName("SessionDateTime");
            this.Property(t => t.CategorySettings).HasColumnName("CategorySettings");
            this.Property(t => t.FiltersSettings).HasColumnName("FiltersSettings");
            this.Property(t => t.XaxisSettings).HasColumnName("XaxisSettings");
            this.Property(t => t.YaxisSettings).HasColumnName("YaxisSettings");
            this.Property(t => t.Subscription).HasColumnName("Subscription");
        }
    }
}
