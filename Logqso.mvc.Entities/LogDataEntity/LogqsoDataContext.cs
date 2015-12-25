using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Logqso.mvc.Entities.LogDataEntity.Mapping;

namespace Logqso.mvc.Entities.LogDataEntity
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
        public DbSet<Log> Logs { get; set; }
        public DbSet<LogCategory> LogCategories { get; set; }
        public DbSet<Qso> Qsoes { get; set; }
        public DbSet<Session> Sessions { get; set; }
        public DbSet<Station> Stations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CallInfoMap());
            modelBuilder.Configurations.Add(new CallInfoDefaultMap());
            modelBuilder.Configurations.Add(new CallSignMap());
            modelBuilder.Configurations.Add(new ContestMap());
            modelBuilder.Configurations.Add(new LogMap());
            modelBuilder.Configurations.Add(new LogCategoryMap());
            modelBuilder.Configurations.Add(new QsoMap());
            modelBuilder.Configurations.Add(new SessionMap());
            modelBuilder.Configurations.Add(new StationMap());
        }
    }
}
