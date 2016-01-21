using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
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

            // Table & Column Mappings
            this.ToTable("CallSign");
            this.Property(t => t.CallSignId).HasColumnName("CallSignId");
            this.Property(t => t.Call).HasColumnName("Call");
            this.Property(t => t.Continent).HasColumnName("Continent");
        }
    }
}
