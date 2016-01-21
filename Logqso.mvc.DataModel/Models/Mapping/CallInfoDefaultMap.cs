using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class CallInfoDefaultMap : EntityTypeConfiguration<CallInfoDefault>
    {
        public CallInfoDefaultMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            // Properties
            this.Property(t => t.UserName)
                .IsRequired()
                .HasMaxLength(256);

            this.Property(t => t.SessionName)
                .IsRequired()
                .HasMaxLength(256);

            // Table & Column Mappings
            this.ToTable("CallInfoDefault");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.UserName).HasColumnName("UserName");
            this.Property(t => t.SessionName).HasColumnName("SessionName");
        }
    }
}
