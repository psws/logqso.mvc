using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Logqso.mvc.Dto.Chart;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.domain;
using Logqso.mvc.Dto.LogControl;
using Logqso.mvc.common.Enum;
using Repository.Pattern.Repositories;
using Logqso.Repository.Repository;  //for extensions


namespace Logqso.mvc.domain.Charting
{
    class ChartQuery
    {
        public void GetQuery(IRepositoryAsync<Log> LogRepository, string ChartID, QSOLogFilter QSOFilter, DataCallInfoDto DataCallInfoDto, ControlSettingsDto ControlSettingsDto, ContestInfoDTO ContestInfoDTO, ChartAreaDto ChartAreaDto, string sChartFunction, out ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            string sIntvTime = "IntvTime";
            string sQCnt = "N";
            string sQCnt2;
            string sQCnt3;
            string SerTablename = string.Empty;


            ContestViewParmsDTO = null;

            string whereClause = string.Empty;
            SerTablename = ContestInfoDTO.Call + ChartID + ContestInfoDTO.ContestID + "_S" + ContestInfoDTO.basedstartTime.ToOADate() + "_E" +
                ContestInfoDTO.basedendTime.ToOADate() + "_" + sIntvTime + string.Format("_I{0}", ChartAreaDto.ChartPointtInterval) +
                string.Format("_M{0}", ChartAreaDto.MixedYears + "_T" + ChartAreaDto.charttype + "_T" + sChartFunction);

            if (QSOFilter.QsoCB != true && QSOFilter.Filter != string.Empty)
            {
                SerTablename += string.Format("_Qb{0}_QC{1}_Qc{2}_QZ{3}_QE{4}",
                    ControlSettingsDto.ControlFiltersSettingsDto.FiltBand,
                    ControlSettingsDto.ControlFiltersSettingsDto.FiltContinent,
                    ControlSettingsDto.ControlFiltersSettingsDto.FiltCountryInnerHTML,
                    ControlSettingsDto.ControlFiltersSettingsDto.FiltCQZone, 
                    QSOFilter.QsoCB);
                whereClause = " WHERE " + QSOFilter.Filter;
            }


            string colTime = string.Format("[{0}].[QsoDateTime]", ContestInfoDTO.QsoDatabaseTableName);
            string QSOQuery = string.Empty;
            switch (sChartFunction)
            {
                case "QSO  Rate":
                    //string colTime = string.Format("{0}.Time", CtestLogInfo.ContestInfo.ContestTblName);
                    //string colContestID = string.Format("{0}.ContestID", CtestLogInfo.ContestInfo.ContestTblName);
                    //string QSOQuery = @"SELECT [Time1] AS " + IntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    //         " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    //         "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    //         "& Format(Int(DatePart('n',[" + colTime + "])/" + Interval + ")*" + Interval + ",'00')AS [Time1] , Count(*) AS N" +
                    //          " FROM QSOs" +
                    //          " WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                    //          " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                    //          " GROUP BY [Time1] ";
                   
                    
                    //SELECT [Time1] AS IntvTime, Sum(Qry5minintervals.N) AS N
                    //FROM (SELECT   Format([CqwwQsos.QDateTime],'Short Date')
                    //  & ' ' & Format(DatePart('h',[CqwwQsos.QDateTime]),'00')
                    //  & ':' & Format(Int(DatePart('n',[CqwwQsos.QDateTime])/60)*60,'00')AS [Time1] ,
                    //Count(*) AS N 
                    //   FROM CqwwQsos INNER JOIN QCountries ON CqwwQsos.ID = QCountries.ID 
                    //      GROUP BY  [CqwwQsos.QDateTime] ) AS Qry5minintervals 
                    //      GROUP BY [Time1] 
                    //=============================================================
                    //SQL
                    //=========================================================
                    //SELECT [Time1] AS IntvTime, Sum(Qry5minintervals.N) AS N
                    //FROM (SELECT   Format([Qso].[QsoDateTime],'d')
                    //  + ' ' + Format(DatePart(hh,[Qso].[QsoDateTime]),'00')
                    //  + ':' + Format((DatePart(n,[Qso].[QsoDateTime])/60)*60,'00')AS [Time1] ,
                    //Count(*) AS N 
                    //   FROM Qso INNER JOIN Log ON Qso.LogId = log.LogId 
                    //    INNER JOIN CallSign ON [Qso].[CallsignId] = [CallSign].[CallSignId] 
                    //     AND Log.LogId = 1
                    //      GROUP BY  [Qso].[QsoDateTime] ) AS Qry5minintervals 
                    //      GROUP BY [Time1] 

                    //Convert 120 is Zulu time
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                             " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                             "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                             "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                             ChartAreaDto.ChartPointtInterval + ",'00'),120 )AS [Time1] , Count(*) AS N" +
                              " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                               " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                               "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                               " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                              whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                              " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                              " GROUP BY [Time1] ";
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Rate",
                    "QSOs Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
#if fase
                    case "QSO  Sum":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                             " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                             "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                             "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                             ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Count(*) AS N" +
                              " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                               " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                              whereClause +
                              " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                              " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Sum",
                    "QSOs Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, true);
                    break;
#endif
                case "Zone  Rate":
                    //if (whereClause == string.Empty) 
                    //{
                    //    whereClause = " WHERE " + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult= 1";
                    //}else
                    //{
                    //    whereClause += " AND " + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult= 1";

