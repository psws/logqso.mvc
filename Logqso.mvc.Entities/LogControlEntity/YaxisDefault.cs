using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogControlEntity
{
    public partial class YaxisDefault : Entity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string YaxisFuncName { get; set; }
        public string YaxisIntvVal { get; set; }
        public string YaxisViewTypeName { get; set; }
        public virtual YaxisFunction YaxisFunction { get; set; }
        public virtual YaxisInterval YaxisInterval { get; set; }
    }
}
