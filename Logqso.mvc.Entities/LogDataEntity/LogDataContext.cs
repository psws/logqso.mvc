using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Logqso.mvc.Entities.LogDataEntity.Mapping;
using Repository.Pattern.Ef6;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class LogControlContext : DataContext
    {
        static LogControlContext()
        {
            Database.SetInitializer<LogControlContext>(null);
        }

        public LogControlContext()
            : base("Name=LogDataDB")
        {
        }

        public DbSet<CallSign> CallSigns { get; set; }
        public DbSet<Contest> Contests { get; set; }
        public DbSet<Log> Logs { get; set; }
        public DbSet<Qso> Qsoes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CallSignMap());
            modelBuilder.Configurations.Add(new ContestMap());
            modelBuilder.Configurations.Add(new LogMap());
            modelBuilder.Configurations.Add(new QsoMap());
        }
    }
}
