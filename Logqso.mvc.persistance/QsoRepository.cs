using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;
using Logqso.mvc.common.Interfaces;

namespace Logqso.mvc.persistance
{
    public class QsoRepository : IQsoRepository
    {
        //TODO stubed out. replace by DB call

        public QsoDto CreateQso(Guid LogID) 
        {
            QsoDto QsoDto = new QsoDto
            {
                LogID = LogID,
                CallsignID = null,
                QsoID = 1,
                QsoDateEime = DateTime.Now,
                RxRst = 59,
                TxRst = 59

            };
            return QsoDto;
        }

    }
}
