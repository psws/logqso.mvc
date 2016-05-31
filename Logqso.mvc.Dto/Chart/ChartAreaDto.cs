using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

namespace Logqso.mvc.Dto.Chart
{
    /// <summary>
    /// Summary description for ChartInfo
    /// </summary>
    public class ChartAreaDto
    {
        public TickMark MinorTM { get; set; }
        public TickMark MajorTM { get; set; }
        public Grid MajorGR { get; set; }
        public Grid MinorGR { get; set; }
        public int ChartPointtInterval { get; set; }
        public SeriesChartType charttype { get; set; }
        public DateTimeIntervalType ChartXaxisIntervalType { get; set; }
        public double ChartXaxisInterval { get; set; }
        public bool MixedYears { get; set; }
        public double MajorHorizontalInterval { get; set; }
        public double MinorHorizontalInterval { get; set; }
        public double AxisXMaxFudgeSeconds;

        public enum VerticalType
        {
            Major,
            Minor,
        }




        public ChartAreaDto(ChartAreaInfoParams ChartAreaParams)
        {
            this.ChartPointtInterval = ChartAreaParams.ChartPointInterval;
            this.charttype = ChartAreaParams.charttype;
            this.ChartXaxisIntervalType = ChartAreaParams.ChartXaxisIntervalType; // need  to set for lines to appear
            this.ChartXaxisInterval = ChartAreaParams.ChartXaxisInterval;
            this.MixedYears = ChartAreaParams.MixedYears;
            this.MajorHorizontalInterval = ChartAreaParams.MajorVerticalInterval;
            this.MinorHorizontalInterval = ChartAreaParams.MinorVerticalInterval;
            AxisXMaxFudgeSeconds = ChartAreaParams.AxisXMaxFudgeSeconds;
        }


        public void CreateChartTickmark(TickMark TM, VerticalType tmtype, TickMarkInfoParams TMinfo)
        {
            switch (tmtype)
            {
                case VerticalType.Major:
                    MajorTM = TM;
                    break;
                case VerticalType.Minor:
                    MinorTM = TM;
                    break;
                default:
                    break;
            }

            TM.Interval = TMinfo.Interval;
            TM.IntervalType = TMinfo.IntervalType;
            TM.TickMarkStyle = TMinfo.Style;
            TM.Size = TMinfo.Size;
            TM.LineColor = TMinfo.LineColor;
            TM.LineWidth = TMinfo.LineWidth;
            TM.Enabled = true;

        }

        public void CreateChartGrid(Grid Gr, VerticalType tmtype, GridInfoParams Gridinfo)
        {
            switch (tmtype)
            {
                case VerticalType.Major:
                    MajorGR = Gr;
                    break;
                case VerticalType.Minor:
                    MinorGR = Gr;
                    break;
                default:
                    break;
            }
            Gr.IntervalType = Gridinfo.IntervalType;// need  to set for lines to appear
            Gr.Interval = Gridinfo.Interval;
            Gr.LineColor = Gridinfo.LineColor;
            Gr.LineDashStyle = Gridinfo.LineDashStyle;
            Gr.LineWidth = Gridinfo.LineWidth;

            Gr.Enabled = true;
        }


        public void InitChartAxis(Axis Ax, AxisInfoParams Axinfo)
        {
            Ax.TitleFont = Axinfo.TitleFont;
            Ax.Title = Axinfo.Title;
            Ax.LineWidth = Axinfo.LineWidth;
            Ax.LabelStyle.Format = Axinfo.LabelStyleFormat;
            Ax.LabelStyle.Angle = Axinfo.LabelStyleAngle;
            Ax.Minimum = Axinfo.Minimum;
            Ax.Maximum = Axinfo.Maximum;
            Ax.IntervalType = Axinfo.IntervalType;
            Ax.Interval = Axinfo.Interval;
            Ax.Enabled = AxisEnabled.True;
        }

    }



    public class ChartAreaInfoParams
    {
        public int ChartPointInterval { get; set; }
        public SeriesChartType charttype { get; set; }
        public double ChartXaxisInterval { get; set; }
        public DateTimeIntervalType ChartXaxisIntervalType { get; set; }
        public bool MixedYears { get; set; }
        public double MajorVerticalInterval { get; set; }
        public double MinorVerticalInterval { get; set; }
        public double AxisXMaxFudgeSeconds { get; set; }

        public ChartAreaInfoParams()
        {

        }
    }

    public class TickMarkInfoParams
    {
        public DateTimeIntervalType IntervalType;
        public double Interval { get; set; }
        public float Size { get; set; }
        public Color LineColor { get; set; }
        public int LineWidth { get; set; }
        public TickMarkStyle Style { get; set; }


        public TickMarkInfoParams()
        {

        }

    }

    public class GridInfoParams
    {
        public DateTimeIntervalType IntervalType { get; set; }// need  to set for lines to appear
        public double Interval { get; set; }
        public Color LineColor { get; set; }
        public ChartDashStyle LineDashStyle { get; set; }
        public int LineWidth { get; set; }

        public GridInfoParams()
        {

        }
    }

    public class AxisInfoParams
    {
        public Font TitleFont { get; set; }
        public string Title { get; set; }
        public int LineWidth { get; set; }
        public string LabelStyleFormat { get; set; }
        public int LabelStyleAngle { get; set; }
        public double Minimum { get; set; }
        public double Maximum { get; set; }
        public DateTimeIntervalType IntervalType { get; set; }
        public double Interval { get; set; }
    }
}