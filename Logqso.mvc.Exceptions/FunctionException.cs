using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;


namespace Logqso.mvc.Exceptions
{
    [Serializable]
    public class FunctionException : Exception, ISerializable
    {
        public string Call { get; set; }

        public FunctionException() : base() { }

        public FunctionException(string message) : base(message) { }

        public FunctionException(string message, Exception inner) : base(message, inner) { }




    }
}
