using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;


namespace Logqso.mvc.DataModel.Models.Mapping
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
            this.Property(t => t.CallInfo1Id).HasColumnName("CallInfo1Id");
            this.Property(t => t.CallInfo2Id).HasColumnName("CallInfo2Id");
            this.Property(t => t.CallInfo3Id).HasColumnName("CallInfo3Id");
            this.Property(t => t.SessionName).HasColumnName("SessionName");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.SessionDateTime).HasColumnName("SessionDateTime");
            this.Property(t => t.ControlCategorySettingsEntity).HasColumnName("ControlCategorySettingsEntity");
            this.Property(t => t.ControlFiltersSettingsEntity).HasColumnName("ControlFiltersSettingsEntity");
            this.Property(t => t.ControlXaxisSettingsEntity).HasColumnName("ControlXaxisSettingsEntity");
            this.Property(t => t.ControlYaxisSettingsEntity).HasColumnName("ControlYaxisSettingsEntity");
            this.Property(t => t.Subscription).HasColumnName("Subscription");

            // Relationships
            this.HasOptional(t => t.CallInfo)
                .WithMany(t => t.Sessions)
                .HasForeignKey(d => d.CallInfo1Id);
            this.HasOptional(t => t.CallInfo1)
                .WithMany(t => t.Sessions1)
                .HasForeignKey(d => d.CallInfo2Id);
            this.HasOptional(t => t.CallInfo2)
                .WithMany(t => t.Sessions2)
                .HasForeignKey(d => d.CallInfo3Id);

        }
    }
}
