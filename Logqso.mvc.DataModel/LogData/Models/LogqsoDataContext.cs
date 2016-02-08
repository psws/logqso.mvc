using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Logqso.mvc.DataModel.LogData.Models.Mapping;
using Logqso.mvc.Entities.LogDataEntity;
using Infrastructure;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.DataModel.LogData.Models
{
    public partial class LogqsoDataContext : DataContext
    {
        static LogqsoDataContext()
        {
            Database.SetInitializer<LogqsoDataContext>(null);
        }

        public LogqsoDataContext()
            : base("Name=LogDataDB")
        {
        }

        public DbSet<CabrilloInfo> CabrilloInfoes { get; set; }
        public DbSet<CallInfo> CallInfoes { get; set; }
        public DbSet<CallSign> CallSigns { get; set; }
        public DbSet<Contest> Contests { get; set; }
        public DbSet<ContestType> ContestTypes { get; set; }
        public DbSet<Log> Logs { get; set; }
        public DbSet<LogCategory> LogCategories { get; set; }
        public DbSet<Qso> Qsoes { get; set; }
        public DbSet<QsoExchangeAlpha> QsoExchangeAlphas { get; set; }
        public DbSet<QsoExchangeType> QsoExchangeTypes { get; set; }
        public DbSet<QsoExtraData> QsoExtraDatas { get; set; }
        public DbSet<QsoModeType> QsoModeTypes { get; set; }
        public DbSet<QsoRadioType> QsoRadioTypes { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Station> Stations { get; set; }
        public DbSet<UbnDupe> UbnDupes { get; set; }
        public DbSet<UbnIncorrectCall> UbnIncorrectCalls { get; set; }
        public DbSet<UbnIncorrectExchange> UbnIncorrectExchanges { get; set; }
        public DbSet<UbnNotInLog> UbnNotInLogs { get; set; }
        public DbSet<UbnSummary> UbnSummaries { get; set; }
        public DbSet<UbnUnique> UbnUniques { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CabrilloInfoMap());
            modelBuilder.Configurations.Add(new CallInfoMap());
            modelBuilder.Configurations.Add(new CallSignMap());
            modelBuilder.Configurations.Add(new ContestMap());
            modelBuilder.Configurations.Add(new ContestTypeMap());
            modelBuilder.Configurations.Add(new LogMap());
            modelBuilder.Configurations.Add(new LogCategoryMap());
            modelBuilder.Configurations.Add(new QsoMap());
            modelBuilder.Configurations.Add(new QsoExchangeAlphaMap());
            modelBuilder.Configurations.Add(new QsoExchangeTypeMap());
            modelBuilder.Configurations.Add(new QsoExtraDataMap());
            modelBuilder.Configurations.Add(new QsoModeTypeMap());
            modelBuilder.Configurations.Add(new QsoRadioTypeMap());
            modelBuilder.Configurations.Add(new SessionMap());
            modelBuilder.Configurations.Add(new StationMap());
            modelBuilder.Configurations.Add(new UbnDupeMap());
            modelBuilder.Configurations.Add(new UbnIncorrectCallMap());
            modelBuilder.Configurations.Add(new UbnIncorrectExchangeMap());
            modelBuilder.Configurations.Add(new UbnNotInLogMap());
            modelBuilder.Configurations.Add(new UbnSummaryMap());
            modelBuilder.Configurations.Add(new UbnUniqueMap());
        }
    }
}
