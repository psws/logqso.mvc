using System;
using System.Linq;  //THIS line must be here for IqueryFluent to work

//using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using Infrastructure;
using Repository.Pattern;
using Repository.Pattern.Ef6;

////using System;
////using System.Configuration;
////using System.Data.SqlClient;
////using System.IO;
////using System.Linq;
//////using Microsoft.SqlServer.Management.Common;
//////using Microsoft.SqlServer.Management.Smo;
////using Microsoft.VisualStudio.TestTools.UnitTesting;
////using Repository.Pattern.DataContext;
////using Repository.Pattern.Ef6;
////using Infrastructure;
////using Repository.Pattern.Repositories;
////using Repository.Pattern.UnitOfWork;
//////using Service.Pattern;


using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.Models;



namespace Logqso.mvc.domain.test.IntegrationTests.Data
{
    [TestClass]
    public class IntegrationDataRepositoryTests
    {
       // private readonly string CatOprName = "Hello Test";
        private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        int LogId = 1;

        public TestContext TestContext { get; set; }  //for trace debuggibg

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\logqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_LogResository_Log_Find_Return_Log()
        {
            Logqso.mvc.Entities.LogDataEntity.Log Log1 = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository = new Repository<Log>(context, unitOfWork);

                try
                {
                    Log1 = _logRepository.Find(LogId);
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogResository_Log_Find_Return_Log exception {0}",ex.Message) );

                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(Log1);
                Assert.IsInstanceOfType(Log1, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(Log1.LogId, LogId);
                Assert.IsInstanceOfType(Log1.ContestYear, typeof(DateTime));
                Assert.AreEqual(Log1.CallsignId, 1);

            }
        }

        [TestMethod]
        public void Integration_LogDataContext_LogResository_Log_FindAsync_Return_Log()
        {
            Logqso.mvc.Entities.LogDataEntity.Log Log1 = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);

                try
                {
                    var Logtask = _logRepository.FindAsync(LogId);
                    Log1 = Logtask.Result;
                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogResository_Log_FindAsync_Return_Log exception {0}",ex.Message) );
                    
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(Log1);
                Assert.IsInstanceOfType(Log1, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(Log1.LogId, LogId);
                Assert.IsInstanceOfType(Log1.ContestYear, typeof(DateTime));
                Assert.AreEqual(Log1.CallsignId, 1);

            }
        }


        [TestMethod]
        public void Integration_LogDataContext_LogRepository_Query_Log_Include_LogCategory_Return_LogCategory_Qsoes_Stations_CallSign()
        {
            //List<Logqso.mvc.Entities.LogDataEntity.Log> LogforId1s = null;
            // context object LogDataContext matches the same name used for LogqsoData DB
            using (IDataContextAsync context = new LogqsoDataContext())
            //IUnitOfWorkDataAsync and UnitOfWorkData are used in order for Dependency Injection to inject the DataDB
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);
                Log Logtask = null;

                try
                {
                    Logtask = _logRepository.Query(x => x.LogId == 1)
                     .Include(x => x.Qsoes).Include(x=>x.Stations).Include(x=>x.LogCategory).Include(x=>x.CallSign)
                     .Select()
                     .SingleOrDefault();
                     
                    //TestContext.WriteLine("Integration_LogDataContext_LogRepository_Query_Log_Include_LogCategory_Return_LogCategorie_Qsoes_Stations_Callsign exception");


                    //LogforId1s = Logtask as List<Log>;

                }
                catch (Exception ex)
                {
                    TestContext.WriteLine(string.Format("Integration_LogDataContext_LogRepository_Query_Log_Include_LogCategory_Return_LogCategorie_Qsoes_Stations_Callsign exception {0}", ex.Message));
                    caught = true;
                }
                Assert.IsFalse(caught);  //exception
                Assert.IsNotNull(Logtask);
                Assert.IsInstanceOfType(Logtask, typeof(Logqso.mvc.Entities.LogDataEntity.Log));
                Assert.AreEqual(Logtask.LogId, LogId);
                Assert.IsInstanceOfType(Logtask.ContestYear, typeof(DateTime));
                Assert.AreEqual(Logtask.CallsignId, 1);
                 Assert.IsNotNull(Logtask.LogCategory);
                 Assert.AreEqual(Logtask.LogCategory.CatBandEnum, (int)Logqso.mvc.common.Enum.CatBandEnum.ALL);
                Assert.IsNotNull(Logtask.Qsoes);

                Assert.AreEqual(Logtask.Qsoes.Count, 2);
                Assert.IsNotNull(Logtask.Stations);
                Assert.AreEqual(Logtask.Stations.Count, 4);
                Assert.IsNotNull(Logtask.CallSign);
                Assert.AreEqual(Logtask.CallSign.Call, "CN2R");

            }
        }

#if false
        [TestMethod]
        public void Integration_LogControlContext_CreateControlCatOperator_ValidIndex_Exception_Duplicate_Key()
        {

            // Create new customer
            // context object LogControlContext matches the same name used for Logqso DB
            using (IDataContextAsync context = new LogControlContext())
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                bool caught = false;
                IRepositoryAsync<CatOperator> CatOperatorRepository = new Repository<CatOperator>(context, unitOfWork);
                var CatOperator = new CatOperator
                {
                    CatOpr = (int)CatOperatorEnum.SINGLE_OP,
                    CatOprName = CatOprName,
                    Index = 2,
                    ObjectState = ObjectState.Added,
                };

                try
                {
                    CatOperatorRepository.Insert(CatOperator);
                    unitOfWork.SaveChanges();
                }
                catch (System.Data.Entity.Validation.DbEntityValidationException)
                {

                }
                catch (System.Data.Entity.Core.UpdateException)
                {
                    //caught = true;
                }
                catch (System.Data.Entity.Infrastructure.DbUpdateException)
                {
                    caught = true;
                }

                Assert.IsTrue(caught);

            }


