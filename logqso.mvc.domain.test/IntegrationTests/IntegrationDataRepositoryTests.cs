using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Infrastructure;
using Repository.Pattern.Ef6;
using Repository.Pattern;
using Logqso.mvc.Entities.LogControlEntity;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.common.Enum;



namespace Logqso.mvc.domain.test.IntegrationTests
{
    [TestClass]
    public class IntegrationControlRepositoryTests
    {
        private readonly string CatOprName = "Hello Test";

        public TestContext TestContext { get; set; }

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\logqsoTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_CreateDataCatOperator_NoIndex_Exception()
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
        }

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

    }
}
