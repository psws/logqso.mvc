using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.Repository.Models.LogControl;
using Logqso.mvc.common.Enum;
using Repository.Pattern.DataContext;
using Repository.Pattern.UnitOfWork;


namespace Logqso.Repository
{

    //public class ControlRepository2<TEntity> : Repository<TEntity>
    //{
    //    public ControlRepository2(IDataContextAsync context, IUnitOfWorkAsync unitOfWork)
    //     : base(repository( context, unitOfWork)
    //    {
    //        _repository = repository;
    //    }
    //}

    //public class IDataControlContextAsync<TEntity> : IDataContextAsync
    //{
    //    public DataControlContextAsync(IDataContextAsync context, IUnitOfWorkAsync unitOfWork)
    //     : base(repository( context, unitOfWork)
    //    {
    //        _repository = repository;
    //    }
    //}

    //EXTENSION METHODS for IRepository<tEntity T>

    public static class ControlRepository
    {
        public static List<string> GetContestCategoryNames(this IRepository<CatOperator> repository)
        {
            var CatOperators = repository.Queryable();

            //var stuff = CatOperators.FirstOrDefault(c => c.CatOprName == "SINGLE-OP");
            var query = CatOperators.Select(c=>c.CatOprName).ToList();
            //var query = (from c in CatOperators.
            //            select c.CatOprName).ToList();
            return query;
        }
#if false
        public static List<CatOperator> GetContestCategorys(this IRepository<CatOperator> repository)
        {
            var CatOperators = repository.Queryable();
            var query = CatOperators.OrderBy(c=>c.Index).ToList();
            return query;
        }
#endif

        public static List<string> GetContestAssistedNames(this IRepository<CatAssisted> repository)
        {
            var CatAssisteds = repository.Queryable();
            var query = CatAssisteds.OrderBy(c => c.Index).Select(c => c.CatAssistedName).ToList();
            return query;
        }
        public static List<string> GetContestBandNames(this IRepository<CatBand> repository)
        {
            var CatBands = repository.Queryable();
            var query = CatBands.OrderBy(c => c.Index).Select(c => c.CatBandName).ToList();
            return query;
        }
        public static List<string> GetContestNoOfTxNames(this IRepository<CatNoOfTx> repository)
        {
            var CatNoOfTxs = repository.Queryable();
            var query = CatNoOfTxs.OrderBy(c => c.Index).Select(c => c.CatNoOfTxName).ToList();
            return query;
        }
        public static List<string> GetContestPowerNames(this IRepository<CatPower> repository)
        {
            var CatPowers = repository.Queryable();
            var query = CatPowers.OrderBy(c => c.Index).Select(c => c.CatPowerName).ToList();
            return query;
        }



        public static List<string> GetFiltPrefixNames(this IRepository<FiltPrefix> repository)
        {
            var FiltPrefixes = repository.Queryable();
            //var query = FiltPrefixes.OrderBy(c => c.CountryName).Select(c => c.CountryName).ToList();
            //var query = FiltCountrys.Select(c => c.CountryName).OrderBy(CountryName).ToList();
            var query = (from e in FiltPrefixes
                        orderby e.CountryName
                         select (e.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + e.FiltPref)).ToList();
            

            return query; 
        }
        public static List<string> GetFiltBandNames(this IRepository<FiltBand> repository)
        {
            var FiltBands = repository.Queryable();
            var query = FiltBands.Select(c => c.FiltBandName).ToList();
            return query;
        }
        public static List<string> GetFiltContinentNames(this IRepository<FiltContinent> repository)
        {
            var FiltContinents = repository.Queryable();
            var query = FiltContinents.OrderBy(c => c.Index).Select(c => c.FiltContName).ToList();
            return query;
        }
        public static List<string> GetFiltCQZoneNames(this IRepository<FiltCQZone> repository)
        {
            var FiltCQZones = repository.Queryable();
            var query = FiltCQZones.OrderBy(c => c.Index).Select(c => c.FiltCQZoneVal).ToList();
            return query;
        }



        public static List<string> GetXaxisDurationeVals(this IRepository<XaxisDuration> repository)
        {
            var XaxisDurations = repository.Queryable();
            var query = XaxisDurations.OrderBy(c => c.Index).Select(c => c.XaxisDurationTime).ToList();
            return query;
        }
        public static List<string> GetXaxisStartTimeNames(this IRepository<XaxisStartTime> repository)
        {
            var XaxisStartTimes = repository.Queryable();
            var query = (from e in XaxisStartTimes
             orderby e.Index
             select e.XaxisStrtTime).ToList();

            //var query = XaxisStartTimes.Select(c => c.XaxisStrtTime).ToList();
            return query;
        }



        public static List<string> GetYaxisFunctionNames(this IRepository<YaxisFunction> repository)
        {
            var YaxisFunctions = repository.Queryable();
            var query = YaxisFunctions.OrderBy(c => c.Index).Select(c => c.YaxisFuncName).ToList();
            return query;
        }
        public static List<string> GetYaxisIntervalVals(this IRepository<YaxisInterval> repository)
        {
            var YaxisIntervals = repository.Queryable();
            var query = YaxisIntervals.OrderBy(c => c.Index).Select(c => c.YaxisIntvVal).ToList();
            return query;
        }
        public static List<string> GetYaxisViewTypeNames(this IRepository<YaxisViewType> repository)
        {
            var YaxisViewTypes = repository.Queryable();
            var query = YaxisViewTypes.OrderBy(c => c.Index).Select(c => c.YaxisViewTypeName).ToList();
            return query;
        }


