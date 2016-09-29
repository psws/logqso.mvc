using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Microsoft.SqlServer.Server;


namespace Logqso.Repository.Repository
{
    public class QsoUpdateStationNamesDTO
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string StationName { get; set; }
        public EntityState EntityState { get; set; }
    }
        
    //DTO SQLTVP support class for updating QsoUpdateStationNamesDTO
    public class QsoUpdateStationNamesDTOCollextion : List<QsoUpdateStationNamesDTO>, IEnumerable<SqlDataRecord>
    {
        IEnumerator<SqlDataRecord> IEnumerable<SqlDataRecord>.GetEnumerator()
        {
            var sdr = new SqlDataRecord(
                new SqlMetaData("QsoNo", SqlDbType.SmallInt),
                new SqlMetaData("LogId", SqlDbType.Int),
                new SqlMetaData("QStationName", SqlDbType.VarChar, 20)
                );

             //.Net will call QsoUpdateStationNamesDTOCollextion.GetEnumerator() for each record.
            foreach (QsoUpdateStationNamesDTO qupmd in this)
            {
                sdr.SetInt16(0, qupmd.QsoNo);
                sdr.SetInt32(1, qupmd.LogId);
                //sdr.SetString(2, qupmd.StationName);
                System.Data.SqlTypes.SqlChars StationNameChars = new System.Data.SqlTypes.SqlChars(qupmd.StationName.ToCharArray());
                sdr.SetSqlChars(2, StationNameChars);


                yield return sdr;
            }
        }
    }


}