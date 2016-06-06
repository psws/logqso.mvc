namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class multsPtsDatabaseCreation : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Qso", "QZoneMult", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QCtyMult", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QPrefixMult", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QPts1", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QPts2", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QPts4", c => c.Boolean(nullable: false));
            AddColumn("dbo.Qso", "QPts8", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Qso", "QPts8");
            DropColumn("dbo.Qso", "QPts4");
            DropColumn("dbo.Qso", "QPts2");
            DropColumn("dbo.Qso", "QPts1");
            DropColumn("dbo.Qso", "QPrefixMult");
            DropColumn("dbo.Qso", "QCtyMult");
            DropColumn("dbo.Qso", "QZoneMult");
        }
    }
}
