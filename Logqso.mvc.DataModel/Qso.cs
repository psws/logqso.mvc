using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.DataModel
{
    public class Qso
    {
        public int QsoID;
        public Guid LogID;
        public int CallsignID;
        public DateTime QsoDateEime;
        public byte RxRst;
        public byte TxRst;
    }
}
