using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common;

namespace Logqso.mvc.Dto.LogData
{
    public class DataCallInfoDto
    {
        public DataCallInfoDto()
        {

        }

        public string SelectedContestName { get; set; }
        public string SelectedCall { get; set; }
        public string SelectedStationName { get; set; }
        public Logqso.mvc.common.Enum.CallGroupEnum CallGroup { get; set; }
        public int LogId { get; set; }
        public bool Disabled { get; set; }
        public ICollection<string> StationNames { get; set; }
        public ICollection<string> ContestNames { get; set; }
    };

}
