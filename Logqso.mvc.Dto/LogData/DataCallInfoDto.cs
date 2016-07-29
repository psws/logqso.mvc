using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common;
using Logqso.mvc.Dto.Interfaces;

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
        public Logqso.mvc.common.Enum.QsoRadioTypeEnum QsoRadioType { get; set; }
        public int LogId { get; set; }
        public bool Disabled { get; set; }
        public ICollection<StationNamestype> StationNames { get; set; }
        public ICollection<ContestNamestype> ContestNames { get; set; }
        public ICollection<RadioNamestype> RadioNames { get; set; }
    };


    public class ContestNamestype
    {
        public string key;
        public string value;
    };
    public class StationNamestype
    {
        public StationNamestype(int key, string value)
        {
            this.key = key;
            this.value = value;
        }
        public StationNamestype()
        {
        }

        public int key;
        public string value;
    };
    public class RadioNamestype
    {
        public RadioNamestype()
        {
            disabled = false;
        }
        public int key;
        public string value;
        public bool disabled;
    };


}
