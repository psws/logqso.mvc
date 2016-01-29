using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;


namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    public class YaxisFunctionMap : EntityTypeConfiguration<YaxisFunction>
    {
        public YaxisFunctionMap()
        {
            // Primary Key
            this.HasKey(t => t.YaxisFuncName);

            // Properties
            this.Property(t => t.YaxisFuncName)
                .IsRequired()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("YaxisFunction");
            this.Property(t => t.YaxisFuncName).HasColumnName("YaxisFuncName");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}
