using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.Entities.LogDataEntity.Mapping
{
    public class CallInfoMap : EntityTypeConfiguration<CallInfo>
    {
        public CallInfoMap()
        {
            // Primary Key
            this.HasKey(t => t.CallInfoId);

            // Properties
            this.Property(t => t.StationName)
                .HasMaxLength(20);

            this.Property(t => t.ContestId)
                .IsRequired()
                .HasMaxLength(25);

            this.Property(t => t.Call)
                .HasMaxLength(25);

            // Table & Column Mappings
            this.ToTable("CallInfo");
            this.Property(t => t.StationId).HasColumnName("StationId");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.StationName).HasColumnName("StationName");
            this.Property(t => t.CallInfoId).HasColumnName("CallInfoId");
            this.Property(t => t.CallGroup).HasColumnName("CallGroup");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.Call).HasColumnName("Call");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.CallInfoDefault_Id).HasColumnName("CallInfoDefault_Id");

            // Relationships
            this.HasOptional(t => t.CallInfoDefault)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.CallInfoDefault_Id);
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.CallsignId);
            this.HasRequired(t => t.Contest)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => d.ContestId);
            this.HasOptional(t => t.Station)
                .WithMany(t => t.CallInfoes)
                .HasForeignKey(d => new { d.StationId, d.LogId, d.StationName });

        }
    }
}
