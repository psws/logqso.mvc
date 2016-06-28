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
        public void GetQuery(IRepositoryAsync<Log> LogRepository, string ChartID, QSOLogFilter QSOFilter,QsoRadioStationFilter QsoRadioStationFilter,
            DataCallInfoDto DataCallInfoDto, ControlSettingsDto ControlSettingsDto, ContestInfoDTO ContestInfoDTO, 
            ChartAreaDto ChartAreaDto, string sChartFunction, out ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            string sIntvTime = "IntvTime";
            string sQCnt = "N";
            //string sQCnt2;
            //string sQCnt3;
            string SerTablename = string.Empty;


            ContestViewParmsDTO = null;
            ContestTypeEnum ContestTypeEnum = (ContestTypeEnum)Enum.Parse(typeof(ContestTypeEnum), ContestInfoDTO.ContestType);

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
            if (QsoRadioStationFilter.QsoRadioTypeEnum != QsoRadioTypeEnum.ALL)
            {
                if (whereClause != string.Empty)
                {
                    whereClause += " AND [Qso].[QsoRadioTypeEnum] = " + (int)QsoRadioStationFilter.QsoRadioTypeEnum;
                }
                else
                {
                    whereClause += " WHERE  [Qso].[QsoRadioTypeEnum] = " + (int)QsoRadioStationFilter.QsoRadioTypeEnum;
                }
            }
            if (QsoRadioStationFilter.StationFilter != null && QsoRadioStationFilter.StationFilter != "ALL")
            {
                if (whereClause != string.Empty)
                {
                    whereClause += " AND [Qso].[StationName] = '" + QsoRadioStationFilter.StationFilter + "' ";
                }
                else
                {
                    whereClause += " WHERE   [Qso].[StationName] = '" + QsoRadioStationFilter.StationFilter + "' ";
                }
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
                             ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , Count(*) AS N" +
                              " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                               " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                               "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                               " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                              whereClause +
                        //" WHERE (((" + colContestID + ")='" + CtestLogInfo.ContestInfo.ContestID + "'))" +
                              " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                              " GROUP BY [Time1] " + 
                               "ORDER By 1 asc";
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Rate",
                    "QSOs Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
               case "QSO  Sum":
                    QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                            " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                            "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                            "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                            ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , Count(*) AS N" +
                             " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                              " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                              "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                              " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                             whereClause +
                             " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                             " GROUP BY [Time1] " +
                               "ORDER By 1 asc";
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "QSO Sum",
                    "QSOs Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, true);
                    break;
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
                case "Zone  Sum":
                     QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QZoneMult");
                     ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Zone Sum",
                        "Zones Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, true);
                    break;
                case "Country  Rate":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QCtyMult");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Country Rate",
                        "Countries Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Mins", QSOQuery, false);
                    break;
                case "Country  Sum":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QCtyMult");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Country Sum",
                        "Countries Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Mins", QSOQuery, true);
                    break;
                case "Point  Rate":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point Rate",
                        "Points Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
               case "Point  Sum":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPoints");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Point  Sum",
                        "Points Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, true);
                    break;
               case "Prefix  Rate":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPrefixMult");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Prefix Rate",
                        "Prefixess Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
               case "Prefix  Sum":
                    QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPrefixMult");
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Prefix Sum",
                        "Prefixes Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, true);
                    break;
               case "Mult  Rate":
                    switch (ContestTypeEnum)
	                {
                        case ContestTypeEnum.CQWW:
                            //Zones + Countries
                            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                                     " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                     "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                     "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                     ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                                    "Sum(convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QZoneMult]) + " + 
                                                         "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QCtyMult]) " + 
                                                        ") AS N" +
                                      " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                       " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                       "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId] " +
                                       " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                      whereClause +
                                      " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                      " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                           break;
                        case ContestTypeEnum.CQWPX:
                           QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPrefixMult");
                            //prefixes
                            break;
                        case ContestTypeEnum.CQ160:
                            break;
                        case ContestTypeEnum.RUSDXC:
                            //oblasts plus countries
                            break;
                        default:
                            break;
	                }
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Rate",
                    "Mults Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, false);
                    break;
                case "Mult  Sum":
                    switch (ContestTypeEnum)
	                {
                        case ContestTypeEnum.CQWW:
                            //Zones + Countries
                            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                                     " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                     "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                     "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                     ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                                    "Sum(convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QZoneMult]) + " + 
                                                         "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QCtyMult]) " + 
                                                        ") AS N" +
                                      " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                       " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                       "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId] " +
                                       " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                      whereClause +
                                      " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                      " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                           break;
                        case ContestTypeEnum.CQWPX:
                           QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPrefixMult");
                            //prefixes
                            break;
                        case ContestTypeEnum.CQ160:
                            break;
                        case ContestTypeEnum.RUSDXC:
                            //oblasts plus countries
                            break;
                        default:
                            break;
	                }
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Mult Sum",
                    "Mults Per " + ChartAreaDto.ChartPointtInterval.ToString() + " Minutes", QSOQuery, true);
                    break;
               case "Score  Rate":
                    switch (ContestTypeEnum)
                    {
                        case ContestTypeEnum.CQWW:
                            //(Zones + Countries) * pts
                            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) * Sum(Qry5minintervals.Mults) AS " + sQCnt +
                                     " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                     "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                     "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                     ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                            "Sum( " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts1])  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts2])*2  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts4])*4  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts8])*8 )  AS N,"   +
                                             "Sum( " + 
                                             "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QZoneMult]) + " +
                                                     "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QCtyMult]) )" +
                                            "AS Mults" +
                                      " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                       " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                       "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                                       " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                      whereClause +
                                      " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                      " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                            break;
                        case ContestTypeEnum.CQWPX:
                            //prefix * pts
                            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) * Sum(Qry5minintervals.Mults) AS  AS " + sQCnt +
                                    " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                    "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                    "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                    ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                            "Sum( " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts1])  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts2])*2  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts4])*4  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts8])*8 )  AS N,"   +
                                             "Sum( " +
                                               "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPrefixMult])    )" +
                                            "AS Mults" +
                                     " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                      " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                      "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                                      " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                     whereClause +
                                     " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                     " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                            QSOQuery = GenerateQuery(ContestInfoDTO, ChartAreaDto, sIntvTime, sQCnt, colTime, whereClause, "QPrefixMult");
                            //prefixes
                            break;
                        case ContestTypeEnum.CQ160:
                            break;
                        case ContestTypeEnum.RUSDXC:
                            //oblasts plus countries
                            break;
                        default:
                            break;
                    }
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Rate",
                    "Score Per" + ChartAreaDto.ChartPointtInterval.ToString() + " Mins", QSOQuery, false);

                    break;
                case "Score  Sum":
                    switch (ContestTypeEnum)
	                {
                        case ContestTypeEnum.CQWW:
                            //(Zones + Countries) * pts
                            QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) As 'Points', Sum(Qry5minintervals.Mults)  AS Mults " +
                                     " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                     "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                     "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                     ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                            "Sum( " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts1])  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts2])*2  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts4])*4  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts8])*8 )  AS N," +
                                             "Sum( " +
                                             "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QZoneMult]) + " +
                                                     "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QCtyMult]) )" +
                                            "AS Mults" +
                                      " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                       " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                       "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                                       " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                      whereClause +
                                      " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                      " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                          break;
                        case ContestTypeEnum.CQWPX:
                           //prefix * pts
                          QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) As 'Points', Sum(Qry5minintervals.Mults) AS Mults " +
                                     " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                                     "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                                     "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                                     ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                            "Sum( " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts1])  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts2])*2  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts4])*4  + " +
                                                "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts8])*8 )  AS N," +
                                             "Sum( " +
                                               "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPrefixMult])    )" +
                                            "AS Mults" +
                                      " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                                       " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                                       "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                                       " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                                      whereClause +
                                      " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                                      " GROUP BY [Time1] " +
                                        "ORDER By 1 asc";
                            //prefixes
                            break;
                        case ContestTypeEnum.CQ160:
                            break;
                        case ContestTypeEnum.RUSDXC:
                            //oblasts plus countries
                            break;
                        default:
                            break;
                    }
                    ContestViewParmsDTO = new ContestViewParmsDTO(sChartFunction, SerTablename, sIntvTime, sQCnt, "Score Sum",
                    "Score Per" + ChartAreaDto.ChartPointtInterval.ToString() + " Mins", QSOQuery, true);
                    break;
                default:
                    break;
            }
        }

        public string GenerateQuery(ContestInfoDTO ContestInfoDTO, ChartAreaDto ChartAreaDto, string sIntvTime,
            string sQCnt, string colTime, string whereClause, string sumField)
        {
            //sumfield is biy field
            string QSOQuery = string.Empty;
            if (sumField == "QPoints")
            {//sum 4 fields
                QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                         " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                         "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                         "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                         ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                "Sum( " +
                                    "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts1])  + " +
                                    "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts2])*2  + " +
                                    "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts4])*4  + " +
                                    "convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[QPts8])*8 )  " +
                                "AS N" +
                          " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                           " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                           "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                           " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                          whereClause +
                          " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                          " GROUP BY [Time1] " +
                            "ORDER By 1 asc";

            }
            else
            {

                QSOQuery = @"SELECT [Time1] AS " + sIntvTime + ", Sum(Qry5minintervals.N) AS " + sQCnt +
                         " FROM (SELECT   convert(datetime, Format(" + colTime + ",'d') + ' ' " +
                         "+ Format(DatePart(hh," + colTime + "),'00') + ':' " +
                         "+ Format((DatePart(n," + colTime + ")/" + ChartAreaDto.ChartPointtInterval + ")*" +
                         ChartAreaDto.ChartPointtInterval + ",'00') )AS [Time1] , " +
                                        "Sum(convert(int,[" + ContestInfoDTO.QsoDatabaseTableName + "].[" + sumField + "]) ) AS N" +
                          " FROM " + ContestInfoDTO.QsoDatabaseTableName +
                           " INNER JOIN Log ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[LogId] = [Log].[LogId] " +
                           "INNER JOIN CallSign ON [" + ContestInfoDTO.QsoDatabaseTableName + "].[CallsignId] = [CallSign].[CallSignId]" +
                           " AND [Log].[LogId] = " + ContestInfoDTO.LogId +
                          whereClause +
                          " GROUP BY  " + colTime + " ) AS Qry5minintervals" +
                          " GROUP BY [Time1] " +
                          "ORDER By 1 asc";
            }
            return QSOQuery;
        }

        public IList<ChartQsoRateDTO> GetDataTableSQL(IRepositoryAsync<Log> LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username)
        {
            IEnumerable < ChartQsoRateDTO > ChartQsoRateDTOs;

            ChartQsoRateDTOs = LogRepository.GetChartDataTableAsync(ContestViewParmsDTO, Username).Result;

            IList<ChartQsoRateDTO> ChartQsoRateDTOList = ChartQsoRateDTOs as List<ChartQsoRateDTO>;
            if (ContestViewParmsDTO.sChartFunction == "Score  Sum")
            {
                int sumMults = 0;
                int sumPoints = 0;
                foreach (var item in ChartQsoRateDTOList)
                {
                    sumMults +=item.Mults;
                    sumPoints += item.Points;
                    item.N = sumMults * sumPoints;
                }
               
            }
            else if (ContestViewParmsDTO.sChartFunction.Contains("Sum") )
            { //sum qso count
                int sum = 0;
                foreach (var item in ChartQsoRateDTOList)
	            {
                    sum += item.N;
                    item.N = sum;
	            }
            }

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
                //rules
                if (ControlFiltersSettingsDto.FiltContinent != "ALL")
                {
                    ControlFiltersSettingsDto.FiltCountryInnerHTML.value = "ALL&";
                    ControlFiltersSettingsDto.FiltCQZone = "ALL";
                }
                if (ControlFiltersSettingsDto.FiltCountryInnerHTML.value.Contains("ALL&") == false)
                {
                    ControlFiltersSettingsDto.FiltContinent = "ALL";
                    ControlFiltersSettingsDto.FiltCQZone = "ALL";
                }
                if (ControlFiltersSettingsDto.FiltCQZone != "ALL")
                {
                    ControlFiltersSettingsDto.FiltCountryInnerHTML.value = "ALL&";
                    ControlFiltersSettingsDto.FiltContinent = "ALL";
                }
            }

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
                                Qfilter.Filter = "([Qso].[Frequency] >= 28000.0 AND [Qso].[Frequency] <= 28700.0)";
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


        public QsoRadioStationFilter GetQsoRadioStationFilter(DataCallInfoDto DataCallInfoDto)
        {
            QsoRadioStationFilter QsoRadioStationFilter = new QsoRadioStationFilter();
            if (DataCallInfoDto.QsoRadioType != QsoRadioTypeEnum.ALL)
            {
                QsoRadioStationFilter.QsoRadioTypeEnum = DataCallInfoDto.QsoRadioType;
            }
            if (DataCallInfoDto.SelectedStationName != "ALL")
            {
                QsoRadioStationFilter.StationFilter = DataCallInfoDto.SelectedStationName;
            }

            return QsoRadioStationFilter;
        }
    }
}
