using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Dto;
using Logqso.mvc.common.Interfaces;

namespace Logqso.mvc.domain
{
    public class QsoService
    {
        private readonly IQsoRepository _QsoRepository;

        public QsoService(IQsoRepository QsoRepository)
        {
            _QsoRepository = QsoRepository;

        }

       public Qso CreateQso(Guid LogID)
        {
            QsoDto QsoDto = null;
            Qso Qso = null;
            // dependency injection

            QsoDto = _QsoRepository.CreateQso( LogID);

            if (QsoDto == null)
            {
                //LogNotFoundException LogNotFoundException = new LogNotFoundException("Log does not exist for ");
                //LogNotFoundException.LogID = LogID;
                //throw LogNotFoundException;
            }
            else
            {
                Qso = AutoMapper.Mapper.Map<QsoDto, Qso>(QsoDto);
            }
            return Qso;

        }
    }
}
