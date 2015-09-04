using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.Linq.Mapping;
using System.Web;
using System.Data.Entity.ModelConfiguration.Conventions;
using Repository.Pattern.Ef6;
using Repository.Pattern;


namespace Logqso.mvc.DataModel.LogControl
{
// https://msdn.microsoft.com/en-us/data/jj591621.aspx#model
    public class LogControlDB : DbContext
    {

        public LogControlDB()
            : base("name=LogControlDB")
        {
        }

        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatOperator> CatOperator { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatBand> CatBand { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatPower> CatPower { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatAssisted> CatAssisted { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatNoOfTx> CatNoOfTx { get; set; }

        //Filters
        public DbSet<Logqso.mvc.DataModel.LogControl.FilterModels.FiltBand> FiltBand { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.FilterModels.FiltContinent> FiltContinent { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.FilterModels.FiltPrefix> FiltPrefix { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.FilterModels.FiltCQZone> FiltCQZone { get; set; }

        //Yaxis
        public DbSet<Logqso.mvc.DataModel.LogControl.YaxisModels.YaxisFunction> YaxisFunction { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.YaxisModels.YaxisInterval> YaxisInterval { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.YaxisModels.YaxisViewType> YaxisViewType { get; set; }

        //Xaxis
        public DbSet<Logqso.mvc.DataModel.LogControl.XaxisModels.XaxisStartTime> XaxisStartTime { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.XaxisModels.XaxisDuration> XaxisDuration { get; set; }

        //Defaults
        public DbSet<Logqso.mvc.DataModel.LogControl.CategoryModels.CatDefault> CatDefault { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.FilterModels.FiltDefaullt> FiltDefaullt { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.XaxisModels.XaxisDefault> XaxisDefault { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogControl.YaxisModels.YaxisDefault> YaxisDefault { get; set; }



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