                    //}
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QZoneMult");

                    //        SELECT [Time1], Sum(Qryminintervals.N) AS Zones
                    //FROM (SELECT Format([QSOs.Time],"Short Date") & " " & Format(DatePart("h",[QSOs.Time]),"00") & ":" & Format(Int(DatePart("n",[QSOs.Time])/15)*15,"00") AS Time1, Count(*) AS N
                    //FROM QSOs
                    //WHERE (((QSOs.ContestID)="CQWWSSB2009") And ((QSOs.Mlt1)<>""))
                    //GROUP BY [QSOs.Time], [QSOs.Mlt2] ) AS Qryminintervals
                    //GROUP BY [Time1];
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Zone Rate",
                        "Zones Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
#if false
                case "Zone  Sum":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QZoneMult");
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Zone Sum",
                        "Zones Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, true);
                    break;
                case "Country  Rate":
                    // if (whereClause == string.Empty) 
                    //{
                    //    whereClause = " WHERE " + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult= 1";
                    //}else
                    //{
                    //    whereClause += " AND " + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult= 1";

                    //}
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QCountryMult");
                    //QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    //        " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    //        "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    //        "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                    //        ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Count(*) AS N" +
                    //         " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                    //          " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                    //         whereClause +
                    //    //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                    //         " GROUP BY  [" + colTime + "], [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS Qry5minintervals" +
                    //         " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, "N", "Country Rate",
                       "Countries Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, false);
                    break;
                case "Country  Sum":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QCountryMult");
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, "N", "Country Sum",
                       "Countries Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, true);
                    break;
                case "Point  Rate":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                    //QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                    //        " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                    //        "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                    //        "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                    //        ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] , Sum([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS N" +
                    //         " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                    //          " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                    //         whereClause +
                    //   //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                    //         " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                    //         " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point Rate",
                       "Points Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, false);
                    break;
                case "Point  Sum":
                    QSOQuery = GenerateQuery(CtestLogInfo, ChartAreaInfo, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point Sum",
                       "Points Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, true);
                    break;
                case "Mult  Rate":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N" +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Rate",
                       "Mults Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, false);
                    break;
                case "Mult  Sum":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N" +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Sum",
                       "Mults Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Minures", QSOQuery, true);
                    break;
                case "Score  Rate":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) * Sum(Qry5minintervals.Pts) AS " + sQCnt +
                            " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                            "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                            "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                            ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N," +
                             " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS Pts " +
                             " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                              " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                             whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                             " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                             " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Rate",
                       "Score Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, false);
                    break;
                case "Score  Sum":
                    sQCnt2 = "Mults";
                    sQCnt3 = "Points";
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt2 + ", Sum(Qry5minintervals.Pts) AS " + sQCnt3 +
                        " FROM (SELECT   Format([" + colTime + "],'Short Date') & ' ' " +
                        "& Format(DatePart('h',[" + colTime + "]),'00') & ':' " +
                        "& Format(Int(DatePart('n',[" + colTime + "])/" + ChartAreaInfo.ChartPointtInterval + ")*" +
                        ChartAreaInfo.ChartPointtInterval + ",'00')AS [Time1] ," +
                         " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QZoneMult]  + [" + CtestLogInfo.ContestInfo.ContestTblName + ".QCountryMult] ) AS N," +
                         " SUM([" + CtestLogInfo.ContestInfo.ContestTblName + ".QPoints]) AS Pts " +
                         " FROM " + CtestLogInfo.ContestInfo.ContestTblName +
                          " INNER JOIN QCountries ON " + CtestLogInfo.ContestInfo.ContestTblName + ".ID = QCountries.ID " +
                         whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                         " GROUP BY  [" + colTime + "] ) AS Qry5minintervals" +
                         " GROUP BY [Time1] ";
                    ContestViewParms = new ContestViewParms(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Sum",
                        "Score Per " + ChartAreaInfo.ChartPointtInterval.ToString() + " Mins", QSOQuery, true);
                    ContestViewParms.sQCnt2 = sQCnt2;
                    ContestViewParms.sQCnt3 = sQCnt3;
                    break;
#endif
                default:
                    break;
            }
        }

        public string GenerateQuery(ContestInfoDTO ContestInfoDTO, ChartAreaDto ChartAreaDto, string sIntvTime,
            string sQCnt, string colTime, string whereClause, string sumField)
        {
            string QSOQuery = string.Empty;
            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
             " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
             "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
             "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
             ChartAreaDto.ChartPointtInterval + ",'00'),120 )AS [Time1] ,  Sum([" + ContestInfoDTO.QsoDatabaseTableName + "].[" + sumField + "]) AS N" +
              " FROM " + ContestInfoDTO.QsoDatabaseTableName +
               " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
               "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
               " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
              whereClause +
                    //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
              " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
              " GROUP BY [Time1] ";

            return QSOQuery;
        }

        public IList<ChartQsoRateDTO> GetDataTableSQL(IRepositoryAsync<Log> LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            IEnumerable < ChartQsoRateDTO > ChartQsoRateDTOs;

            ChartQsoRateDTOs = LogRepository.GetChartDataTableAsync(ContestViewParmsDTO, Username).Result;

            IList<ChartQsoRateDTO> ChartQsoRateDTOList = ChartQsoRateDTOs as List<ChartQsoRateDTO>;

            //oRS.Columns.Add(ContestViewParmsDTO.sIntvTime, typeof(DateTime));
            //oRS.Columns.Add(ContestViewParmsDTO.sQCnt, typeof(int));
            //using (oConn)
            //{
            //    try
            //    {
            //        oConn.ConnectionString = sConnectionString;
            //        oConn.Open();
            //        OleDbDataAdapter oDA = new OleDbDataAdapter(ContestViewParmsDTO.sQSOQuery, oConn);
            //        oDA.Fill(oRS);
            //        //oConn.Close();
            //    }
            //    catch (Exception e) { }
            //    finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }
            //}
            return ChartQsoRateDTOList;
        }



        public QSOLogFilter GetQSOFilter( ControlFiltersSettingsDto ControlFiltersSettingsDto)
        {
            QSOLogFilter Qfilter = new QSOLogFilter();
            Qfilter.Filter = string.Empty;
            Qfilter.QsoCB = ControlFiltersSettingsDto.Disabled;


            if (!Qfilter.QsoCB)
            {
                if (ControlFiltersSettingsDto.FiltBand != "ALL")
                {
                    CatBandEnum CatBandEnum;
                    if (Enum.TryParse("_" + ControlFiltersSettingsDto.FiltBand, out CatBandEnum) == true)
                    {
                        Enum.GetName(typeof(CatBandEnum), CatBandEnum);
                        switch (CatBandEnum)
                        {
                            case CatBandEnum._160M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 1800.0 AND [Qso].[Frequency] <= 2000.0)";
                                break;
                            case CatBandEnum._80M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 3500.0 AND [Qso].[Frequency] <= 4000.0)";
                                break;
                            case CatBandEnum._40M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 7000.0 AND [Qso].[Frequency] <= 7300.0)";
                                break;
                            case CatBandEnum._20M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 14000.0 and [Qso].[Frequency] <= 14350.0)";
                                break;
                            case CatBandEnum._15M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 21000.0 AND [Qso].[Frequency] <= 21450.0)";
                                break;
                            case CatBandEnum._10M:
                                Qfilter.Filter = "([Qso].[Frequency] >= 28000.0 AND [Qso].[Frequency] <= 20700.0)";
                                break;
                            default:
                                break;
                        }
                    }
                }
                if (ControlFiltersSettingsDto.FiltContinent != "ALL")
                {
                    ContinentEnum ContinentEnum;
                    if (Enum.TryParse(ControlFiltersSettingsDto.FiltContinent, out ContinentEnum) == true)
                    {
                        Enum.GetName(typeof(ContinentEnum), ContinentEnum);
                        if (!string.IsNullOrEmpty(Qfilter.Filter))
                        {
                            Qfilter.Filter += " AND ";
                        }
                        Qfilter.Filter += ("([CallSign].[ContinentEnum] = " + (int)ContinentEnum + " )");
                    }
                }
                if (ControlFiltersSettingsDto.FiltCQZone != "ALL")
                {
                    int QsoExchangeNumber;
                    if (int.TryParse(ControlFiltersSettingsDto.FiltCQZone, out QsoExchangeNumber) == true)
                    {
                        if (!string.IsNullOrEmpty(Qfilter.Filter))
                        {
                            Qfilter.Filter += " AND ";
                        }
                        Qfilter.Filter += ("([Qso].[QsoExchangeNumber] = " + QsoExchangeNumber + " )");
                    }
                }
                if (!ControlFiltersSettingsDto.FiltCountryInnerHTML.value.Contains("ALL&")) //ALL check
                {
                    string Search = "&nbsp;&nbsp;&nbsp;&nbsp;";
                    int pos = ControlFiltersSettingsDto.FiltCountryInnerHTML.value.IndexOf(Search);
                    string prefix = ControlFiltersSettingsDto.FiltCountryInnerHTML.value.Substring(pos + Search.Length);
                    if (!string.IsNullOrEmpty(Qfilter.Filter))
                    {
                        Qfilter.Filter += " AND ";
                    }
                    Qfilter.Filter += " [CallSign].[Prefix] = '" + prefix + "' ";
                }
            }
            return Qfilter;
        }

    }
}
