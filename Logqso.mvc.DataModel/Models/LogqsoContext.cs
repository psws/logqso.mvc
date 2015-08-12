using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Logqso.mvc.DataModel.Models.Mapping;

namespace Logqso.mvc.DataModel.Models
{
    public partial class LogqsoContext : DbContext
    {
        static LogqsoContext()
        {
            Database.SetInitializer<LogqsoContext>(null);
        }

        public LogqsoContext()
            : base("Name=LogqsoContext")
        {
        }

        public DbSet<CallSign> CallSigns { get; set; }
        public DbSet<CatAssisted> CatAssisteds { get; set; }
        public DbSet<CatBand> CatBands { get; set; }
        public DbSet<CatNoOfTx> CatNoOfTxes { get; set; }
        public DbSet<CatOperator> CatOperators { get; set; }
        public DbSet<CatPower> CatPowers { get; set; }
        public DbSet<Contest> Contests { get; set; }
        public DbSet<FiltBand> FiltBands { get; set; }
        public DbSet<FiltContinent> FiltContinents { get; set; }
        public DbSet<FiltCountry> FiltCountries { get; set; }
        public DbSet<FiltCQZone> FiltCQZones { get; set; }
        public DbSet<Log> Logs { get; set; }
        public DbSet<Qso> Qsoes { get; set; }
        public DbSet<XaxisDuration> XaxisDurations { get; set; }
        public DbSet<XaxisStartTime> XaxisStartTimes { get; set; }
        public DbSet<YaxisFunction> YaxisFunctions { get; set; }
        public DbSet<YaxisInterval> YaxisIntervals { get; set; }
        public DbSet<YaxisViewType> YaxisViewTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CallSignMap());
            modelBuilder.Configurations.Add(new CatAssistedMap());
            modelBuilder.Configurations.Add(new CatBandMap());
            modelBuilder.Configurations.Add(new CatNoOfTxMap());
            modelBuilder.Configurations.Add(new CatOperatorMap());
            modelBuilder.Configurations.Add(new CatPowerMap());
            modelBuilder.Configurations.Add(new ContestMap());
            modelBuilder.Configurations.Add(new FiltBandMap());
            modelBuilder.Configurations.Add(new FiltContinentMap());
            modelBuilder.Configurations.Add(new FiltCountryMap());
            modelBuilder.Configurations.Add(new FiltCQZoneMap());
            modelBuilder.Configurations.Add(new LogMap());
            modelBuilder.Configurations.Add(new QsoMap());
            modelBuilder.Configurations.Add(new XaxisDurationMap());
            modelBuilder.Configurations.Add(new XaxisStartTimeMap());
            modelBuilder.Configurations.Add(new YaxisFunctionMap());
            modelBuilder.Configurations.Add(new YaxisIntervalMap());
            modelBuilder.Configurations.Add(new YaxisViewTypeMap());
        }
    }
}
