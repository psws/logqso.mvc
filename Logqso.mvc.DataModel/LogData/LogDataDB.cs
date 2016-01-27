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
using Logqso.mvc.DataModel.LogData.CallInfoModels;



namespace Logqso.mvc.DataModel.LogData
{
// https://msdn.microsoft.com/en-us/data/jj591621.aspx#model
    public class LogDataDB : DbContext
    {

        public LogDataDB()
            : base("name=LogDataDB")
        {
        }

        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.ContestType> ContestType { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoModeType> QsoModeType { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoRadioType> QsoRadioType { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoExchangeType> QsoExchangeType { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoExchangeAlpha> QsoExchangeAlpha { get; set; }
        //public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoExchangeNumber> QsoExchangeNumber { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.QsoExtraData> QsoExtraData { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.CabrilloInfo> CabrilloInfo { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Log> Log { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.LogCategory> LogCategory { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Contest> Contest { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.CallSign> CallSign { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Qso> Qso { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Station> Station { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.DataModels.Session> Session { get; set; }

        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnDupes> UbnDupes { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnIncorrectCall> UbnIncorrectCall { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnIncorrectExchange> UbnIncorrectExchange { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnNotInLog> UbnNotInLog { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnSummary> UbnSummary { get; set; }
        public DbSet<Logqso.mvc.DataModel.LogData.UbnModels.UbnUniques> UbnUniques { get; set; }

        public DbSet<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfo> CallInfo { get; set; }
        //public DbSet<Logqso.mvc.DataModel.LogData.CallInfoModels.CallInfoDefault> CallInfoDefault { get; set; }

        /* 
                   QsoModeTypeSeeds.SeedContest(context);
                   QsoExchangeTypeSeeds.SeedContest(context);
                   ContestTypeSeeds.SeedContest(context);
                   QsoRadioTypeSeeds.SeedContest(context);
                   CabrilloInfoSeeds.SeedContest(context);
                   CallSignSeeds.SeedContest(context);
                   ContestSeeds.SeedContest(context);
                   LogCategorySeeds.SeedContest(context);
                   LogSeeds.SeedContest(context);
                   StationSeeds.SeedContest(context);
                   CallInfoSeeds.SeedContest(context);
         #if DEBUG
                QsoSeeds.SeedContest(context);
        #endif

         * */

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

            //////default value  FOR EF7
            ////modelBuilder.Entity<CallSign>()
            ////    .Property(b => b.GeoCodeChk)
            ////    .HasDefaultValue(false);





            //compiler complains about Logid circular
        //marking FK the CallsignId relationship non cascade seems to 
            //make or allow LogID to be cascade on delete
            //DONT' KNOW WHY'
            //https://msdn.microsoft.com/en-us/data/jj591620#RequiredToRequired
            modelBuilder.Entity<LogData.DataModels.Qso>().HasRequired(p => p.CallSign)
            .WithMany().HasForeignKey(c => c.CallsignId).WillCascadeOnDelete(false);

            modelBuilder.Entity<LogData.CallInfoModels.CallInfo>().HasRequired(p => p.Log)
            .WithMany().HasForeignKey(c => c.LogId).WillCascadeOnDelete(false);


#if false
        //need to turn off CascadeOnDelete on QSO.LogId if not a composit key
           // https://msdn.microsoft.com/en-us/data/jj591620#RequiredToRequired
            modelBuilder.Entity<LogData.DataModels.Qso>().HasRequired(p => p.Log)
            .WithMany().HasForeignKey(c=>c.LogId).WillCascadeOnDelete(false);
#endif


            //http://stackoverflow.com/questions/19373310/introducing-foreign-key-constraint-may-cause-cycles-or-multiple-cascade-paths
           // modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
           //base.OnModelCreating(modelBuilder);
        }
    }

}
