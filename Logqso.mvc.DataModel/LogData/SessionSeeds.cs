using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel.LogData.DataModels;
using Logqso.mvc.DataModel.LogData.CallInfoModels;
using Logqso.mvc.DataModel.LogControl.CategoryModels;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.FilterModels;
using Logqso.mvc.DataModel.LogControl.XaxisModels;
using Logqso.mvc.DataModel.LogControl.YaxisModels;
using System.Diagnostics;

using System.Xml.Serialization;
using System.IO;
using System.Xml;

namespace Logqso.mvc.DataModel.LogData
{
   public   class SessionSeeds
    {
        //  add to configuration.cs           SessionSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
           CatDefault CatDefault = new CatDefault
           {
               Id = 1,
               UserName = "default",
               CatOpr = CatOperatorEnum.ALL,
               CatAssist = CatAssistedEnum.ALL,
               CatBnd = CatBandEnum.ALL,
               CatTx = CatNoOfIxEnum.ALL,
               CatPwr = CatPowerrEnum.ALL 
           }; 

            FiltDefaullt FiltDefaullt = new FiltDefaullt
              {
                  Id = 1,
                  UserName = "default",
                  FiltBnd = CatBandEnum.ALL,
                  FiltCont = ContinentEnum.ALL,
                  FiltPref = "",
                  FiltCQZoneVal = "ALL"
              };

            XaxisDefault XaxisDefault = new XaxisDefault()
            {
                Id = 1,
                UserName = "default",
                XaxisDurationTime = "48",
                XaxisStrtTime = "00:00z  Day1"
            };

              YaxisDefault YaxisDefault = new YaxisDefault()
             {
                 Id = 1,
                 UserName = "default",
                 YaxisFuncName = "QSO  Rate",
                 YaxisIntvVal = "60",
                 YaxisViewTypeName = "Column"
             };

            //create XML strings, this does not work due to enums
              //string CatDefaultXML = Serial.Serialize(CatDefault);
            //These are OK
              string SerialCatXML = Serial.Serialize(CatDefault);
              string SerialFiltXML = Serial.Serialize(FiltDefaullt);
              string SerialXaxisXML = Serial.Serialize(XaxisDefault);
              string SerialYaxisXML = Serial.Serialize(YaxisDefault);

            //<ContestLogInfo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Call>EF8R</Call><ContestInfo><startTime>2011-10-29T00:00:00</startTime><endTime>2011-10-30T23:59:59</endTime><basedstartTime>1990-01-01T00:00:00</basedstartTime><basedendTime>1990-01-02T23:59:59</basedendTime><ContestType>CQ-WW-SSB</ContestType><ContestName>Cqww Ssb 2011</ContestName><ContestID>CQWWSSB2011</ContestID><ContestTblName>CqwwQsos</ContestTblName><EntryTblName>CqwwEntry</EntryTblName><DBName>CqwwSsb2011Contest.mdb</DBName></ContestInfo><CatLogInfo><LogCatOprID>1</LogCatOprID><LogCatPwrID>1</LogCatPwrID><LogCatAstID>2</LogCatAstID><LogCatBndID>1</LogCatBndID><LogCatTxID>1</LogCatTxID><LogDBName>ef8r.mdb</LogDBName><LogCallID>0</LogCallID><LogCtyID>104</LogCtyID><LogCalcZones>150</LogCalcZones><LogCalcCountries>476</LogCalcCountries><LogCalcScore>18147740</LogCalcScore><LogEntryClass>SOAB</LogEntryClass></CatLogInfo><CatOprID>0</CatOprID><CatPwrID>0</CatPwrID><CatAstID>0</CatAstID><CatBndID>0</CatBndID><CatTxID>0</CatTxID><CategoryCBID>false</CategoryCBID><CBCall>false</CBCall></ContestLogInfo>

              //these are OK
            string CatXML = @"<XaxisDefault xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " +
                  @"xmlns:xsd=""http://www.w3.org/2001/XMLSchema"">" +
                  @"<UserName>default</UserName><XaxisDurationTime>40</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>";
              string XAxisXML = @"<XaxisDefault xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " +
                  @"xmlns:xsd=""http://www.w3.org/2001/XMLSchema"">" +
                  @"<UserName>default</UserName><XaxisDurationTime>40</XaxisDurationTime><XaxisStrtTime>00:00z  Day1</XaxisStrtTime></XaxisDefault>";
              string YaxisXML = @"<YaxisDefault xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " +
                  @"xmlns:xsd=""http://www.w3.org/2001/XMLSchema"">" +
                  @"<UserName>default</UserName><YaxisFuncName>QSO  Rate</YaxisFuncName><YaxisIntvVal>60</YaxisIntvVal><YaxisViewTypeName>Column</YaxisViewTypeName></YaxisDefault>";

            context.Session.AddOrUpdate(
            p => p.SessionName,
                new Session {
                    CategorySettings = SerialCatXML, FiltersSettings = SerialFiltXML,
                    XaxisSettings = SerialXaxisXML,   YaxisSettings = SerialYaxisXML,
                             UserName = "default", SessionName = "default_cn2r_cn3a_cn2aa", SessionDateTime = DateTime.Now
                }

            );


        }
   }
#if true
    public  static class Serial
    {
        public static string Serialize<T>(this T value)
        {
            if (value == null)
            {
                return string.Empty;
            }
            try
            {
                var xmlserializer = new XmlSerializer(typeof(T));
                var stringWriter = new StringWriter();
                using (var writer = XmlWriter.Create(stringWriter))
                {
                    xmlserializer.Serialize(writer, value);
                    return stringWriter.ToString();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred", ex);
            }
        }
    }
#endif


}
