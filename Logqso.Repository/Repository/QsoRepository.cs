using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.Repository.Interfaces;
using Logqso.mvc.DataModel.LogData.DataModels;
using Logqso.Repository.Repository;
using System.Data.SqlClient;
using System.Data;
using Repository.Pattern.Repositories;
using System.Data.Entity;

namespace Logqso.Repository
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
                QsoNo = 1,
                QsoDateTime = DateTime.Now,
                RxRst = 59,
                TxRst = 59

            };
            return Qso;
        }
    }
}
