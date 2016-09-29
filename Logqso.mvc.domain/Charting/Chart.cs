using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.Dto.Chart;
using Repository.Pattern.Repositories;
using Logqso.mvc.Entities.LogDataEntity;
using Logqso.Repository.Repository;
using System.Configuration;
using System.Web.Hosting;
using System.Drawing.Imaging;

namespace Logqso.mvc.domain.Charting
{
    public class Chart
    {
        public System.Web.UI.DataVisualization.Charting.Chart QSORateChart { get; set; }

        private bool MixedYears;
        public DataView dv;

        public Chart()
        {
        }

        public async Task<MemoryStream>  LoadQSORateChart(ChartCtlDataSettingsDto ChartCtlDataSettingsDto, IRepositoryAsync<Log> LogRepository, string username)
        {
            MemoryStream MemoryStream = null; 
            bool bOK = true;

            IList<ContestInfoDTO> ContestInfosDTOList = new List<ContestInfoDTO>();
            LoadContestInfoDTO(ChartCtlDataSettingsDto, ContestInfosDTOList,  LogRepository, username);

            //set ContestInfoDTO
            ContestInfoDTO ContestInfoDTO1 = ContestInfosDTOList.Where(c => c.CallGroup == common.Enum.CallGroupEnum.CALL1).FirstOrDefault();
            ContestInfoDTO ContestInfoDTO2 = ContestInfosDTOList.Where(c => c.CallGroup == common.Enum.CallGroupEnum.CALL2).FirstOrDefault();
            ContestInfoDTO ContestInfoDTO3= ContestInfosDTOList.Where(c => c.CallGroup == common.Enum.CallGroupEnum.CALL3).FirstOrDefault();

            ChartQuery ChartQuery = new Charting.ChartQuery();
            ChartAreaInfoParams ChartAreaParams = new ChartAreaInfoParams();
            //CHART
            QSORateChart = new System.Web.UI.DataVisualization.Charting.Chart()
            {
                ID = "QSORateChart",
                Height = new System.Web.UI.WebControls.Unit("400px"),
                //ImageStorageMode = System.Web.UI.DataVisualization.Charting.ImageStorageMode.UseImageLocation,
                RenderType = RenderType.BinaryStreaming,

                BackColor = Color.FromArgb(0xFF, 0xC9, 0xEC, 0xFE),
                Width = new System.Web.UI.WebControls.Unit("984px"),
                AntiAliasing = System.Web.UI.DataVisualization.Charting.AntiAliasingStyles.All,
                TextAntiAliasingQuality = System.Web.UI.DataVisualization.Charting.TextAntiAliasingQuality.High
            };
            QSORateChart.CustomizeLegend += QSORateChart_CustomizeLegend;
            //QSORateChart.Customize += QSORateChart_Customize;
            //TITLES
            Title TitleChartName = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "ChartName",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Emboss,
                ForeColor = Color.FromArgb(0xFF, 0, 99, 99),
                Font =  new System.Drawing.Font(new System.Drawing.FontFamily("Microsoft Sans Serif"), 22)
            };
            Title TitleTkey3 = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "Tkey3",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Emboss,
                ForeColor = Color.FromArgb(0xFF, 0, 99, 99),
                Font = new System.Drawing.Font(new System.Drawing.FontFamily("Courier New"), 10),
                Alignment = ContentAlignment.BottomLeft,
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                DockingOffset = 2
            };
            Title TitleTkey2 = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "Tkey2",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Emboss,
                ForeColor = Color.FromArgb(0xFF, 0, 99, 99),
                Font = new System.Drawing.Font(new System.Drawing.FontFamily("Courier New"), 10),
                Alignment = ContentAlignment.BottomLeft,
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                DockingOffset = 4
            };
            Title TitleTkey1 = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "Tkey1",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Emboss,
                ForeColor = Color.FromArgb(0xFF, 0, 99, 99),
                Font = new System.Drawing.Font(new System.Drawing.FontFamily("Courier New"), 10),
                Alignment = ContentAlignment.BottomLeft,
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                DockingOffset = 6
            };
            Title TitleCorp = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "Corp",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Default,
                ForeColor = Color.Blue,
                Font = new System.Drawing.Font(new System.Drawing.FontFamily("Trebuchet MS"), 8.25f),
                Alignment = ContentAlignment.BottomRight,
                Url = "http://www.psws.com",
                Text="© PSWS.com",
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                DockingOffset = 18
            };
            Title TitleVersion = new System.Web.UI.DataVisualization.Charting.Title()
            {
                Name = "Vers",
                TextStyle = System.Web.UI.DataVisualization.Charting.TextStyle.Default,
                ForeColor = Color.Black,
                Font = new System.Drawing.Font(new System.Drawing.FontFamily("Trebuchet MS"), 8.25f),
                Alignment = ContentAlignment.BottomRight,
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                DockingOffset = 20
            };

            QSORateChart.Titles.Add(TitleChartName);
            QSORateChart.Titles.Add(TitleTkey3);
            QSORateChart.Titles.Add(TitleTkey2);
            QSORateChart.Titles.Add(TitleTkey1);
            QSORateChart.Titles.Add(TitleCorp);
            QSORateChart.Titles.Add(TitleVersion);

            //LEGENDS
            Legend LegendLegend1 = new System.Web.UI.DataVisualization.Charting.Legend()
            {
                Name = "Legend1",
                TitleSeparator = System.Web.UI.DataVisualization.Charting.LegendSeparatorStyle.DoubleLine,
                BorderColor = Color.Black,
                BorderWidth = 1,
                LegendStyle = System.Web.UI.DataVisualization.Charting.LegendStyle.Row,
                IsEquallySpacedItems = true,
                IsTextAutoFit = false,
                TitleAlignment = StringAlignment.Center,
                BackGradientStyle = System.Web.UI.DataVisualization.Charting.GradientStyle.HorizontalCenter,
                BackColor = Color.FromArgb(0xFF, 0xEE, 0xEE, 0xEE),
                BackSecondaryColor = Color.White,
                Alignment = StringAlignment.Center,
                Docking = System.Web.UI.DataVisualization.Charting.Docking.Bottom,
                ItemColumnSeparator = System.Web.UI.DataVisualization.Charting.LegendSeparatorStyle.GradientLine,
                ItemColumnSpacing = 30,
                
            };
            QSORateChart.Legends.Add(LegendLegend1);

            //CHARTAREAS
            ChartArea ChartAreaChartArea1 = new System.Web.UI.DataVisualization.Charting.ChartArea()
            {
                Name = "ChartArea1",
                BackColor = Color.FromArgb(0xFF, 0x99, 0xCC, 0xFF),
                Area3DStyle = new System.Web.UI.DataVisualization.Charting.ChartArea3DStyle()
                {
                    Enable3D = false
                },
                BackGradientStyle = System.Web.UI.DataVisualization.Charting.GradientStyle.TopBottom,
                AxisX = new System.Web.UI.DataVisualization.Charting.Axis()
                {
                    LineWidth = 2,
                    MaximumAutoSize = 100,
                    Title = "Day-Time",
                    IsMarginVisible = true,
                    IntervalOffsetType = System.Web.UI.DataVisualization.Charting.DateTimeIntervalType.Auto,
                    IsStartedFromZero = false
                },
                AxisY = new System.Web.UI.DataVisualization.Charting.Axis()
                {
                    LineWidth = 0
                }

            };

            QSORateChart.ChartAreas.Add(ChartAreaChartArea1);

            // get from combobox
            ChartAreaParams.ChartPointInterval = Convert.ToInt32(ChartCtlDataSettingsDto.ControlSettingsDto.ControlYaxisSettingsDto.YaxisInterval);
            //ChartInfo
            int AlphaBlend;
            string YaxisViewtype = ChartCtlDataSettingsDto.ControlSettingsDto.ControlYaxisSettingsDto.YaxisViewType;
            if (YaxisViewtype.Contains("3D"))
            {
                //strip 3d
                string str = YaxisViewtype.Replace("3D", "");
                ChartAreaParams.charttype = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), str.Trim());
                QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.PointDepth = 75;
                QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.PointGapDepth = 75;
                //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Inclination = 20;
                //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.Rotation = 20;
                //QSORateChart.ChartAreas["ChartArea1"].ShadowColor = Color.Transparent;
                //QSORateChart.ChartAreas["ChartArea1"].Area3DStyle.LightStyle= LightStyle.Realistic;
                AlphaBlend = 220;
            }
            else
            {
                ChartAreaParams.charttype = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), YaxisViewtype);
                AlphaBlend = 0xff;
            }
            ChartAreaParams.ChartXaxisInterval = 1;
            ChartAreaParams.ChartXaxisIntervalType = DateTimeIntervalType.Hours;
            //tickmarks and grids.
            ChartAreaParams.MajorVerticalInterval = 24;
            ChartAreaParams.MinorVerticalInterval = 1;
            ChartAreaParams.AxisXMaxFudgeSeconds = 1;

            //check if all years the same
            MixedYears = SetMixedYears(ChartCtlDataSettingsDto.DataCallInfoDto, ContestInfoDTO1, ContestInfoDTO2, ContestInfoDTO3);
            // get from combo box
            ChartAreaParams.MixedYears = MixedYears;


            //ChartTickmarkInfo XMajorTickMarkObj = new ChartTickmarkInfo(ChartXaxisIntervalType, 24, 5, Color.Red, 2);
            ChartAreaDto ChartAreaDto = new ChartAreaDto(ChartAreaParams);

            TickMarkInfoParams TMinfo = new TickMarkInfoParams();
            GridInfoParams CgInfo = new GridInfoParams();
            //Major Vertical 
            TMinfo.IntervalType = ChartAreaDto.ChartXaxisIntervalType;
            TMinfo.Interval = ChartAreaDto.MajorHorizontalInterval;
            TMinfo.Size = 5;
            TMinfo.LineColor = Color.Red;
            TMinfo.LineWidth = 1;
            TMinfo.Style = TickMarkStyle.OutsideArea;

            ChartAreaDto.CreateChartTickmark(QSORateChart.ChartAreas["ChartArea1"].AxisX.MajorTickMark, ChartAreaDto.VerticalType.Major, TMinfo);

            CgInfo.IntervalType = ChartAreaDto.ChartXaxisIntervalType;// need  to set for lines to appear
            CgInfo.Interval = ChartAreaDto.MajorHorizontalInterval;
            CgInfo.LineColor = Color.Red;
            CgInfo.LineDashStyle = ChartDashStyle.Dot;
            CgInfo.LineWidth = 1;
            ChartAreaDto.CreateChartGrid(QSORateChart.ChartAreas["ChartArea1"].AxisX.MajorGrid, ChartAreaDto.VerticalType.Major, CgInfo);

            //Minor Vertical 
            TMinfo.IntervalType = ChartAreaDto.ChartXaxisIntervalType;
            TMinfo.Interval = ChartAreaDto.MinorHorizontalInterval;
            TMinfo.Size = 2;
            TMinfo.LineColor = Color.Black;
            TMinfo.LineWidth = 1;
            TMinfo.Style = TickMarkStyle.OutsideArea;

            ChartAreaDto.CreateChartTickmark(QSORateChart.ChartAreas["ChartArea1"].AxisX.MinorTickMark, ChartAreaDto.VerticalType.Minor, TMinfo);

            CgInfo.IntervalType = ChartAreaDto.ChartXaxisIntervalType;// need  to set for lines to appear
            CgInfo.Interval = ChartAreaDto.MinorHorizontalInterval;
            CgInfo.LineColor = Color.FromArgb(37, 0, 0, 0);
            CgInfo.LineDashStyle = ChartDashStyle.Solid;
            CgInfo.LineWidth = 1;
            ChartAreaDto.CreateChartGrid(QSORateChart.ChartAreas["ChartArea1"].AxisX.MinorGrid, ChartAreaDto.VerticalType.Minor, CgInfo);

            string QSOQuery = string.Empty;
            ContestViewParmsDTO ContestViewParmsDTO = null; //dummy
            //Series
            ICollection<SeriesObj> SerCollection = new System.Collections.ObjectModel.Collection<SeriesObj>();


            string YaxisFunction = ChartCtlDataSettingsDto.ControlSettingsDto.ControlYaxisSettingsDto.YaxisFunction;
            QSOLogFilter QSOFilter;
            QSOFilter = ChartQuery.GetQSOFilter(ChartCtlDataSettingsDto.ControlSettingsDto.ControlFiltersSettingsDto,
                                                ChartCtlDataSettingsDto.DataCallInfoDto);


            if (!string.IsNullOrEmpty(ChartCtlDataSettingsDto.DataCallInfoDto[0].SelectedCall) && !ChartCtlDataSettingsDto.DataCallInfoDto[0].Disabled)
            {
                QsoRadioStationFilter QsoRadioStationFilter = ChartQuery.GetQsoRadioStationFilter(ChartCtlDataSettingsDto.DataCallInfoDto[0]);
                ChartQuery.GetQuery(LogRepository, QSORateChart.ID, QSOFilter, QsoRadioStationFilter, ChartCtlDataSettingsDto.DataCallInfoDto[0], ChartCtlDataSettingsDto.ControlSettingsDto,
                    ContestInfoDTO1, ChartAreaDto, YaxisFunction, out ContestViewParmsDTO, username);
                SeriesObj Series1Obj = new SeriesObj(ContestInfoDTO1, Color.FromArgb(AlphaBlend, Color.Blue), ChartQuery.GetDataTableSQL);
                bOK = Series1Obj.Create(LogRepository, ChartAreaDto, QSORateChart.ID, ContestViewParmsDTO, username);
                if (bOK)
                {
                    QSORateChart.Series.Add(Series1Obj);
                    SerCollection.Add(Series1Obj);
                }
            }

            if (!string.IsNullOrEmpty(ChartCtlDataSettingsDto.DataCallInfoDto[1].SelectedCall) && !ChartCtlDataSettingsDto.DataCallInfoDto[1].Disabled)
            {
                QsoRadioStationFilter QsoRadioStationFilter = ChartQuery.GetQsoRadioStationFilter(ChartCtlDataSettingsDto.DataCallInfoDto[1]);
                ChartQuery.GetQuery(LogRepository, QSORateChart.ID, QSOFilter, QsoRadioStationFilter, ChartCtlDataSettingsDto.DataCallInfoDto[1], ChartCtlDataSettingsDto.ControlSettingsDto,
                    ContestInfoDTO2, ChartAreaDto, YaxisFunction, out ContestViewParmsDTO, username);
                SeriesObj Series2Obj = new SeriesObj(ContestInfoDTO2, Color.FromArgb(AlphaBlend, Color.OrangeRed), ChartQuery.GetDataTableSQL);
                bOK = Series2Obj.Create(LogRepository, ChartAreaDto, QSORateChart.ID, ContestViewParmsDTO, username);
                if (bOK)
                {
                    QSORateChart.Series.Add(Series2Obj);
                    //string st = QSORateChart.Series[Series2Obj.Name].ChartArea;
                    //QSORateChart.Series[Series2Obj.Name].ChartArea = Chart1.ChartAreas["ChartArea1"].Name;
                    SerCollection.Add(Series2Obj);
                }
            }

            if (!string.IsNullOrEmpty(ChartCtlDataSettingsDto.DataCallInfoDto[2].SelectedCall) && !ChartCtlDataSettingsDto.DataCallInfoDto[2].Disabled)
            {
                QsoRadioStationFilter QsoRadioStationFilter = ChartQuery.GetQsoRadioStationFilter(ChartCtlDataSettingsDto.DataCallInfoDto[2]);
                ChartQuery.GetQuery(LogRepository, QSORateChart.ID, QSOFilter, QsoRadioStationFilter, ChartCtlDataSettingsDto.DataCallInfoDto[2], ChartCtlDataSettingsDto.ControlSettingsDto,
                    ContestInfoDTO3, ChartAreaDto, YaxisFunction, out ContestViewParmsDTO, username);
                SeriesObj Series3Obj = new SeriesObj(ContestInfoDTO3, Color.FromArgb(AlphaBlend, Color.SeaGreen), ChartQuery.GetDataTableSQL);
                bOK = Series3Obj.Create(LogRepository, ChartAreaDto, QSORateChart.ID, ContestViewParmsDTO, username);
                if (bOK)
                {
                    QSORateChart.Series.Add(Series3Obj);
                    SerCollection.Add(Series3Obj);
                }
            }


            //set 2nd titles
            string key = "";
            foreach (SeriesObj obj in SerCollection)
            {
                switch (obj.ContestInfoDTO.CallGroup)
                {
                    case Logqso.mvc.common.Enum.CallGroupEnum.CALL1:
                        key = "Tkey1";
                        break;
                    case Logqso.mvc.common.Enum.CallGroupEnum.CALL2:
                        key = "Tkey2";
                        break;
                    case Logqso.mvc.common.Enum.CallGroupEnum.CALL3:
                        key = "Tkey3";
                        break;
                    default:
                        break;
                }
                if (obj.ContestInfoDTO.Call != string.Empty)
                {
                    string OPr = string.Empty;
                    switch (obj.ContestInfoDTO.CatOperatorEnum)
	                {
		                case Logqso.mvc.common.Enum.CatOperatorEnum.ALL:
                            //should never occur
                            break;
                        case Logqso.mvc.common.Enum.CatOperatorEnum.SINGLE_OP:
                            if (obj.ContestInfoDTO.CatBandEnum == common.Enum.CatBandEnum.ALL)
	                        {
                                OPr = "SOAB";
	                        }else{
                                OPr = "SOSB";
                            }
                            break;
                        case Logqso.mvc.common.Enum.CatOperatorEnum.MULTI_OP:
                            if (obj.ContestInfoDTO.CatNoOfTxEnum == common.Enum.CatNoOfTxEnum.ONE)
	                        {
                                OPr = "MS";
	                        }
                            else if (obj.ContestInfoDTO.CatNoOfTxEnum == common.Enum.CatNoOfTxEnum.TWO)
                            {
                                OPr = "M2";
                            }
                            else{
                                OPr = "MM";
                            }
                            break;
                        case Logqso.mvc.common.Enum.CatOperatorEnum.CHECKLOG:
                           OPr = "CHECKLOG";
                           break;
                        default:
                            break;
	                }
                    if (OPr == "SOSB")
                    {
                        switch (obj.ContestInfoDTO.CatBandEnum)
                        {
                            case Logqso.mvc.common.Enum.CatBandEnum.ALL:
                                 //doews not occur
                                 break;
                            case Logqso.mvc.common.Enum.CatBandEnum._160M:
                                 OPr += " 160M";
                                 break;
                            case Logqso.mvc.common.Enum.CatBandEnum._80M:
                                OPr += "  80M";
                                break;
                            case Logqso.mvc.common.Enum.CatBandEnum._40M:
                                OPr += "  40M";
                                break;
                            case Logqso.mvc.common.Enum.CatBandEnum._20M:
                                OPr += "  20M";
                                break;
                            case Logqso.mvc.common.Enum.CatBandEnum._15M:
                                OPr += "  15M";
                                break;
                            case Logqso.mvc.common.Enum.CatBandEnum._10M:
                                OPr += "  10M";
                                break;
                            default:
                                break;
                        }
                        switch (obj.ContestInfoDTO.CatPowerEnum)
                        {
                            case Logqso.mvc.common.Enum.CatPowerEnum.ALL:
                                //does not occur
                                break;
                            case Logqso.mvc.common.Enum.CatPowerEnum.HIGH:
                                OPr += " HIGH";
                                break;
                            case Logqso.mvc.common.Enum.CatPowerEnum.LOW:
                                OPr += "  LOW";
                                break;
                            case Logqso.mvc.common.Enum.CatPowerEnum.QRP:
                                OPr += "  QRP";
                                break;
                            default:
                                break;
                        }
                        if (obj.ContestInfoDTO.CatAssistedEnum == common.Enum.CatAssistedEnum.ASSISTED)
                        {
                            OPr += " Assisted";
                        }
                        else
                        {
                            OPr += " Non-Assisted";
                        }
                    }
                    QSORateChart.Titles[key].Text += string.Format("{0} {1} {2}",
                        obj.ContestInfoDTO.Call.PadRight(10), obj.ContestInfoDTO.ContestName,
                        OPr);
                    //QSORateChart.Titles[key].ForeColor = Color.FromArgb(0xff, 0, 99, 99);

                }

            }

            //Select Log that exists
            ContestInfoDTO ContestInfoDTON = null;
            if (ContestInfoDTO1 != null)
            {
                ContestInfoDTON = ContestInfoDTO1;
            }
            else if (ContestInfoDTO2 != null)
            {
                ContestInfoDTON = ContestInfoDTO2;
            }
            else if (ContestInfoDTO3 != null)
            {
                ContestInfoDTON = ContestInfoDTO2;
            }

            //TITLES
            if (ChartAreaDto.MixedYears)
            {
                QSORateChart.Titles["ChartName"].Text = ContestViewParmsDTO.sTitle;
            }
            else
            {
                if (ContestInfoDTON != null)
                {
                    QSORateChart.Titles["ChartName"].Text = string.Format("{0}  {1}", ContestInfoDTON.ContestID, ContestViewParmsDTO.sTitle);
                }
            }
            string ver = ConfigurationManager.AppSettings["AppVersion"].ToString();
            QSORateChart.Titles["Vers"].Text = string.Format("Version:  {0}", ver);

            //AXISX
            Font fontAxis = new Font("Times New Roman", 14, FontStyle.Bold);
            AxisInfoParams Ai = new AxisInfoParams();
            Ai.TitleFont = fontAxis;
            Ai.Title = "Time";
            Ai.LineWidth = 1;
            Ai.LabelStyleFormat = "{0:HH:mm}";
            Ai.LabelStyleAngle = -90;
            //Date can be different but times are the same 48 hours
            if (ChartAreaDto.MixedYears)
            {
                if (ContestInfoDTON != null)
                {
                    int days = ContestInfoDTON.endTime.AddMinutes(1).Subtract(ContestInfoDTON.startTime).Days;
                    Ai.Minimum = DateTime.Parse("1/1/1990 " + ContestInfoDTON.startTime.TimeOfDay).ToOADate();
                    Ai.Maximum = DateTime.Parse("1/" + string.Format("{0}", 1 + days) + "/1990 " +
                        ContestInfoDTON.endTime.AddSeconds(ChartAreaDto.AxisXMaxFudgeSeconds).TimeOfDay).ToOADate();
                }
            }
            else
            {
                if (ContestInfoDTO1 != null && !ContestInfoDTO1.Disabled)
                {
                    Ai.Minimum = ContestInfoDTO1.startTime.ToOADate();
                    Ai.Maximum = ContestInfoDTO1.endTime.AddSeconds(ChartAreaDto.AxisXMaxFudgeSeconds).ToOADate();
                }
                else if (ContestInfoDTO2 != null && !ContestInfoDTO2.Disabled)
                {
                    Ai.Minimum = ContestInfoDTO2.startTime.ToOADate();
                    Ai.Maximum = ContestInfoDTO2.endTime.AddSeconds(ChartAreaDto.AxisXMaxFudgeSeconds).ToOADate();
                }
                else if ( ContestInfoDTO3 != null && !ContestInfoDTO3.Disabled)
                {
                    Ai.Minimum = ContestInfoDTO3.startTime.ToOADate();
                    Ai.Maximum = ContestInfoDTO3.endTime.AddSeconds(ChartAreaDto.AxisXMaxFudgeSeconds).ToOADate();
                }
            }
            Ai.IntervalType = ChartAreaDto.ChartXaxisIntervalType;
            Ai.Interval = ChartAreaDto.MinorHorizontalInterval;
            ChartAreaDto.InitChartAxis(QSORateChart.ChartAreas["ChartArea1"].AxisX, Ai);

            // set second row of labels
            QSORateChart.ChartAreas["ChartArea1"].AxisX.CustomLabels.Add(24, ChartAreaDto.ChartXaxisIntervalType, "Day {0:dd}", 2, LabelMarkStyle.LineSideMark);
            //QSORateChart.ChartAreas["ChartArea1"].AxisX.LabelAutoFitStyle = LabelAutoFitStyles.DecreaseFont | LabelAutoFitStyles.StaggeredLabels | LabelAutoFitStyles.LabelsAngleStep90;
            //QSORateChart.Series[Series1Obj.Name].AxisLabel = "#VALX{dd}\n#VALX{MMM}\n#VALX{yyy}";
            //QSORateChart.ChartAreas["ChartArea1"].AxisX.LabelStyle.IsEndLabelVisible = true;
            //QSORateChart.ChartAreas["ChartArea1"].InnerPlotPosition = new ElementPosition(0, 0, 90, 100);
            //QSORateChart.ChartAreas["ChartArea1"].AxisX.IntervalOffset = 15;
            //QSORateChart.ChartAreas["ChartArea1"].AxisX.IntervalOffsetType = DateTimeIntervalType.Minutes;
            //TabContainerCall.Controls.Add(
            ////SCALEVIEW
            int startHour = Convert.ToInt32(ChartCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisStarttime.Substring(0, 2));
            int Size = Convert.ToInt32(ChartCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisDuration);

            if (Size != 48)
            {
                int Day = 1;
                if (ChartCtlDataSettingsDto.ControlSettingsDto.ControlXaxisSettingsDto.XaxisStarttime.Contains("Day2"))
                {
                    Day = 2;
                }
                QSORateChart.ChartAreas["ChartArea1"].AxisX.IsStartedFromZero = true;
                DateTime pos;

                if (ChartAreaDto.MixedYears)
                {
                    pos = new DateTime(1990, 1, Day, startHour, 00, 00);
                }
                else
                {
                    if (ContestInfoDTON != null)
                    {
                        if (Day == 2)
                        {
                            pos = ContestInfoDTON.startTime.AddDays(1).AddHours(startHour);
                        }
                        else
                        {
                            pos = ContestInfoDTON.startTime.AddHours(startHour);
                        }
                    }else
	                {
                        pos = new DateTime(1990, 1, Day, startHour, 00, 00);
	                }
                }
                QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.Position = pos.ToOADate();
                QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.Size = Size;// count of ScaleView.SizeType
                QSORateChart.ChartAreas["ChartArea1"].AxisX.ScaleView.SizeType = ChartAreaParams.ChartXaxisIntervalType;
            }


            //AXISY
            //QSORateChart.ImageLocation
            QSORateChart.ChartAreas["ChartArea1"].AxisY.TitleFont = fontAxis;
            QSORateChart.ChartAreas["ChartArea1"].AxisY.Title = ContestViewParmsDTO.sYAxis;
            QSORateChart.ChartAreas["ChartArea1"].AxisY.LabelStyle.Format = "{0:n0}";
            if (ChartCtlDataSettingsDto.ControlSettingsDto.ControlYaxisSettingsDto.YaxisFunction.Contains("Sum"))
            {
                QSORateChart.ChartAreas["ChartArea1"].AxisY.Enabled = AxisEnabled.False;
            }
            QSORateChart.ChartAreas["ChartArea1"].AxisY2.Enabled = AxisEnabled.True;
            QSORateChart.ChartAreas["ChartArea1"].AxisY2.LineWidth = 0;
            QSORateChart.ChartAreas["ChartArea1"].AxisY2.LabelStyle.Format = "{0:n0}";
            QSORateChart.ChartAreas["ChartArea1"].Position = new ElementPosition(0, 10, 100, 80);
            QSORateChart.Titles["ChartName"].Position = new ElementPosition(2, 0, 50, 10);
            QSORateChart.Legends["Legend1"].Position = new ElementPosition(50, 1, 50, 9);

            // LEGENDS
            QSORateChart.Legends["Legend1"].ForeColor = Color.DarkOliveGreen;
            Font fontLegend = new Font("Times New Roman", 11, FontStyle.Bold, GraphicsUnit.Point);
            QSORateChart.Legends["Legend1"].Font = fontLegend;
            QSORateChart.Legends["Legend1"].Position.Height = 7;

            // draw!
            //QSORateChart.Invalidate();
            //string path = Server.MapPath("~/ChartImages/chart.png");
            try
            {
                //String filePath = HostingEnvironment.MapPath("~/Image/charttest.png");
                //QSORateChart.SaveImage(filePath, System.Web.UI.DataVisualization.Charting.ChartImageFormat.Png);
                //FileStream fileStream = new FileStream(filePath, FileMode.Open);
                //Image image = System.Drawing.Image.FromStream(fileStream);
                //MemoryStream memoryStream = new MemoryStream();
                //image.Save(memoryStream, ImageFormat.Png);

                MemoryStream = new MemoryStream();
                QSORateChart.SaveImage(MemoryStream, ChartImageFormat.Png);
            }
            catch (Exception ex)
            {
                
                throw;
            }

            return MemoryStream;

        }

        public void LoadContestInfoDTO(ChartCtlDataSettingsDto ChartCtlDataSettingsDto, IList<ContestInfoDTO> IContestInfoDTOList, IRepositoryAsync<Log> LogRepository, string username )
        {
            foreach (var item in ChartCtlDataSettingsDto.DataCallInfoDto)
	        {
                if (item.SelectedCall != string.Empty) //Call in Call?
                {
                    string ContestName = item.SelectedContestName;
                    ContestInfoDTO ContestInfoDTO;
                    ContestInfoDTO = LogRepository.GetContestInfo(item, username).Result;


                    int day1 = ContestInfoDTO.startTime.Day;
                    ContestInfoDTO.basedstartTime = DateTime.Parse("1/1/1990 " + ContestInfoDTO.startTime.TimeOfDay);
                    ContestInfoDTO.basedendTime = DateTime.Parse("1/" + string.Format("{0}", 1 + ContestInfoDTO.endTime.Day - day1) + "/1990 " + ContestInfoDTO.endTime.TimeOfDay);
                    IContestInfoDTOList.Add(ContestInfoDTO);
                }
	        }

        }

        protected void QSORateChart_CustomizeLegend(object sender, CustomizeLegendEventArgs e)
        {
            // Loop through all default legend items
            if (e.LegendName == "Legend1")
            {
                foreach (LegendItem item in e.LegendItems)
                {
                    item.ImageStyle = LegendImageStyle.Rectangle;
                    //item.Cells[1].Text = "My Name";
                }

            }

        }


        protected void QSORateChart_Customize(object sender,EventArgs e)
        {
            System.Web.UI.DataVisualization.Charting.Chart CH = sender as System.Web.UI.DataVisualization.Charting.Chart;
            CH.Titles["Corp"].Url = "http://www.psws.com";

        }



        protected bool SetMixedYears(DataCallInfoDto[] DataCallInfoDto, ContestInfoDTO ContestInfoDTO1, ContestInfoDTO ContestInfoDTO2, ContestInfoDTO ContestInfoDTO3)
        {
            bool MixedYears = true;

            if ((ContestInfoDTO1 != null && DataCallInfoDto[0].Disabled) && (ContestInfoDTO2 != null && DataCallInfoDto[1].Disabled) ||
                (ContestInfoDTO1 != null && DataCallInfoDto[0].Disabled) && (ContestInfoDTO3 != null && DataCallInfoDto[2].Disabled) ||
                (ContestInfoDTO2 != null && DataCallInfoDto[1].Disabled) && (ContestInfoDTO3 != null && DataCallInfoDto[2].Disabled))
            {
                MixedYears = false;
            }
            else if (ContestInfoDTO1 != null && DataCallInfoDto[0].Disabled)
            {
                if (  (ContestInfoDTO2 != null && ContestInfoDTO3 != null) && DataCallInfoDto[1].SelectedContestName == DataCallInfoDto[2].SelectedContestName)
                {
                    MixedYears = false;
                }
            }
            else if (ContestInfoDTO2 != null && DataCallInfoDto[1].Disabled)
            {
                if ((ContestInfoDTO1 != null && ContestInfoDTO3 != null) && DataCallInfoDto[0].SelectedContestName == DataCallInfoDto[2].SelectedContestName)
                {
                    MixedYears = false;
                }
            }
            else if (ContestInfoDTO3 != null && DataCallInfoDto[2].Disabled)
            {
                if ((ContestInfoDTO1 != null && ContestInfoDTO2 != null) && DataCallInfoDto[0].SelectedContestName == DataCallInfoDto[1].SelectedContestName)
                {
                    MixedYears = false;
                }
            }
            else if (ContestInfoDTO1 != null && ContestInfoDTO2 != null && ContestInfoDTO3 != null)
                if (DataCallInfoDto[0].SelectedContestName == DataCallInfoDto[1].SelectedContestName && DataCallInfoDto[0].SelectedContestName == DataCallInfoDto[2].SelectedContestName)
                {
                    MixedYears = false;
                }

            return MixedYears;
        }
    }

}
