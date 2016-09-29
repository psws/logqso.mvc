using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;

namespace Logqso.mvc.Dto.LogData
{
    public class LogPageDTO
    {
            public int total {get; set;}
            public int page {get; set;}
            public ICollection<LogPageRecordDTO> records {get; set;}
            public int rows {get; set;}
            public int I1Cnt { get; set; }
            public int I2Cnt { get; set; }
            public int I3Cnt { get; set; }
    }

    public class LogPageRequestDTO
    {
    //http://vbcity.com/blogs/rock/archive/2012/10/18/asp-net-mvc-and-jqgrid-with-c-about-paging.aspx
        public string sidx { get; set; } //sort index
        public string sord { get; set; } //sort order
        public int page { get; set; }
        public int rows { get; set; }   //rows visible on grid
        public bool _search { get; set; }

        public LogPageRequestDTO()
        {

        }
    }


    public class LogPageRecordDTO
    {
            public byte W {get; set;}
            public string T {get; set;}

            public string I1 {get; set;}
            public string F1 {get; set;}
            public bool C1 {get; set;}
            public bool Z1 {get; set;}
            public bool P1 {get; set;}
            public bool U1 {get; set;}
            public bool B1 {get; set;}
            public string BC1 { get; set; } // corrected call
            public bool N1 { get; set; }
            public bool D1 {get; set;}
            public bool X1 { get; set; }
            public string XC1 { get; set; } // corrected exchange
            public string R1 { get; set; }
            public string S1 { get; set; }

            public string I2 {get; set;}
            public string F2 { get; set; }
            public bool C2 {get; set;}
            public bool Z2 {get; set;}
            public bool P2 {get; set;}
            public bool U2 {get; set;}
            public bool B2 {get; set;}
            public string BC2 { get; set; } // corrected call
            public bool N2 { get; set; }
            public bool D2 {get; set;}
            public bool X2 { get; set; }
            public string XC2 { get; set; } // corrected exchange
            public string R2 { get; set; }
            public string S2 { get; set; }

            public string I3 {get; set;}
            public string F3 { get; set; }
            public bool C3 {get; set;}
            public bool Z3 {get; set;}
            public bool P3 {get; set;}
            public bool U3 {get; set;}
            public bool B3 {get; set;}
            public string BC3 { get; set; } // corrected call
            public bool N3 { get; set; }
            public bool D3 {get; set;}
            public bool X3 { get; set; }
            public string XC3 { get; set; } // corrected exchange
            public string R3 { get; set; }
            public string S3 { get; set; }

   }
    public class LogPageRecord
    {
        public int W { get; set; } //Day
        public DateTime Time { get; set; }
        public int CGroup { get; set; }
        public short QsoNo { get; set; }
        public int logId { get; set; }
        public string Call { get; set; }
        public decimal Freq { get; set; }
        public bool C { get; set; }
        public bool Z { get; set; }
        public bool P { get; set; }
        public bool U { get; set; }
        public bool B { get; set; } //incorrect call
        public string BC { get; set; } // corrected call
        public bool N { get; set; }  //not in log
        public bool D { get; set; } //Dupes
        public bool X { get; set; } //bad exchange
        public string XC { get; set; } // corrected exchange
        public int R { get; set; }
        public string S { get; set; } //station

    }
    public class LogPageUBNRecord
    {
        public DateTime QsoDateTime { get; set; }
        public int Group { get; set; }
        public short QsoNo { get; set; }
        public int logId { get; set; }
    }

    public class LogPageUbnIncorrectCallRecord
    {
        public DateTime QsoDateTime { get; set; }
        public int Group { get; set; }
        public short QsoNo { get; set; }
        public int logId { get; set; }
        public string CorrectCall { get; set; }
    }

    public class LogPageUbnIncorrectExchangeRecord
    {
        public DateTime QsoDateTime { get; set; }
        public int Group { get; set; }
        public short QsoNo { get; set; }
        public int logId { get; set; }
        public string CorrectExchange { get; set; }
    }
    

    public class LogCtlDataSettingsDto
    {
        public DataCallInfoDto[] DataCallInfoDtos { get; set; }
        public ControlSettingsDto ControlSettingsDto { get; set; }
        public LogPageRequestDTO LogPageRequestDTO { get; set; }
    }


}
