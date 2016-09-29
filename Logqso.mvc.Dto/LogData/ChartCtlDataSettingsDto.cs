using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogControl;

namespace Logqso.mvc.Dto.LogData
{
    public class ChartCtlDataSettingsDto
    {
        public DataCallInfoDto[] DataCallInfoDto { get; set; }
        public ControlSettingsDto ControlSettingsDto { get; set; }
    }

    public class ControlSettingsDto
    {
        bool force;
        public ControlCategorySettingsDto ControlCategorySettingsDto { get; set; }
        public ControlFiltersSettingsDto ControlFiltersSettingsDto { get; set; }
        public ControlXaxisSettingsDto ControlXaxisSettingsDto { get; set; }
        public ControlYaxisSettingsDto ControlYaxisSettingsDto { get; set; }
    }

    //public class DataCallSetting
    //{
    //    public string SelectedContestName { get; set; }
    //    public string SelectedCall { get; set; }
    //    public string SelectedStationName { get; set; }
    //    public Logqso.mvc.common.Enum.CallGroupEnum CallGroup { get; set; }
    //    public Logqso.mvc.common.Enum.QsoRadioTypeEnum QsoRadioType { get; set; }
    //    //public int CallGroup { get; set; }
    //    //public int QsoRadioType { get; set; }
    //    public int LogId { get; set; }
    //    public bool Disabled { get; set; }
    //    public ICollection<StationNamestype> StationNames { get; set; }
    //    public ICollection<ContestNamestype> ContestNames { get; set; }
    //    public ICollection<RadioNamestype> RadioNames { get; set; }

    //}

    public class dataCallObjDTO
    {
        public dataCallObjDTO()
        {

        }
        public DataCallInfoDto DataCallInfoDto { get; set; }
        public ControlCategorySettingsDto ControlCategorySettingsDto { get; set; }
        public string CallTab { get; set; }
    }


     public class DataCalls
     {
         public Logqso.mvc.common.Enum.CallGroupEnum CallGroup { get; set; }
         public string SelectedCall  { get; set; }
         public ICollection<CallGroupCall> Calls { get; set; }
     }

    public class CallGroupCall
    {
        public int CallSignID { get; set; }
        public string Call { get; set; }
    }

    public class ChartQsoRateDTO
    {
        public DateTime IntvTime { get; set; }
        public int N { get; set; }
        public int Mults { get; set; }
        public int Points { get; set; }
    };




}
