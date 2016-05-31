using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.Entity;

using Repository.Pattern.DataContext;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;

using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.DataModel.LogData.Models;
using Logqso.mvc.Dto.LogData;
using Logqso.mvc.common.Enum;

namespace Logqso.mvc.domain.test.IntegrationTests.Data
{
    [TestClass]
    public class IntegrationURFSQL
    {
        private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        int LogId = 1;

        public TestContext TestContext { get; set; }  //for trace debuggibg

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\ContestqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_URF_GetDbContext_SqlQuery_ChartQsoRateDTO_Return_ChartQsoRateDTOList()
        {

            using (IDataContextAsync context = new ContestqsoDataContext())
            using (IUnitOfWorkAsync unitOfWorkData = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Qso> QsoRepository = new Repository<Qso>(context, unitOfWorkData);

                List<ChartQsoRateDTO> ChartQsoRateDTOList = null;
                try
                {
                    string sQSOQuery =
                        "use ContestqsoDataTest " +
                        "SELECT [Time1] AS IntvTime, Sum(Qry5minintervals.N) AS N " +
                        " FROM (SELECT   convert(datetime, Format([Qso].[QsoDateTime],'d') " +
                         " + ' ' + Format(DatePart(hh,[Qso].[QsoDateTime]),'00') " +
                          " + ':' + Format((DatePart(n,[Qso].[QsoDateTime])/60)*60,'00') )AS [Time1] , " +
                       " Count(*) AS N " +
                          " FROM Qso INNER JOIN Log ON Qso.LogId = log.LogId " +
                          "  INNER JOIN CallSign ON [Qso].[CallsignId] = [CallSign].[CallSignId] " +
                           "  AND Log.LogId = 1 " +
                            "  GROUP BY  [Qso].[QsoDateTime] ) AS Qry5minintervals  " +
                            "  GROUP BY [Time1] ";


                    TestContext.WriteLine("Integration_LogDataContext_URF_GetDbContext_SqlQuery_ChartQsoRateDTO_Return_ChartQsoRateDTOList");
#if false
                    //tracked
                    //EXAMPLES
                     using (var ctx = new ContestqsoDataContext())
                     {
                         var list1 = ctx.Stations.SqlQuery("Select * from Station").ToList<Station>();
                         var list2 = ctx.Database.SqlQuery<string>("Select Station.Stationname from Station ").ToList();
                         sQSOQuery = "use ContestqsoDataTest " +
                                    "select QsoDateTime from Qso where  Qso.Logid = 1 ";
                         var list3 = ctx.Database.SqlQuery<DateTime>(sQSOQuery).ToList();

                         //SQL
                           //use ContestqsoDataTest 
                           //   select QsoDateTime as IntvTime, Count(*) as N 
                           //   from QSO where Qso.Logid = 1 
                           //   group by QsoDateTime
                         sQSOQuery = "use ContestqsoDataTest " +
                              " select [Qso].[QsoDateTime] as IntvTime, Count(*) as N " +
                              " from [QSO] where [Qso].[Logid] = 1 " +
                              " group by [Qso].[QsoDateTime]";
                         var list4 = ctx.Database.SqlQuery<ChartQsoRateDTO>(sQSOQuery).ToList();

                         sQSOQuery = "use ContestqsoDataTest " +
                             " select [Qso].[QsoDateTime] as IntvTime, Count(*) as N " +
                             " from [QSO] where [Qso].[Logid] = 1 " +
                             " group by [Qso].[QsoDateTime]";
                         //the new ChartQsoRateDTO is not required sunce the 'as' maps directly to ChartQsoRateDTO members
                         var list5 = ctx.Database.SqlQuery<ChartQsoRateDTO>(sQSOQuery)
                             .Select (p=> new ChartQsoRateDTO
                                {
                                 IntvTime = p.IntvTime,
                                 N = p.N
                                 }).ToList();

                         sQSOQuery =
                           "use ContestqsoDataTest " +
                           "SELECT [Time1] AS IntvTime, Sum(Qry5minintervals.N) AS N " +
                           " FROM (SELECT   Format([Qso].[QsoDateTime],'d') " +
                            " + ' ' + Format(DatePart(hh,[Qso].[QsoDateTime]),'00') " +
                             " + ':' + Format((DatePart(n,[Qso].[QsoDateTime])/60)*60,'00')AS [Time1] , " +
                          " Count(*) AS N " +
                             " FROM Qso INNER JOIN Log ON Qso.LogId = log.LogId " +
                             "  INNER JOIN CallSign ON [Qso].[CallsignId] = [CallSign].[CallSignId] " +
                              "  AND Log.LogId = 1 " +
                               "  GROUP BY  [Qso].[QsoDateTime] ) AS Qry5minintervals  " +
                               "  GROUP BY [Time1] ";
                         var list6 = ChartQsoRateDTOList = ctx.Database.SqlQuery<ChartQsoRateDTO>(sQSOQuery).ToList();

                     }
#endif

                    //DbContext = context as DbContext;
                    //var vals = DbContext.Database.SqlQuery<ChartQsoRateDTO>(sQSOQuery).ToList();
                    ContestqsoDataContext ContestqsoDataContext = QsoRepository.GetDbContext() as ContestqsoDataContext;

                    ChartQsoRateDTOList = ContestqsoDataContext.Database.SqlQuery<ChartQsoRateDTO>(sQSOQuery)
                            .Select(p => new ChartQsoRateDTO
                                {
                                    IntvTime = p.IntvTime,
                                    N = p.N
                                }).OrderBy(p=>p.IntvTime).ToList();


                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_URF_GetDbContext_SqlQuery_ChartQsoRateDTO_Return_ChartQsoRateDTOList {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(ChartQsoRateDTOList);
                Assert.IsInstanceOfType(ChartQsoRateDTOList, typeof(List<ChartQsoRateDTO>));
                Assert.AreEqual(ChartQsoRateDTOList.Count, 2);
                Assert.IsNotNull(ChartQsoRateDTOList[0].IntvTime == DateTime.Parse("10/26/2002 00:00") );
                Assert.IsNotNull(ChartQsoRateDTOList[0].N == 2);

            }
        }
    }
}
