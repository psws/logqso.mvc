using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.LogData.Models.Mapping
{
    public class CallSignMap : EntityTypeConfiguration<CallSign>
    {
        public CallSignMap()
        {
            // Primary Key
            this.HasKey(t => t.CallSignId);

            // Properties
            this.Property(t => t.Call)
                .IsRequired()
                .HasMaxLength(20);

            this.Property(t => t.Prefix)
                .IsRequired()
                .HasMaxLength(10);

            // Table & Column Mappings
            this.ToTable("CallSign");
            this.Property(t => t.CallSignId).HasColumnName("CallSignId");
            this.Property(t => t.Call).HasColumnName("Call");
            this.Property(t => t.Prefix).HasColumnName("Prefix");
            this.Property(t => t.ContinentEnum).HasColumnName("ContinentEnum");
            this.Property(t => t.Accuracy).HasColumnName("Accuracy");
            this.Property(t => t.Latitude).HasColumnName("Latitude");
            this.Property(t => t.Longitude).HasColumnName("Longitude");
            this.Property(t => t.GeoCodeChk).HasColumnName("GeoCodeChk");
        }
    }
}
