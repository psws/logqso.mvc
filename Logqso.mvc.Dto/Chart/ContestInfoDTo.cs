using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Logqso.mvc.common.Enum;

namespace Logqso.mvc.Dto.Chart
{

    /// <summary>
    /// Summary description for ContestInfo
    /// </summary>
    public class ContestInfoDTO
    {
        public DateTime startTime { get; set; }
        public DateTime endTime { get; set; }
        public DateTime basedstartTime { get; set; }
        public DateTime basedendTime { get; set; }
        public string ContestType { get; set; }
        public string ContestName { get; set; }
        public string ContestID { get; set; }
        public CatOperatorEnum CatOperatorEnum { get; set; }
        public CatBandEnum CatBandEnum { get; set; }
        public CatPowerEnum CatPowerEnum { get; set; }
        public CatAssistedEnum CatAssistedEnum { get; set; }
        public CatNoOfTxEnum CatNoOfTxEnum { get; set; }
        public CatOperatorOverlayEnum CatOperatorOverlayEnum { get; set; }
        public bool Disabled;
        public string QsoDatabaseInstance { get; set; }
        public string QsoDatabaseTableName { get; set; }
        public string QsoDatabaseServerInstance { get; set; }

        
        public Logqso.mvc.common.Enum.CallGroupEnum CallGroup { get; set; }
        public string Call { get; set; }
        public int LogId { get; set; }

        public ContestInfoDTO()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }

    [Serializable()]
    public class QSOLogFilter
    {
        public bool QsoCB { get; set; }
        public string Filter { get; set; }
        public QSOLogFilter()
        {
            QsoCB = false;
        }
    }
}