using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.Interfaces;
using Logqso.mvc.DataModel.LogData;


namespace Logqso.mvc.persistance
{
    public class QsoRepository : IQsoRepository
    {
        //TODO stubed out. replace by DB call

        public Qso CreateQso(int LogID) 
        {
            Qso Qso = new Qso
            {
                LogId = LogID,
                CallsignId = 2,
                QsoId = 1,
                QsoDateEime = DateTime.Now,
                RxRst = 59,
                TxRst = 59

            };
            return Qso;
        }

    }
}
