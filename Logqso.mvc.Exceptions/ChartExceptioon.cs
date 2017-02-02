using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;


namespace Logqso.mvc.Exceptions
{
    [Serializable]
    public class ChartException : Exception, ISerializable
    {
        public string sChartFunction { get; set; }
        public string sIntvTime { get; set; }
        public string sTitle { get; set; }
        public string sYAxis { get; set; }
        public string sQSOQuery { get; set; }
        public bool bSum { get; set; }
        public string Function { get; set; }
        public string MessageTxt { get; set; }

        public ChartException() : base() { }

        public ChartException(string message) : base(message) { }

        public ChartException(string message, Exception inner) : base(message, inner) { }



        public ChartException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
            if (info != null)
            {
                this.sChartFunction = (string)info.GetValue("sChartFunction", typeof(string));
                this.sIntvTime = (string)info.GetValue("sIntvTime", typeof(string));
                this.sTitle = (string)info.GetValue("sTitle", typeof(string));
                this.sYAxis = (string)info.GetValue("sYAxis", typeof(string));
                this.sQSOQuery = (string)info.GetValue("sQSOQuery", typeof(string));
                this.bSum = (bool)info.GetValue("bSum", typeof(bool));
                this.Function = (string)info.GetValue("Function", typeof(string));
                this.MessageTxt = (string)info.GetValue("MessageTxt", typeof(string));
            }
        }
        //for serialization
        public override void GetObjectData(SerializationInfo info,StreamingContext context)
        {
            base.GetObjectData(info, context);

            if (info != null)
            {
                info.AddValue("sChartFunction", this.sChartFunction);
                info.AddValue("sIntvTime", this.sIntvTime);
                info.AddValue("sTitle", this.sTitle);
                info.AddValue("sYAxis", this.sYAxis);
                info.AddValue("sQSOQuery", this.sQSOQuery);
                info.AddValue("bSum", this.bSum);
                info.AddValue("Function", this.Function);
                info.AddValue("MessageTxt", this.MessageTxt);
          }
        }

    }
}
