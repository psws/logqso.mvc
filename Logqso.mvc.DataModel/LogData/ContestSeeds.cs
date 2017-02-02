using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.DataModels;

namespace Logqso.mvc.DataModel.LogData
{
    public class ContestSeeds
    {
        //  add to configuration.cs          ContestSeeds.SeedContest(context);

        public static void SeedContest(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            context.Contest.AddOrUpdate(
            p => p.ContestId,
                new Contest { ContestId = "CQWWSSB1999", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 1999", StartDateTime = DateTime.Parse("10/30/1999 00:00:00"), EndDateTime = DateTime.Parse("10/31/1999 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2002", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2002", StartDateTime = DateTime.Parse("10/26/2002 00:00:00"), EndDateTime = DateTime.Parse("10/27/2002 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2002", QsoModeTypeEnum = QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2002", StartDateTime = DateTime.Parse("11/23/2002 00:00:00"), EndDateTime = DateTime.Parse("11/24/2002 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2003", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW , 
                                    ContestName = "Cqww Ssb 2003", StartDateTime = DateTime.Parse("10/25/2003 00:00:00"), EndDateTime = DateTime.Parse("10/26/2003 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2003", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW,
                                    ContestName = "Cqww Cw 2003", StartDateTime = DateTime.Parse("11/29/2003 00:00:00"), EndDateTime = DateTime.Parse("11/30/2003 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2004", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2004", StartDateTime = DateTime.Parse("10/30/2004 00:00:00"), EndDateTime = DateTime.Parse("10/31/2004 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2004", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2004", StartDateTime = DateTime.Parse("11/27/2004 00:00:00"), EndDateTime = DateTime.Parse("11/28/2004 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2005", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2005", StartDateTime = DateTime.Parse("10/29/2005 00:00:00"), EndDateTime = DateTime.Parse("10/30/2005 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2005", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2005", StartDateTime = DateTime.Parse("11/26/2005 00:00:00"), EndDateTime = DateTime.Parse("11/27/2005 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2006", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2006", StartDateTime = DateTime.Parse("10/28/2006 00:00:00"), EndDateTime = DateTime.Parse("10/29/2006 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2006", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2006", StartDateTime = DateTime.Parse("11/25/2006 00:00:00"), EndDateTime = DateTime.Parse("11/26/2006 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2007", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2007", StartDateTime = DateTime.Parse("10/27/2007 00:00:00"), EndDateTime = DateTime.Parse("10/28/2007 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2007", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2007", StartDateTime = DateTime.Parse("11/24/2007 00:00:00"), EndDateTime = DateTime.Parse("11/25/2007 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2008", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2008", StartDateTime = DateTime.Parse("10/25/2008 00:00:00"), EndDateTime = DateTime.Parse("10/26/2008 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2008", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2008", StartDateTime = DateTime.Parse("11/29/2008 00:00:00"), EndDateTime = DateTime.Parse("11/30/2008 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2009", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2009", StartDateTime = DateTime.Parse("10/24/2009 00:00:00"), EndDateTime = DateTime.Parse("10/25/2009 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2009", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2009", StartDateTime = DateTime.Parse("11/28/2009 00:00:00"), EndDateTime = DateTime.Parse("11/29/2009 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2010", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2010", StartDateTime = DateTime.Parse("10/30/2010 00:00:00"), EndDateTime = DateTime.Parse("10/31/2010 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2010", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2010", StartDateTime = DateTime.Parse("11/27/2010 00:00:00"), EndDateTime = DateTime.Parse("11/28/2010 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2011", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2011", StartDateTime = DateTime.Parse("10/29/2011 00:00:00"), EndDateTime = DateTime.Parse("10/30/2011 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2011", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2011", StartDateTime = DateTime.Parse("11/26/2011 00:00:00"), EndDateTime = DateTime.Parse("11/27/2011 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2012", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2012", StartDateTime = DateTime.Parse("10/27/2012 00:00:00"), EndDateTime = DateTime.Parse("10/28/2012 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2012", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2012", StartDateTime = DateTime.Parse("11/24/2012 00:00:00"), EndDateTime = DateTime.Parse("11/25/2012 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2013", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2013", StartDateTime = DateTime.Parse("10/26/2013 00:00:00"), EndDateTime = DateTime.Parse("10/27/2013 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2013", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2013", StartDateTime = DateTime.Parse("11/23/2013 00:00:00"), EndDateTime = DateTime.Parse("11/24/2013 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2014", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2014", StartDateTime = DateTime.Parse("10/25/2014 00:00:00"), EndDateTime = DateTime.Parse("10/26/2014 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2014", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2014", StartDateTime = DateTime.Parse("11/29/2014 00:00:00"), EndDateTime = DateTime.Parse("11/30/2014 11:59:59 PM") },
                 new Contest { ContestId = "CQWWSSB2015", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2015", StartDateTime = DateTime.Parse("10/24/2015 00:00:00"), EndDateTime = DateTime.Parse("10/25/2015 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2015", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2015", StartDateTime = DateTime.Parse("11/28/2015 00:00:00"), EndDateTime = DateTime.Parse("11/29/2015 11:59:59 PM") },
                new Contest { ContestId = "CQWWSSB2016", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Ssb 2016", StartDateTime = DateTime.Parse("10/292016 00:00:00"), EndDateTime = DateTime.Parse("10/30/2016 11:59:59 PM") },
                new Contest { ContestId = "CQWWCW2016", QsoModeTypeEnum =  QsoModeTypeEnum.CW, ContestTypeEnum = ContestTypeEnum.CQWW, 
                                    ContestName = "Cqww Cw 2016", StartDateTime = DateTime.Parse("11/26/2016 00:00:00"), EndDateTime = DateTime.Parse("11/27/2016 11:59:59 PM") },
               //WPX             
                new Contest { ContestId = "CQWPXSSB2001", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2001", StartDateTime = DateTime.Parse("03/24/2001 00:00:00"), EndDateTime = DateTime.Parse("03/25/2001 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2002", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2002", StartDateTime = DateTime.Parse("03/30/2002 00:00:00"), EndDateTime = DateTime.Parse("03/31/2002 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2003", QsoModeTypeEnum = QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2003", StartDateTime = DateTime.Parse("03/29/2003 00:00:00"), EndDateTime = DateTime.Parse("03/30/2003 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2004", QsoModeTypeEnum = QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2004", StartDateTime = DateTime.Parse("03/27/2004 00:00:00"), EndDateTime = DateTime.Parse("03/28/2004 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2005", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2005", StartDateTime = DateTime.Parse("03/26/2005 00:00:00"), EndDateTime = DateTime.Parse("03/27/2005 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2006", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2006", StartDateTime = DateTime.Parse("03/25/2006 00:00:00"), EndDateTime = DateTime.Parse("03/26/2006 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2007", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2007", StartDateTime = DateTime.Parse("03/24/2007 00:00:00"), EndDateTime = DateTime.Parse("03/25/2007 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2008", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2008", StartDateTime = DateTime.Parse("03/29/2008 00:00:00"), EndDateTime = DateTime.Parse("03/30/2008 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2009", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2009", StartDateTime = DateTime.Parse("03/28/2009 00:00:00"), EndDateTime = DateTime.Parse("03/29/2009 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2010", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2010", StartDateTime = DateTime.Parse("03/27/2010 00:00:00"), EndDateTime = DateTime.Parse("03/28/2010 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2011", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2011", StartDateTime = DateTime.Parse("03/26/2011 00:00:00"), EndDateTime = DateTime.Parse("03/27/2011 11:59:59 PM") },
                 new Contest { ContestId = "CQWPXSSB2012", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2012", StartDateTime = DateTime.Parse("03/24/2012 00:00:00"), EndDateTime = DateTime.Parse("03/25/2012 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2013", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2013", StartDateTime = DateTime.Parse("03/30/2013 00:00:00"), EndDateTime = DateTime.Parse("03/31/2013 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2014", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2014", StartDateTime = DateTime.Parse("03/29/2014 00:00:00"), EndDateTime = DateTime.Parse("03/30/2014 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2015", QsoModeTypeEnum = QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2015", StartDateTime = DateTime.Parse("03/28/2015 00:00:00"), EndDateTime = DateTime.Parse("03/29/2015 11:59:59 PM") },
                new Contest { ContestId = "CQWPXSSB2016", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQWPX, 
                                    ContestName = "Cqwpx Ssb 2016", StartDateTime = DateTime.Parse("03/26/2016 00:00:00"), EndDateTime = DateTime.Parse("03/27/2016 11:59:59 PM") },

                //RUSDX
                new Contest { ContestId = "RUSDXC2005", QsoModeTypeEnum =  QsoModeTypeEnum.MIXED, ContestTypeEnum = ContestTypeEnum.RUSDXC , Active = false,
                                    ContestName = "Russian DX 2005", StartDateTime = DateTime.Parse("03/19/2005 12:00:00"), EndDateTime = DateTime.Parse("03/20/2005 11:59:59 AM") },

                //cq160
                new Contest { ContestId = "CQ1602003", QsoModeTypeEnum =  QsoModeTypeEnum.SSB, ContestTypeEnum = ContestTypeEnum.CQ160 , Active = false,
                                    ContestName = "Cq160 Ssb 2003 ", StartDateTime = DateTime.Parse("02/22/2003 00:00:00"), EndDateTime = DateTime.Parse("02/23/2003 11:59:59 PM" ) }

            );


        }

    }
}
