using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;
using Logqso.mvc.Entities.LogDataEntity;

namespace Logqso.mvc.DataModel.Models.Mapping
{
    public class CabrilloInfoMap : EntityTypeConfiguration<CabrilloInfo>
    {
        public CabrilloInfoMap()
        {
            // Primary Key
            this.HasKey(t => t.CabrilloInfoId);

            // Properties
            this.Property(t => t.Club)
                .HasMaxLength(20);

            this.Property(t => t.Operators)
                .HasMaxLength(200);

            this.Property(t => t.Address)
                .HasMaxLength(200);

            this.Property(t => t.AddressCity)
                .HasMaxLength(100);

            this.Property(t => t.AddressState)
                .HasMaxLength(100);

            this.Property(t => t.AddressPostalCode)
                .HasMaxLength(50);

            this.Property(t => t.AddressCountry)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("CabrilloInfo");
            this.Property(t => t.CabrilloInfoId).HasColumnName("CabrilloInfoId");
            this.Property(t => t.ClaimedScore).HasColumnName("ClaimedScore");
            this.Property(t => t.Club).HasColumnName("Club");
            this.Property(t => t.Operators).HasColumnName("Operators");
            this.Property(t => t.Address).HasColumnName("Address");
            this.Property(t => t.AddressCity).HasColumnName("AddressCity");
            this.Property(t => t.AddressState).HasColumnName("AddressState");
            this.Property(t => t.AddressPostalCode).HasColumnName("AddressPostalCode");
            this.Property(t => t.AddressCountry).HasColumnName("AddressCountry");
        }
    }
}
