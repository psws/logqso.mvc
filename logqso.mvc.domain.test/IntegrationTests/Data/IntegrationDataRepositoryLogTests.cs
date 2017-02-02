using System;
using System.Linq;  //THIS line must be here for IqueryFluent to work
using System.Threading.Tasks;

//using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Repository.Pattern.DataContext;
using Repository.Pattern.Repositories;
using Repository.Pattern.UnitOfWork;
using Infrastructure;
using Repository.Pattern;
using Repository.Pattern.Ef6;

using Logqso.mvc.Entities.LogDataEntity;
using Logqso.mvc.domain.Interfaces;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogData.Models;
using Logqso.mvc.Dto.LogData;
using  Logqso.Repository.Repository;
using Logqso.mvc.Dto.LogControl;

namespace Logqso.mvc.domain.test.IntegrationTests.Data
{
    [TestClass]
    public class IntegrationDataRepositoryLogTests
    {
        // private readonly string CatOprName = "Hello Test";
        //private IRepositoryAsync<Logqso.mvc.Entities.LogDataEntity.Log> _logRepository;
        //private Guid guid;
        //int LogId = 1;

        public TestContext TestContext { get; set; }  //for trace debuggibg

        [TestInitialize]
        public void Initialize()
        {
            Utility.CreateSeededTestDatabase("LogDataDB", "Sql\\ContestqsoDataTest.sql");
        }

        [TestMethod]
        public void Integration_LogDataContext_LogResository_Log_GetContestLogs_Return_LogPageDTO()
        {
             using (IDataContextAsync context = new ContestqsoDataContext())

             using (IUnitOfWorkAsync unitOfWork = new UnitOfWork(context))
             {
                 bool caught = false;
                 IRepositoryAsync<Log> _logRepository = new Repository<Log>(context, unitOfWork);
                 LogPageDTO LogPageDTO = null;

                 try
                 {
                     LogCtlDataSettingsDto LogCtlDataSettingsDto = new Dto.LogData.LogCtlDataSettingsDto()
                     {
                         ControlSettingsDto = new ControlSettingsDto()
                         {
                             ControlCategorySettingsDto = new Dto.LogControl.ControlCategorySettingsDto()
                             {
                                 CatAssisted = "ALL",
                                 CatBand = "ALL",
                                 CatNoOfTx = "ALL",
                                 CatOperator = "ALL",
                                 CatOperatorOverlay = null,
                                 CatPower = "ALL",
                                 Disabled = false
                             },
                             ControlFiltersSettingsDto = new Dto.LogControl.ControlFiltersSettingsDto()
                             {
                                 Disabled = false,
                                 FiltBand = "ALL",
                                 FiltContinent = "ALL",
                                 FiltCountryInnerHTML = new CountryPrefixtype
                                 {
                                     key = 8,
                                     value = "ALL&nbsp;&nbsp;&nbsp;&nbsp;-"
                                 },
                                 FiltCQZone = "ALL",
                             },
                             ControlXaxisSettingsDto = new Dto.LogControl.ControlXaxisSettingsDto()
                             {
                                 XaxisDuration = "48",
                                 XaxisStarttime = "00:00z  Day1",
                                 XaxisStarttimeIndex = 0
                             },
                             ControlYaxisSettingsDto = new Dto.LogControl.ControlYaxisSettingsDto()
                             {
                                 YaxisFunction = "QSO  Rate",
                                 YaxisFunctionIndex = 0,
                                 YaxisInterval = "60",
                                 YaxisViewType = "Column",
                             }
                             
                         },
                         DataCallInfoDtos = new DataCallInfoDto[]
                        {
                                new DataCallInfoDto()
                                {
                                    CallGroup = CallGroupEnum.CALL1,
                                    Disabled = false,
                                    LogId = 1,
                                    QsoRadioType = QsoRadioTypeEnum.R1,
                                    SelectedCall = "CN2R",
                                    SelectedContestName = "Cqww Ssb 2002",
                                    SelectedStationName = "STN1"
                                },
                                new DataCallInfoDto()
                                {
                                    CallGroup = CallGroupEnum.CALL2,
                                    Disabled = false,
                                    LogId= 2,
                                    QsoRadioType = QsoRadioTypeEnum.R2,
                                    SelectedCall = "CN3A",
                                    SelectedContestName = "Cqww Ssb 2002",
                                    SelectedStationName = "STN2"
                                },
                                new DataCallInfoDto()
                                {
                                    CallGroup = CallGroupEnum.CALL3,
                                    Disabled = false,
                                    LogId=3,
                                    QsoRadioType = QsoRadioTypeEnum.R1,
                                    SelectedCall = "CN2AA",
                                    SelectedContestName = "Cqww Ssb 2002",
                                    SelectedStationName = null,
                                },
                        },
                         LogPageRequestDTO = new LogPageRequestDTO()
                         {
                             sidx = "",
                             sord = "asc",
                             page = 1,
                             rows = 16,
                             _search = false
                         }

                     };

                     string username = "default";
                     LogPageDTO = _logRepository.GetContestLogs(LogCtlDataSettingsDto, username).Result;

                     //TestContext.WriteLine("Integration_LogDataContext_LogRepository_Query_Log_Include_LogCategory_Return_LogCategorie_Qsoes_Stations_Callsign exception");


                     //LogforId1s = Logtask as List<Log>;

                 }
                 catch (Exception ex)
                 {
                     TestContext.WriteLine(string.Format("Integration_LogDataContext_LogResository_Log_GetContestLogs_Return_LogPageDTO exception {0}", ex.Message));
                     caught = true;
                 }
                 Assert.IsFalse(caught);  //exception
             }
       }
    }
}
