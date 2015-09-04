namespace Logqso.mvc.DataModel.LogControl.Migrations.LogControlDB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<Logqso.mvc.DataModel.LogControl.LogControlDB>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            MigrationsDirectory = @"LogControl\Migrations\LogControlDB";
        }

        protected override void Seed(Logqso.mvc.DataModel.LogControl.LogControlDB context)
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
            CategorySeeds.SeedCategory(context);
            FiltersSeeds.SeedFilters(context);
            YaxisSeeds.SeedYaxis(context);
            XAxisSeeds.SeedXaxis(context);
            DefaultSeeds.SeedDefault(context);
        }
    }
}
