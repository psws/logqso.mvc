using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.Dto.LogData
{
    public class DataCallInfoObjDto
    {
        public DataCallInfoObjDto()
        {
            DataCallInfos = new DataCallInfoDto[3];
        }

        public string SessionName {get; set;}
        public DataCallInfoDto[] DataCallInfos {get; set; }

    }
}
