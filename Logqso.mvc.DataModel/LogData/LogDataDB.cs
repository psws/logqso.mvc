using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Linq.Mapping;
using System.Web;
using System.Data.Entity.ModelConfiguration.Conventions;
using Logqso.mvc.DataModel.LogData.DataModels;


namespace Logqso.mvc.DataModel.LogData
{
// https://msdn.microsoft.com/en-us/data/jj591621.aspx#model
    public class LogDataDB : DbContext
    {

        public LogDataDB()
            : base("name=LogDataDB")
        {
        }

        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Log> Log { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.LogCategory> LogCategory { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Contest> Contest { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.CallSign> CallSign { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Qso> Qso { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Station> Station { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Session> Session { get; set; }

        public DbSet<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo> CallInfo { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfoDefault> CallInfoDefault { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //default for all
           // modelBuilder.Properties()
           //.Where(x =>
           //    x.PropertyType.FullName.Equals("System.String") &&
           //    !x.GetCustomAttributes(false).OfType<ColumnAttribute>().
           //    Where(q => q.DbType != null && q.DbType.Equals("varchar", StringComparison.InvariantCultureIgnoreCase)).Any())
           //    .Configure(c =>
           //        c.HasColumnType("varchar"));

            //default for all
            //modelBuilder.Properties<string>().Configure(c => c.HasColumnType("varchar"));
           //modelBuilder.Entity<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo>().HasMany(i => i.StationId).WillCascadeOnDelete(false);

            //need to turn off CascadeOnDelete on QSO.LogId
            https://msdn.microsoft.com/en-us/data/jj591620#RequiredToRequired
            modelBuilder.Entity<LogData.DataModels.Qso>().HasRequired(p => p.Log)
            .WithMany().HasForeignKey(c=>c.LogId).WillCascadeOnDelete(false);

            //http://stackoverflow.com/questions/19373310/introducing-foreign-key-constraint-may-cause-cycles-or-multiple-cascade-paths
           // modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
           //base.OnModelCreating(modelBuilder);
        }
    }

}
