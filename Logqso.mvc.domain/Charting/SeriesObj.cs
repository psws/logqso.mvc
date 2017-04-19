using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web.UI.DataVisualization;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Data.Common;
using System.Drawing;
using Logqso.mvc.Dto.Chart;
using Repository.Pattern.Repositories;
using Logqso.mvc.Entities.LogDataEntity;
using System.Threading.Tasks;
using Logqso.mvc.Dto.LogData;

namespace Logqso.mvc.domain.Charting
{

    /// <summary>
    /// Summary description for SeriesParamObj
    /// </summary>
    public class SeriesObj : System.Web.UI.DataVisualization.Charting.Series
    {
        public delegate IList<ChartQsoRateDTO> LoadOLEDataTabledelegate(IRepositoryAsync<Log> LogRepository, ContestViewParmsDTO ContestViewParmsDTO, string Username);

        public string Call { get; set; }

        public ContestInfoDTO ContestInfoDTO;
        public int Interval { get; set; }
        public string IntvTime { get; set; }
        public string sQCnt { get; set; }
        public DataTable TmpDT;
        public LoadOLEDataTabledelegate DTFunc { get; set; }


        //public DataTable RateDataTable
        //{
        //    get
        //    {
        //        if (HttpRuntime.Cache[this.Name] != null)
        //        {
        //            return (DataTable)HttpRuntime.Cache[this.Name];
        //        }
        //        else
        //        {
        //            return null;
        //        }
        //    }

        //}


        // QSO rate constructor
        public SeriesObj(ContestInfoDTO ContestInfoDTO, Color ptColor, LoadOLEDataTabledelegate DTFunc)
        {
            this.ContestInfoDTO = ContestInfoDTO;
            Call = ContestInfoDTO.Call;
            this.LegendText = ContestInfoDTO.Call;
            this.Name = Enum.GetName(typeof(common.Enum.CallGroupEnum), ContestInfoDTO.CallGroup) + Call + "_" + ContestInfoDTO.ContestID;
            this.Color = ptColor;
            this.DTFunc = DTFunc;

        }

        public bool Create(IRepositoryAsync<Log> LogRepository, ChartAreaDto ChartAreaDto, string ChartID, ContestViewParmsDTO ContestViewParmsDTO, string username)
        {
            bool bOK = true;
            this.ChartType = ChartAreaDto.charttype;



            // Check if table is cached
            //if (HttpRuntime.Cache[ContestViewParmsDTO.SerTablename] == null)
            //{
                //remove previous chart
                ////string OldTableName = Session[SeriesNum + ChartID] as String;
                ////if (!string.IsNullOrEmpty(OldTableName))
                ////{
                ////    Session.Remove(SeriesNum + ChartID);
                ////    HttpRuntime.Cache.Remove(OldTableName);
                ////}


                double FudgeInterval; //Shifts column bars to the right for axis alignment
                if (this.ChartType == SeriesChartType.Column)
                {
                    FudgeInterval = ChartAreaDto.ChartPointtInterval * -.285; //shifts 3 bars before xaxis hour tick
                }
                else
                {
                    FudgeInterval = 0;
                }

                //SqlDataReader QSOReader  = QSOCommand.ExecuteReader();
                //fill Calll Qsos, Table has  holes wgere no qsos were made
                IList<ChartQsoRateDTO> QsoRateList = DTFunc(LogRepository, ContestViewParmsDTO, username);

                //this.SetCustomProperty("DrawingStyle" , "Cylinder");
                //TmpDT = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime,
                //                            IntvTime, Interval, MixedYears);

                //HttpRuntime.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
                //System.Web.HttpContext.Current.Cache[TableName] = new RateDataTable(QSOsdt, Ctestinfo.startTime, Ctestinfo.endTime, IntvTime, Interval, MixedYears);
#if false               
                System.Web.HttpContext.Current.Cache.Insert(
                    ContestViewParmsDTO.SerTablename,
                    new RateDataTable(QSOsdt, ContestInfoDTO.startTime, ContestInfoDTO.endTime, ContestViewParmsDTO.sIntvTime, ChartAreaDto.ChartPointtInterval,
                        ChartAreaDto.MixedYears, FudgeInterval, ContestViewParmsDTO.bSum),
                    null,
                    Cache.NoAbsoluteExpiration,
                    new TimeSpan(0, 5, 0));
                //Add session state
                ////Session.Add(SeriesNum + ChartID, ContestViewParmsDTO.SerTablename);
#else
                RateDataTable RateDataTable = new RateDataTable(QsoRateList, ContestInfoDTO.startTime, ContestInfoDTO.endTime, ContestViewParmsDTO.sIntvTime, ChartAreaDto.ChartPointtInterval,
                        ChartAreaDto.MixedYears, FudgeInterval, ContestViewParmsDTO.bSum);

#endif
                //QsoRateList.();
            //}

            //not retained on draw. Needs to be set each time
            if (this.ChartType == SeriesChartType.Line)
            {
                this.MarkerStyle = System.Web.UI.DataVisualization.Charting.MarkerStyle.Circle;
            }
            if (this.ChartType == SeriesChartType.Spline)
            {
                this.BorderWidth = 2; // linrwdth
            }


            //OleDbDataReader rdr = TmpDT.CreateDataReader();

            //DataView dv = new DataView(TmpDT);
            //this.Points.DataBindXY(
            //    dv, IntvTime,
            //    dv, sQCnt);    
            //DataTableReader dr = ((DataTable)HttpRuntime.Cache[TableName]).CreateDataReader();
#if false
            DataTableReader dr = ((DataTable)System.Web.HttpContext.Current.Cache[ContestViewParmsDTO.SerTablename]).CreateDataReader();
#else
            //DataTableReader dr = RateDataTable.CreateDataReader();
#endif
           //List<ChartQsoRateDTO> ChartQsoRateDTOs = new List<ChartQsoRateDTO>();
            this.Points.DataBindXY(
                RateDataTable.QsoRateFullList.Select(x => x.IntvTime).ToList<DateTime>(),
                RateDataTable.QsoRateFullList.Select(x => x.N).ToList<int>());
   

            //this.Points.DataBindXY()
            //    dr, ContestViewParmsDTO.sIntvTime,
            //    dr, ContestViewParmsDTO.sQCnt);

            return bOK;
        }


        //public DataTable GetDataSQLTable(string sQuery, string sConnectionString)
        //{

        //    SqlConnection oConn = new SqlConnection();
        //    DataTable oRS = new DataTable();

        //    try
        //    {
        //        oConn.ConnectionString = sConnectionString;
        //        oConn.Open();
        //        SqlDataAdapter oDA = new SqlDataAdapter("EXEC " + sQuery, oConn);
        //        oDA.Fill(oRS);
        //        //oConn.Close();
        //    }
        //    catch (Exception e) { }
        //    finally { if (oConn.State == ConnectionState.Open) { oConn.Close(); } }

        //    return oRS;
        //}



    }
}