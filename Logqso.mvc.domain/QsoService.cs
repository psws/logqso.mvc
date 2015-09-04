using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Interfaces;


namespace Logqso.mvc.domain
{
    public class QsoService
    {
        private readonly IQsoRepository _QsoRepository;

        public QsoService(IQsoRepository QsoRepository)
        {
            _QsoRepository = QsoRepository;

        }

        public QsoEntity CreateQso(int LogID)
        {
            QsoEntity QsoEntity = null;
            Qso Qso = null;
            // dependency injection

            Qso = _QsoRepository.CreateQso( LogID);

            if (Qso == null)
            {
                //LogNotFoundException LogNotFoundException = new LogNotFoundException("Log does not exist for ");
                //LogNotFoundException.LogID = LogID;
                //throw LogNotFoundException;
            }
            else
            {
                QsoEntity = AutoMapper.Mapper.Map<Qso, QsoEntity>(Qso);
            }
            return QsoEntity;

        }
    }
}
