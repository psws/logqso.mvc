using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class CabrilloInfo : Entity
    {
        public string ContestId { get; set; }
        public int CallSignId { get; set; }
        public int ClaimedScore { get; set; }
        public string Club { get; set; }
        public string Operators { get; set; }
        public string Address { get; set; }
        public string AddressCity { get; set; }
        public string AddressState { get; set; }
        public string AddressPostalCode { get; set; }
        public string AddressCountry { get; set; }
        public virtual CallSign CallSign { get; set; }
        public virtual Contest Contest { get; set; }
    }
}
