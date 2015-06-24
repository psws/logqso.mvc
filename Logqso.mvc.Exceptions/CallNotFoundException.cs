using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;


namespace Logqso.mvc.Exceptions
{
    [Serializable]
    public class CallNotFoundException : Exception, ISerializable
    {
        public string Call { get; set; }

        public CallNotFoundException() : base() { }

        public CallNotFoundException(string message) : base(message) { }

        public CallNotFoundException(string message, Exception inner) : base(message, inner) { }



        public CallNotFoundException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
            if (info != null)
            {
                this.Call = (string)info.GetValue("Call", typeof(string));
            }
        }
        //for serialization
        public override void GetObjectData(SerializationInfo info,StreamingContext context)
        {
            base.GetObjectData(info, context);

            if (info != null)
            {
                info.AddValue("Call", this.Call);
            }
        }

    }
}
