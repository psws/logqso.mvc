using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace Logqso.mvc.domain.Charting
{

    /// <summary>
    /// Summary description for ChartInfo
    /// </summary>
    public class ChartInfo
    {
        TickMark MinorTM { get; set; }
        TickMark MajorTM { get; set; }
        Grid MajorGL { get; set; }
        Grid MinorGL { get; set; }




        public ChartInfo(ChartTickmarkInfo Minor_TM, ChartTickmarkInfo Major_TM)
        {
            MinorTM = Minor_TM;
            MajorTM = Major_TM;
        }
    }

    public class ChartTickmarkInfo : TickMark
    {

        public ChartTickmarkInfo(DateTimeIntervalType IntervalType, double Interval,
                          float Size, Color LineColor, int LineWidth)
        {
            this.TickMarkStyle = TickMarkStyle.OutsideArea;

            this.Enabled = true;
            this.IntervalType = IntervalType; // need  to set for lines to appear
            this.Interval = Interval;
            this.Size = Size;
            this.LineColor = LineColor;
            this.LineWidth = LineWidth;

            this.Enabled = true;

        }
    }

    public class ChartGridInfo : Grid
    {

        public ChartGridInfo(DateTimeIntervalType IntervalType, double Interval, Color LineColor,
                        ChartDashStyle LineDashStyle, int LineWidth)
        {
            this.IntervalType = IntervalType;// need  to set for lines to appear
            this.Interval = Interval;
            this.LineColor = LineColor;
            this.LineDashStyle = LineDashStyle;
            this.LineWidth = LineWidth;

            this.Enabled = true;

        }
    }
}