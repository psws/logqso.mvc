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
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Contest> Contest { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.CallSign> CallSign { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Qso> Qso { get; set; }

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

           base.OnModelCreating(modelBuilder);
        }
    }

}
