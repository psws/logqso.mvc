using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.Repository.Models.LogControl
{
    public class ControlYaxisSettingsEntity
    {
        public string YaxisFunction { get; set; }
        public int YaxisFunctionIndex { get; set; }
        public string YaxisInterval { get; set; }
        public string YaxisViewType { get; set; }
    }
}
