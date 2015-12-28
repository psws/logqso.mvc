namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Logqso.mvc.DataModel.LogData.LogDataDB>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            MigrationsDirectory = @"LogData\Migrations\LogDataDB";
        }

        protected override void Seed(Logqso.mvc.DataModel.LogData.LogDataDB context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
            QsoModeTypeSeeds.SeedContest(context);
            QsoExchangeTypeSeeds.SeedContest(context);
            ContestTypeSeeds.SeedContest(context);
            CallSignSeeds.SeedContest(context);
            ContestSeeds.SeedContest(context);
            LogCategorySeeds.SeedContest(context);
            LogSeeds.SeedContest(context);
            StationSeeds.SeedContest(context);
#if DEBUG
         QsoSeeds.SeedContest(context);
#endif

        }
    }
}
