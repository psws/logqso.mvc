using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Logqso.mvc.DataModel.Models.Mapping;

namespace Logqso.mvc.DataModel.Models
{
    public partial class LogqsoDataContext : DbContext
    {
        static LogqsoDataContext()
        {
            Database.SetInitializer<LogqsoDataContext>(null);
        }

        public LogqsoDataContext()
            : base("Name=LogqsoDataContext")
        {
        }

        public DbSet<CallInfo> CallInfoes { get; set; }
        public DbSet<CallInfoDefault> CallInfoDefaults { get; set; }
        public DbSet<CallSign> CallSigns { get; set; }
        public DbSet<Contest> Contests { get; set; }
        public DbSet<ContestType> ContestTypes { get; set; }
        public DbSet<Log> Logs { get; set; }
        public DbSet<LogCategory> LogCategories { get; set; }
        public DbSet<Qso> Qsoes { get; set; }
        public DbSet<QsoExchangeAlpha> QsoExchangeAlphas { get; set; }
        public DbSet<QsoExchangeNumber> QsoExchangeNumbers { get; set; }
        public DbSet<QsoExchangeType> QsoExchangeTypes { get; set; }
        public DbSet<QsoExtraData> QsoExtraDatas { get; set; }
        public DbSet<QsoModeType> QsoModeTypes { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Station> Stations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CallInfoMap());
            modelBuilder.Configurations.Add(new CallInfoDefaultMap());
            modelBuilder.Configurations.Add(new CallSignMap());
            modelBuilder.Configurations.Add(new ContestMap());
            modelBuilder.Configurations.Add(new ContestTypeMap());
            modelBuilder.Configurations.Add(new LogMap());
            modelBuilder.Configurations.Add(new LogCategoryMap());
            modelBuilder.Configurations.Add(new QsoMap());
            modelBuilder.Configurations.Add(new QsoExchangeAlphaMap());
            modelBuilder.Configurations.Add(new QsoExchangeNumberMap());
            modelBuilder.Configurations.Add(new QsoExchangeTypeMap());
            modelBuilder.Configurations.Add(new QsoExtraDataMap());
            modelBuilder.Configurations.Add(new QsoModeTypeMap());
            modelBuilder.Configurations.Add(new SessionMap());
            modelBuilder.Configurations.Add(new StationMap());
        }
    }
}