        //Default Selection
        public static ControlCategorySettingsEntity GetControlCategorySettings(this IRepository<CatDefault> repository, string Username)
        {
            ControlCategorySettingsEntity ControlCategorySettingsEntity = new ControlCategorySettingsEntity();

            var CatSettings = repository.Queryable();

            CatDefault CatDefault = CatSettings.Where(t=>t.UserName == Username).First();
            ControlCategorySettingsEntity.CatAssisted = Enum.GetName(typeof(CatAssistedEnum), CatDefault.CatAssist);
            ControlCategorySettingsEntity.CatBand = Enum.GetName(typeof(CatBandEnum), CatDefault.CatBnd);
            ControlCategorySettingsEntity.CatNoOfTx = Enum.GetName(typeof(CatNoOfIxEnum), CatDefault.CatTx);
            ControlCategorySettingsEntity.CatOperator = Enum.GetName(typeof(CatOperatorEnum), CatDefault.CatOpr);
            ControlCategorySettingsEntity.CatPower = Enum.GetName(typeof(CatPowerrEnum), CatDefault.CatPwr);
            return ControlCategorySettingsEntity;
        }
        
        public static ControlFiltersSettingsEntity GetControlFilterSettings(this IRepository<FiltDefault> repository, string Username)
        {
            ControlFiltersSettingsEntity ControlFiltersSettingsEntity = new ControlFiltersSettingsEntity();

            //var Settings = repository.GetRepository<FiltDefaullt>().Queryable();
            //var Settings  = repository.Queryable();
            var fluent = repository.Query(t => t.UserName == Username);
            fluent.Include(t => t.FiltPrefix);
            FiltDefault FiltDefaullt = fluent.Select().First();
            //FiltDefaullt FiltDefaullt = Settings.Where(t=>t.UserName == "default").First();

            ControlFiltersSettingsEntity.FiltBand = Enum.GetName(typeof(CatBandEnum), FiltDefaullt.FiltBnd);
            ControlFiltersSettingsEntity.FiltContinent = Enum.GetName(typeof(ContinentEnum),FiltDefaullt.FiltCont);
            //ControlFiltersSettingsEntity.FiltCountry = FiltDefaullt.FiltPrefix.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + FiltDefaullt.FiltPref;
            //when setting Val of select, you need to use spaces not &nbsp;
            if (FiltDefaullt.FiltPrefix.CountryName != "ALL")
            {
                ControlFiltersSettingsEntity.FiltCountry = FiltDefaullt.FiltPrefix.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + FiltDefaullt.FiltPref;
            }
            else
            {
                ControlFiltersSettingsEntity.FiltCountry = FiltDefaullt.FiltPrefix.CountryName;  //no prefix
            }
            //find index
            var FiltPrefixes = repository.GetRepository < FiltPrefix >(). Queryable();
            var query = (from e in FiltPrefixes
                         orderby e.CountryName
                         select (e.CountryName )).ToList();
            ControlFiltersSettingsEntity.FiltCountryIndex = query.IndexOf(ControlFiltersSettingsEntity.FiltCountry);

            ControlFiltersSettingsEntity.FiltCQZone = FiltDefaullt.FiltCQZoneVal;

            return ControlFiltersSettingsEntity;
        }

        public static ControlXaxisSettingsEntity GetControlXaxisSettings(this IRepository<XaxisDefault> repository, string Username)
        {
            ControlXaxisSettingsEntity ControlXaxisSettingsEntity = new ControlXaxisSettingsEntity();

            var Settings = repository.Queryable();
            var fluent = repository.Query(t => t.UserName == Username);
            XaxisDefault XaxisDefault = fluent.Select().First();

            ControlXaxisSettingsEntity.XaxisDuration = XaxisDefault.XaxisDurationTime;
            ControlXaxisSettingsEntity.XaxisStarttime = XaxisDefault.XaxisStrtTime;
            var XaxisFunctions = repository.GetRepository<XaxisStartTime>().Queryable();
            var query = XaxisFunctions.OrderBy(c => c.Index).Select(c => c.XaxisStrtTime).ToList();

            ControlXaxisSettingsEntity.XaxisStarttimeIndex = query.IndexOf(ControlXaxisSettingsEntity.XaxisStarttime);


            return ControlXaxisSettingsEntity;
        }

        public static ControlYaxisSettingsEntity GetControlYaxisSettings(this IRepository<YaxisDefault> repository, string Username)
        {
            ControlYaxisSettingsEntity ControlYaxisSettingsEntity = new ControlYaxisSettingsEntity();

            var Settings = repository.Queryable();
            var fluent = repository.Query(t => t.UserName == Username);
            YaxisDefault YaxisDefault = fluent.Select().First();

            ControlYaxisSettingsEntity.YaxisFunction = YaxisDefault.YaxisFuncName;
            var YaxisFunctions = repository.GetRepository<YaxisFunction>().Queryable();
            var query = YaxisFunctions.OrderBy(c => c.Index).Select(c => c.YaxisFuncName).ToList();

            ControlYaxisSettingsEntity.YaxisFunctionIndex = query.IndexOf(ControlYaxisSettingsEntity.YaxisFunction);

            ControlYaxisSettingsEntity.YaxisInterval = YaxisDefault.YaxisIntvVal;
            ControlYaxisSettingsEntity.YaxisViewType = YaxisDefault.YaxisViewTypeName;

            return ControlYaxisSettingsEntity;
        }


    }
}
