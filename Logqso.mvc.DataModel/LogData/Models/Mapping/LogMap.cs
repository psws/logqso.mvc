using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;


namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class LogMap : EntityTypeConfiguration<Log>
    {
        public LogMap()
        {
            // Primary Key
            this.HasKey(t => t.LogId);

            // Properties
            this.Property(t => t.ContestId)
                .HasMaxLength(35);

            this.Property(t => t.QsoDatabaseServerInstance)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.QsoDatabaseInstance)
                .IsRequired()
                .HasMaxLength(100);

            this.Property(t => t.QsoDatabaseTableName)
                .IsRequired()
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("Log");
            this.Property(t => t.LogId).HasColumnName("LogId");
            this.Property(t => t.ContestYear).HasColumnName("ContestYear");
            this.Property(t => t.CallsignId).HasColumnName("CallsignId");
            this.Property(t => t.ContestId).HasColumnName("ContestId");
            this.Property(t => t.LogCategoryId).HasColumnName("LogCategoryId");
            this.Property(t => t.QsoExchangeNumber).HasColumnName("QsoExchangeNumber");
            this.Property(t => t.QsoDatabaseServerInstance).HasColumnName("QsoDatabaseServerInstance");
            this.Property(t => t.QsoDatabaseInstance).HasColumnName("QsoDatabaseInstance");
            this.Property(t => t.QsoDatabaseTableName).HasColumnName("QsoDatabaseTableName");
            this.Property(t => t.CabrilloInfoID).HasColumnName("CabrilloInfoID");
            this.Property(t => t.WintestDataID).HasColumnName("WintestDataID");
            this.Property(t => t.N1mmDataID).HasColumnName("N1mmDataID");

            // Relationships
            this.HasOptional(t => t.CabrilloInfo)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.CabrilloInfoID);
            this.HasRequired(t => t.CallSign)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.CallsignId);
            this.HasOptional(t => t.Contest)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.ContestId);
            this.HasRequired(t => t.LogCategory)
                .WithMany(t => t.Logs)
                .HasForeignKey(d => d.LogCategoryId);

        }
    }
}
