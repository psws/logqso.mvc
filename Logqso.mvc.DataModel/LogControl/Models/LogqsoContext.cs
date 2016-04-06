using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Repository.Pattern.Ef6;
using Logqso.mvc.DataModel.LogControl.Models.Mapping;
using Logqso.mvc.Entities.LogControlEntity;
using Repository.Pattern.Extensions.interfaces;
using Infrastructure;

namespace Logqso.mvc.DataModel.LogControl.Models
{
    public partial class LogControlContext : DataContext, ILogqsoControlContext
    {
        static LogControlContext()
        {
            Database.SetInitializer<LogControlContext>(null);
        }

        public LogControlContext()
            : base("Name=LogControlDB")
        {
        }

        public DbSet<CatAssisted> CatAssisteds { get; set; }
        public DbSet<CatBand> CatBands { get; set; }
        public DbSet<CatDefault> CatDefaults { get; set; }
        public DbSet<CatNoOfTx> CatNoOfTxes { get; set; }
        public DbSet<CatOperator> CatOperators { get; set; }
        public DbSet<CatPower> CatPowers { get; set; }
        public DbSet<FiltBand> FiltBands { get; set; }
        public DbSet<FiltContinent> FiltContinents { get; set; }
        public DbSet<FiltCQZone> FiltCQZones { get; set; }
        public DbSet<FiltDefaullt> FiltDefaullts { get; set; }
        public DbSet<FiltPrefix> FiltPrefixes { get; set; }
        public DbSet<XaxisDefault> XaxisDefaults { get; set; }
        public DbSet<XaxisDuration> XaxisDurations { get; set; }
        public DbSet<XaxisStartTime> XaxisStartTimes { get; set; }
        public DbSet<YaxisDefault> YaxisDefaults { get; set; }
        public DbSet<YaxisFunction> YaxisFunctions { get; set; }
        public DbSet<YaxisInterval> YaxisIntervals { get; set; }
        public DbSet<YaxisViewType> YaxisViewTypes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CatAssistedMap());
            modelBuilder.Configurations.Add(new CatBandMap());
            modelBuilder.Configurations.Add(new CatDefaultMap());
            modelBuilder.Configurations.Add(new CatNoOfTxMap());
            modelBuilder.Configurations.Add(new CatOperatorMap());
            modelBuilder.Configurations.Add(new CatPowerMap());
            modelBuilder.Configurations.Add(new FiltBandMap());
            modelBuilder.Configurations.Add(new FiltContinentMap());
            modelBuilder.Configurations.Add(new FiltCQZoneMap());
            modelBuilder.Configurations.Add(new FiltDefaulltMap());
            modelBuilder.Configurations.Add(new FiltPrefixMap());
            modelBuilder.Configurations.Add(new XaxisDefaultMap());
            modelBuilder.Configurations.Add(new XaxisDurationMap());
            modelBuilder.Configurations.Add(new XaxisStartTimeMap());
            modelBuilder.Configurations.Add(new YaxisDefaultMap());
            modelBuilder.Configurations.Add(new YaxisFunctionMap());
            modelBuilder.Configurations.Add(new YaxisIntervalMap());
            modelBuilder.Configurations.Add(new YaxisViewTypeMap());
        }
    }
}
