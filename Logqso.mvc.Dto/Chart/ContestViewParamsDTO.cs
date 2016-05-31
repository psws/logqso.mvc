using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace Logqso.mvc.Dto.Chart
{
    [Serializable()]
    public class ContestViewParmsDTO
    {

        public string sChartFunction { get; set; }
        public string SerTablename { get; set; }
        public string sIntvTime { get; set; }
        public string sQCnt { get; set; }
        public string sQCnt2 { get; set; }
        public string sQCnt3 { get; set; }
        public string sTitle { get; set; }
        public string sYAxis { get; set; }
        public string sQSOQuery { get; set; }
        public bool bSum { get; set; }

        public ContestViewParmsDTO(string sChartFunction, string SerTablename, string sIntvTime,
            string sQCnt, string sTitle, string sYAxis, string sQSOQuery, bool bSum)
        {
            this.sChartFunction = sChartFunction;
            this.SerTablename = SerTablename;
            this.sIntvTime = sIntvTime;
            this.sQCnt = sQCnt;
            this.sTitle = sTitle;
            this.sYAxis = sYAxis;
            this.sQSOQuery = sQSOQuery;
            this.bSum = bSum;
        }

        public ContestViewParmsDTO()
        {
        }
    }
}
