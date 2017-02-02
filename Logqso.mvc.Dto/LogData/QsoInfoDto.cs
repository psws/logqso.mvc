using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.Dto.LogData
{
    public class QsoInfoDto
    {
        public QsoInfoDto()
        {

        }

        public int W { get; set; } //Day
        public string T { get; set; }
        public string I { get; set; }
        public decimal F { get; set; }
        public short XR { get; set; } //received Zone
        public bool C { get; set; }
        public bool Z { get; set; }
        public bool P { get; set; }
        public string R { get; set; }
        public string S { get; set; } //station
        public bool U { get; set; }
        public bool B { get; set; } //incorrect call
        public string BC { get; set; } // corrected call
        public bool N { get; set; }  //not in log
        public bool D { get; set; } //Dupes
        public bool X { get; set; } //bad exchange
        public string XC { get; set; } // corrected exchange

    };


    public class QsoInfoRequest
    {
        public string  Call { get; set; }
        public decimal Frequency { get; set; }
        public int Day { get; set; }
        public string Time { get; set; }
    }


    public class QsoInfoRequestDto
    {
        public DataCallInfoDto DataCallInfoDto { get; set; }
        //public ControlSettingsDto ControlSettingsDto { get; set; }
        public QsoInfoRequest QsoInfoRequest { get; set; }
    }

}


