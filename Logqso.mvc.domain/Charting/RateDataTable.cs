using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Diagnostics;
using Logqso.mvc.Dto.LogData;

/// <summary>
/// Summary description for QSOsDataset
/// </summary>
public partial class RateDataTable : DataTable
{

    public DateTime startTime { get; set; }
    public DateTime endTime { get; set; }

    public List<ChartQsoRateDTO> QsoRateFullList { get; set; }
    public string sTimeColumnName { get; set; }
    public double interval { get; set; }
    private bool MixedYears;
    public double fudgeinterval;
    bool bSum;

    public RateDataTable(IList<ChartQsoRateDTO> QsoRateList, DateTime start, DateTime end, string TimeColumnName, double intv,
        bool MixYears, double fudgeinterval, bool bSum)
    {
        startTime = start;
        endTime = end;
        this.fudgeinterval = fudgeinterval;
        this.bSum = bSum;
        sTimeColumnName = TimeColumnName;
        interval = intv;
        MixedYears = MixYears;

        CreateRateList( QsoRateList);
    }

    private void CreateRateList(IList<ChartQsoRateDTO> QsoRateList)
    {

        //DataColumn column;
        //DataRow row;

        //// Create new DataColumn, set DataType, 
        //// ColumnName and add to DataTable.    
        //column = new DataColumn();
        //column.DataType = System.Type.GetType("System.DateTime");
        //column.ColumnName = sTimeColumnName;
        //column.Caption = sTimeColumnName;
        //column.ReadOnly = true;
        //column.Unique = true;
        //// Add the Column to the DataColumnCollection.
        //this.Columns.Add(column);

        //// Create second column.
        //column = new DataColumn();
        //column.DataType = System.Type.GetType("System.Int32");
        //column.ColumnName = "N";
        //column.AutoIncrement = false;
        //column.Caption = "N";
        //column.ReadOnly = false;
        //column.Unique = false;
        //// Add the column to the table.
        //this.Columns.Add(column);

        // Make the ID column the primary key column.
        //DataColumn[] PrimaryKeyColumns = new DataColumn[1];
        //PrimaryKeyColumns[0] = this.Columns[sTimeColumnName];
        //this.PrimaryKey = PrimaryKeyColumns;

        //// Instantiate the DataSet variable.
        //dataSet = new DataSet();
        //// Add the new DataTable to the DataSet.
        //dataSet.Tables.Add(table);

        // Create three new DataRow objects and add 
        // them to the DataTable
        DateTime Time = startTime;
        int i = 0;
        //int ContestDay = 1;
        DateTime CurrentDate = startTime;

        //int j =1;
        //foreach (DataRow dr in QSOsTable.Rows)
        //{
        //    Debug.WriteLine(string.Format("i is {0}  {1}   {2}", j++, dr.ItemArray[0].ToString(), dr.ItemArray[1].ToString()));

        //}
        //creat a new list that holds an element for every row in the graph
        //The element count depends on the Interval
         QsoRateFullList = new List<ChartQsoRateDTO>();
        int day1 = startTime.Day;
        // add start row with zero value to shift graph left.
        //row = this.NewRow();
        //if (MixedYears)
        //{
        //    row[sTimeColumnName] = DateTime.Parse("1/1/1990 " + "00:00");
        //}
        //else
        //{
        //    row[sTimeColumnName] = startTime;
        //}
        //row["N"] = 0;
        //this.Rows.Add(row);

        ChartQsoRateDTO ChartQsoRateDTO = new ChartQsoRateDTO()
        {
            N = 0
        };
        if (MixedYears)
        {
            ChartQsoRateDTO.IntvTime = DateTime.Parse("1/1/1990 " + "00:00");
        }
        else
        {
            ChartQsoRateDTO.IntvTime = startTime;
        }
        QsoRateFullList.Add(ChartQsoRateDTO);

        int PrevSum = 0;

        while (Time < endTime)
        {
            ChartQsoRateDTO ChartQsoRateDTO2 = new ChartQsoRateDTO();
            //row = this.NewRow();
            //row[sTimeColumnName] = String.Format("{0}-{1:HH:mm}",ContestDay, Time);
            if (MixedYears)
            {
                // need to enter begin of time date to allow mixed year plotting
                int days = Time.AddMinutes(interval + fudgeinterval).Subtract(startTime).Days;
                //row[sTimeColumnName] = DateTime.Parse("1/" + string.Format("{0}", 1 + Time.AddMinutes(interval).Day - day1) + "/1990 " +
                //    Time.AddMinutes(interval).TimeOfDay);
                ChartQsoRateDTO2.IntvTime = DateTime.Parse("1/" + string.Format("{0}", 1 + days + "/1990 " +
                    Time.AddMinutes(interval).AddMinutes(fudgeinterval).TimeOfDay));
            }
            else
            {
                ChartQsoRateDTO2.IntvTime = Time.AddMinutes(interval).AddMinutes(fudgeinterval);
            }

            if (i < QsoRateList.Count && (QsoRateList[i].IntvTime == Time) )
            {
                ChartQsoRateDTO2.N = QsoRateList[i].N;
                PrevSum = QsoRateList[i].N;
                i++;
            }
            else
            {
                if (bSum)
                {
                    ChartQsoRateDTO2.N = PrevSum;
                }
                else
                {
                    ChartQsoRateDTO2.N = 0;
                }
            }
            QsoRateFullList.Add(ChartQsoRateDTO2);
            //Debug.WriteLine(string.Format("i is {0}  {1}   {2}", i, row.ItemArray[0].ToString(), row.ItemArray[1].ToString()));
            //if (i == 23)
            //{

            //}
            Time = Time.AddMinutes(interval);
            //if (CurrentDate.Day != Time.Day)
            //{
            //    CurrentDate.AddDays(1);
            //    ContestDay++;
            //}


        }
    }
}














