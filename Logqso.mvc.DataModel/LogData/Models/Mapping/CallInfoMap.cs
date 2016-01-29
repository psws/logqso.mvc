using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class CallInfoMap : EntityTypeConfiguration<CallInfo>
    {
        public CallInfoMap()
        {
            // Primary Key
            this.HasKey(t => t.CallInfoId);

            // Properties
            this.Property(t => t.ContestId)
                .IsRequired()
                .HasMaxLength(35);

            this.Property(t => t.SelectedCall)
                .HasMaxLength(25);

            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.SessionName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("CallInfo");
            this.Property(t => t.CallInfoId).HasColumnName("CallInfoId");
            this.Property(t => t.CallGroup).HasColumnName("CallGroup");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.SelectedCall).HasColumnName("SelectedCall");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.SessionName).HasColumnName("SessionName");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.StationId).HasColumnName("StationId");

            // Relationships
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.CallsignId);
            this.HasRequired(t => t.Contest)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.ContestId);
            this.HasRequired(t => t.Log)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.LogId);

        }
    }
}
