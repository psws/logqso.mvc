using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Logqso.mvc.Exceptions;

using System.Threading.Tasks;
using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.Ef6;
using Repository.Pattern.Repositories;
using Service.Pattern;
using Logqso.mvc.Dto.LogControl;
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
        public static IEnumerable<string> GetContestCategoryNames(this IRepository<CatOperator> repository)
        {
            var CatOperators = repository.Queryable();
            try
            {
                //var stuff = CatOperators.FirstOrDefault(c => c.CatOprName == "SINGLE-OP");
                var query = CatOperators.Select(c => c.CatOprName).ToList();
                //var query = (from c in CatOperators.
                //            select c.CatOprName).ToList();
                return query;

            }
            catch (Exception ex)
            {
                FunctionException e = new FunctionException("GetContestCategoryNames()", ex.InnerException);
                throw e;
            }

        }
#if false
        public static List<CatOperator> GetContestCategorys(this IRepository<CatOperator> repository)
        {
            var CatOperators = repository.Queryable();
            var query = CatOperators.OrderBy(c=>c.Index).ToList();
            return query;
        }
#endif

        public static IEnumerable<string> GetContestAssistedNames(this IRepository<CatAssisted> repository)
        {
            var CatAssisteds = repository.Queryable();
            var query = CatAssisteds.OrderBy(c => c.Index).Select(c => c.CatAssistedName).ToList();
            return query;
        }
        public static IEnumerable<string> GetContestBandNames(this IRepository<CatBand> repository)
        {
            var CatBands = repository.Queryable();
            var query = CatBands.OrderBy(c => c.Index).Select(c => c.CatBandName).ToList();
            return query;
        }
        public static IEnumerable<string> GetContestNoOfTxNames(this IRepository<CatNoOfTx> repository)
        {
            var CatNoOfTxs = repository.Queryable();
            var query = CatNoOfTxs.OrderBy(c => c.Index).Select(c => c.CatNoOfTxName).ToList();
            return query;
        }
        public static IEnumerable<string> GetContestPowerNames(this IRepository<CatPower> repository)
        {
            var CatPowers = repository.Queryable();
            var query = CatPowers.OrderBy(c => c.Index).Select(c => c.CatPowerName).ToList();
            return query;
        }



        public static IEnumerable<CountryPrefixtype> GetFiltPrefixNames(this IRepository<FiltPrefix> repository)
        {
            var FiltPrefixes = repository.Queryable();
            int index = 0;
            //var query = FiltPrefixes.OrderBy(c => c.CountryName).Select(c => c.CountryName).ToList();
            //var query = FiltCountrys.Select(c => c.CountryName).OrderBy(CountryName).ToList();
            var query = (from e in FiltPrefixes
                         orderby e.CountryName
                         select new CountryPrefixtype
                         {
                             key = 1,
                             value = e.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + e.FiltPref
                         }).ToList();

                         //select (e.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + e.FiltPref)).ToList();

            if (query != null)
            {
                foreach (var item in query)
                {
                    item.key = index++;
                }
                
            }
            return query; 
        }
        public static IEnumerable<string> GetFiltBandNames(this IRepository<FiltBand> repository)
        {
            var FiltBands = repository.Queryable();
            var query = FiltBands.Select(c => c.FiltBandName).ToList();
            return query;
        }
        public static IEnumerable<string> GetFiltContinentNames(this IRepository<FiltContinent> repository)
        {
            var FiltContinents = repository.Queryable();
            var query = FiltContinents.OrderBy(c => c.Index).Select(c => c.FiltContName).ToList();
            return query;
        }
        public static IEnumerable<string> GetFiltCQZoneNames(this IRepository<FiltCQZone> repository)
        {
            var FiltCQZones = repository.Queryable();
            var query = FiltCQZones.OrderBy(c => c.Index).Select(c => c.FiltCQZoneVal).ToList();
            return query;
        }



        public static IEnumerable<string> GetXaxisDurationeVals(this IRepository<XaxisDuration> repository)
        {
            var XaxisDurations = repository.Queryable();
            var query = XaxisDurations.OrderBy(c => c.Index).Select(c => c.XaxisDurationTime).ToList();
            return query;
        }
        public static IEnumerable<string> GetXaxisStartTimeNames(this IRepository<XaxisStartTime> repository)
        {
            var XaxisStartTimes = repository.Queryable();
            var query = (from e in XaxisStartTimes
             orderby e.Index
             select e.XaxisStrtTime).ToList();

            //var query = XaxisStartTimes.Select(c => c.XaxisStrtTime).ToList();
            return query;
        }
        public static IEnumerable<int> GetXaxisDays(this IRepository<XaxisDay> repository)
        {
            var XaxisDays = repository.Queryable();
            var query = (from e in XaxisDays
                         orderby e.Index
                         select e.Xaxisday).ToList();

            //var query = XaxisStartTimes.Select(c => c.XaxisStrtTime).ToList();
            return query;
        }



        public static IEnumerable<string> GetYaxisFunctionNames(this IRepository<YaxisFunction> repository)
        {
            var YaxisFunctions = repository.Queryable();
            var query = YaxisFunctions.OrderBy(c => c.Index).Select(c => c.YaxisFuncName).ToList();
            return query;
        }
        public static IEnumerable<string> GetYaxisIntervalVals(this IRepository<YaxisInterval> repository)
        {
            var YaxisIntervals = repository.Queryable();
            var query = YaxisIntervals.OrderBy(c => c.Index).Select(c => c.YaxisIntvVal).ToList();
            return query;
        }
        public static IEnumerable<string> GetYaxisViewTypeNames(this IRepository<YaxisViewType> repository)
        {
            var YaxisViewTypes = repository.Queryable();
            var query = YaxisViewTypes.OrderBy(c => c.Index).Select(c => c.YaxisViewTypeName).ToList();
            return query;
        }


        //Default Selection
        public static ControlCategorySettingsDto GetControlCategorySettings(this IRepository<CatDefault> repository, string Username)
        {
            ControlCategorySettingsDto ControlCategorySettingsDto = new ControlCategorySettingsDto();

            var CatSettings = repository.Queryable();

            CatDefault CatDefault = CatSettings.Where(t=>t.UserName == Username).First();
            ControlCategorySettingsDto.CatAssisted = Enum.GetName(typeof(CatAssistedEnum), CatDefault.CatAssistedEnum);
            ControlCategorySettingsDto.CatBand = Enum.GetName(typeof(CatBandEnum), CatDefault.CatBandEnum);
            ControlCategorySettingsDto.CatNoOfTx = Enum.GetName(typeof(CatNoOfTxEnum), CatDefault.CatNoOfTxEnum);
            ControlCategorySettingsDto.CatOperator = Enum.GetName(typeof(CatOperatorEnum), CatDefault.CatOperatorEnum);
            ControlCategorySettingsDto.CatPower = Enum.GetName(typeof(CatPowerEnum), CatDefault.CatPowerEnum);
            return ControlCategorySettingsDto;
        }

        public static ControlFiltersSettingsDto GetControlFilterSettings(this IRepository<FiltDefaullt> repository, string Username)
        {
            ControlFiltersSettingsDto ControlFiltersSettingsDto = new ControlFiltersSettingsDto();

            //var Settings = repository.GetRepository<FiltDefaullt>().Queryable();
            //var Settings  = repository.Queryable();

            //var fluent = repository.Query(t => t.UserName == Username);
            //fluent.Include(t => t.FiltPrefix);
            var fluent = repository.Query(t => t.UserName == Username).Include(t => t.FiltPrefix);

            FiltDefaullt FiltDefaullt = fluent.Select().First();

            //now we need to get the index of the FiltPrefix
            //No index in DB
            IRepository<FiltPrefix> FiltPrefixRepository = repository.GetRepository<FiltPrefix>();
            IEnumerable<CountryPrefixtype> CountryPrefixtypes = GetFiltPrefixNames(FiltPrefixRepository);
            var CountryPrefixtype  = CountryPrefixtypes.Where(x=>x.value.Contains(FiltDefaullt.FiltPrefix.CountryName) ).FirstOrDefault();
            if (CountryPrefixtype != null)
	        {
                    ControlFiltersSettingsDto.FiltCountryInnerHTML = new mvc.Dto.LogControl.CountryPrefixtype();
                    ControlFiltersSettingsDto.FiltCountryInnerHTML.key = CountryPrefixtype.key;
                    ControlFiltersSettingsDto.FiltCountryInnerHTML.value = CountryPrefixtype.value;
	        }


            ////if (FiltDefaullt.FiltPrefix.CountryName != "ALL")

            ////{
            ////    ControlFiltersSettingsDto.FiltCountryInnerHTML.value = FiltDefaullt.FiltPrefix.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + FiltDefaullt.FiltPref;
            ////}
            ////else
            ////{
            ////    ControlFiltersSettingsDto.FiltCountryInnerHTML.value = FiltDefaullt.FiltPrefix.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + FiltDefaullt.FiltPref;  //no prefix
            ////}
                ////find index
                //var FiltPrefixes = repository.GetRepository < FiltPrefix >(). Queryable();
                ////var index = FiltPrefixes.OrderBy(t => t.CountryName).AsEnumerable().TakeWhile(t => t.CountryName != FiltDefaullt.FiltPrefix.CountryName).ToList();//.Count();
                //// ToList(); is expensive!!!!!!!!!!!!!!!!!!!
                //var query = (from e in FiltPrefixes
                //             orderby e.CountryName
                //             select (e.CountryName )).ToList();
                //ControlFiltersSettingsEntity.FiltCountryIndex = query.IndexOf(ControlFiltersSettingsEntity.FiltCountry);

            ControlFiltersSettingsDto.FiltCQZone = FiltDefaullt.FiltCQZoneVal;

            
            //FiltDefaullt FiltDefaullt = Settings.Where(t=>t.UserName == "default").First();

            ControlFiltersSettingsDto.FiltBand = Enum.GetName(typeof(CatBandEnum), FiltDefaullt.FiltBnd);
            ControlFiltersSettingsDto.FiltContinent = Enum.GetName(typeof(ContinentEnum), FiltDefaullt.FiltCont);
            //ControlFiltersSettingsEntity.FiltCountry = FiltDefaullt.FiltPrefix.CountryName + "&nbsp;&nbsp;&nbsp;&nbsp;" + FiltDefaullt.FiltPref;
            //when setting Val of select, you need to use spaces not &nbsp;


            return ControlFiltersSettingsDto;
        }

        public static ControlXaxisSettingsDto GetControlXaxisSettings(this IRepository<XaxisDefault> repository, string Username)
        {
            ControlXaxisSettingsDto ControlXaxisSettingsDto = new ControlXaxisSettingsDto();

            var Settings = repository.Queryable();
            var fluent = repository.Query(t => t.UserName == Username);
            XaxisDefault XaxisDefault = fluent.Select().First();

            ControlXaxisSettingsDto.XaxisDuration = XaxisDefault.XaxisDurationTime;
            ControlXaxisSettingsDto.XaxisStarttime = XaxisDefault.XaxisStrtTime;
            ControlXaxisSettingsDto.XaxisDay = XaxisDefault.Xaxisday;
            var XaxisFunctions = repository.GetRepository<XaxisStartTime>().Queryable();
            var query = XaxisFunctions.OrderBy(c => c.Index).Select(c => c.XaxisStrtTime).ToList();

            ControlXaxisSettingsDto.XaxisStarttimeIndex = query.IndexOf(ControlXaxisSettingsDto.XaxisStarttime);


            return ControlXaxisSettingsDto;
        }

        public static ControlYaxisSettingsDto GetControlYaxisSettings(this IRepository<YaxisDefault> repository, string Username)
        {
            ControlYaxisSettingsDto ControlYaxisSettingsDto = new ControlYaxisSettingsDto();

            var Settings = repository.Queryable();
            var fluent = repository.Query(t => t.UserName == Username);
            YaxisDefault YaxisDefault = fluent.Select().First();

            ControlYaxisSettingsDto.YaxisFunction = YaxisDefault.YaxisFuncName;
            var YaxisFunctions = repository.GetRepository<YaxisFunction>().Queryable();
            var query = YaxisFunctions.OrderBy(c => c.Index).Select(c => c.YaxisFuncName).ToList();

            ControlYaxisSettingsDto.YaxisFunctionIndex = query.IndexOf(ControlYaxisSettingsDto.YaxisFunction);

            ControlYaxisSettingsDto.YaxisInterval = YaxisDefault.YaxisIntvVal;
            ControlYaxisSettingsDto.YaxisViewType = YaxisDefault.YaxisViewTypeName;

            return ControlYaxisSettingsDto;
        }


    }
}