            ////  Query for newly created CatOperator by ID from a new context, to ensure it's not pulling from cache
            //using (IDataContextAsync context = new LogControlContext())
            //using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            //{
            //    IRepositoryAsync<CatOperator> CatOperatorRepository = new Repository<CatOperator>(context, unitOfWork);
            //    var Query = CatOperatorRepository.Query(c => c.CatOprName == CatOprName);
            //    var list = Query.Select(c=>c.CatOprName);
            //    //Query.Select().

            //    //var CatOperator1 = (CatOperatorRepository.Query(c => c.CatOprName == CatOprName);
            //    //if (CatOperator1 != null)
            //    //{
            //    //    var CatOperator2 = CatOperatorRepository.Find(CatOperator1);
            //    //    Assert.AreEqual(CatOperator2.CatOprName, CatOprName);
            //    //}
            //    //Assert.AreEqual(CatOperator1.CatOprName, CatOprName); 
            //}

        }

        [TestMethod]
        public void Integration_ControlService_GetContestControlNamesAsync()
        {
            using (IDataContextAsync context = new LogControlContext())
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                IRepositoryAsync<CatOperator> CatOperatorRepository = new Repository<CatOperator>(context, unitOfWork);
                IControlService ContolService = new ControlService(CatOperatorRepository);

                var asyncTask = ContolService.GetContestControlNames();
                var ContestControl = asyncTask.Result;

                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatOperator.Count > 1);
                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatAssisted.Count > 1);
                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatBand.Count > 1);
                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatNoOfTx.Count > 1);
                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatPower.Count > 1);
                Assert.IsTrue(ContestControl.ControlCategoryEntity.CatOperator.Contains("SINGLE-OP"));
                
                Assert.IsTrue(ContestControl.ControlFiltersEntity.FiltBand.Count > 1);
                Assert.IsTrue(ContestControl.ControlFiltersEntity.FiltContinent.Count > 1);
                Assert.IsTrue(ContestControl.ControlFiltersEntity.FiltCountryInnerHTML.Count > 1);
                Assert.IsTrue(ContestControl.ControlFiltersEntity.FiltCQZone.Count > 1);

                Assert.IsTrue(ContestControl.ControlXaxisEntity.XaxisDuration.Count > 1);
                Assert.IsTrue(ContestControl.ControlXaxisEntity.XaxisStarttime.Count > 1);

                Assert.IsTrue(ContestControl.ControlYaxisEntity.YaxisFunction.Count > 1);
                Assert.IsTrue(ContestControl.ControlYaxisEntity.YaxisInterval.Count > 1);
                Assert.IsTrue(ContestControl.ControlYaxisEntity.YaxisViewType.Count > 1);
            }
        }
        public void Integration_ControlService_GetsAsync()
        {
            using (IDataContextAsync context = new LogControlContext())
            using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
            {
                IRepositoryAsync<FiltPrefix> FiltCountryRepository = new Repository<FiltPrefix>(context, unitOfWork);
                //Service.Pattern.IService<FiltCountry> CountryService = new Service.Pattern.Service<FiltCountry>(CatOperatorRepository);

                //var asyncTask = ContolService
                //    .Query(x => x.Country == "United States")
                //    .Include(x => x
                //        .Orders
                //        .Select(y => y.OrderDetails))
                //    .OrderBy(x => x
                //        .OrderBy(y => y.CompanyName)
                //        .ThenBy(z => z.ContactName))
                //    .SelectAsync();

                // var customers = asyncTask.Result;

                //Assert.IsTrue(customers.Count() > 1);
                //Assert.IsFalse(customers.Count(x => x.Country == "USA") == 0);
            }
        }
#endif
    }
}
