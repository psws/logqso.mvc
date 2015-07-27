using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;


namespace Logqso.mvc.Exceptions
{
    [Serializable]
    public class LogNotFoundException : System.Exception, ISerializable
    {
        public int LogID { get; set; }

        public LogNotFoundException() : base() { }

        public LogNotFoundException(string message) : base(message) { }

        public LogNotFoundException(string message, Exception inner) : base(message, inner) { }



        public LogNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context) {
            if (info != null)
            {
                this.LogID = (int)info.GetValue("LogID", typeof(int));
            }
        }
        //for serialization
        public override void GetObjectData(SerializationInfo info,StreamingContext context)
        {
            base.GetObjectData(info, context);

            if (info != null)
            {
                info.AddValue("LogID", this.LogID);
            }
        }

    }
}
