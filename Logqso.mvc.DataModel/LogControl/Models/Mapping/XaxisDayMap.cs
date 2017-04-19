using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogControlEntity;

namespace Logqso.mvc.DataModel.LogControl.Models.Mapping
{
    class XaxisDayMap : EntityTypeConfiguration<XaxisDay>
    {
        public XaxisDayMap()
        {
            // Primary Key
            this.HasKey(t => t.Xaxisday);

            // Properties
            this.Property(t => t.Xaxisday);

            // Table & Column Mappings
            this.ToTable("XaxisDay");
            this.Property(t => t.Xaxisday).HasColumnName("Xaxisday");
            this.Property(t => t.Index).HasColumnName("Index");
        }
    }
}


