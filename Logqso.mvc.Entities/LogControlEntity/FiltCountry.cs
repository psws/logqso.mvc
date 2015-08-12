using System;
using System.Collections.Generic;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class FiltCountry : Entity
    {
        public int Id { get; set; }
        public string Prefix { get; set; }
        public string CountryName { get; set; }
    }
}
