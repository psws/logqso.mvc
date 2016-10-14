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
        public decimal Frequency { get; set; }
        public EntityState EntityState { get; set; }
    }
        
    //DTO SQLTVP support class for updating QsoUpdateStationNamesDTO
    public class QsoUpdateStationNamesDTOCollection : List<QsoUpdateStationNamesDTO>, IEnumerable<SqlDataRecord>
    {
        IEnumerator<SqlDataRecord> IEnumerable<SqlDataRecord>.GetEnumerator()
        {
            var sdr = new SqlDataRecord(
                new SqlMetaData("QsoNo", SqlDbType.SmallInt),
                new SqlMetaData("LogId", SqlDbType.Int),
                new SqlMetaData("QStationName", SqlDbType.VarChar, 20),
                new SqlMetaData("Frequency", SqlDbType.Decimal,18,2)
               );

            //.Net will call QsoUpdateStationNamesDTOCollection.GetEnumerator() for each record.
            foreach (QsoUpdateStationNamesDTO qupmd in this)
            {
                sdr.SetInt16(0, qupmd.QsoNo);
                sdr.SetInt32(1, qupmd.LogId);
                //sdr.SetString(2, qupmd.StationName);
                if (qupmd.StationName == null)
                {
                    sdr.SetDBNull(2);
                }
                else
                {
                    System.Data.SqlTypes.SqlChars StationNameChars = new System.Data.SqlTypes.SqlChars(qupmd.StationName.ToCharArray());
                    sdr.SetSqlChars(2, StationNameChars);
                }
                sdr.SetDecimal(3, qupmd.Frequency);
                //decimal tmp = sdr.GetDecimal(3);


                yield return sdr;
            }
        }
    }


}