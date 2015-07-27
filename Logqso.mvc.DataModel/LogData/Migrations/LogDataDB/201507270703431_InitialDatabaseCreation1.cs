namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabaseCreation1 : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.Qso");
            AlterColumn("dbo.Contest", "ContestName", c => c.String(nullable: false, maxLength: 30, unicode: false));
            AlterColumn("dbo.Qso", "QsoId", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.Qso", new[] { "QsoId", "LogId" });
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.Qso");
            AlterColumn("dbo.Qso", "QsoId", c => c.Int(nullable: false, identity: true));
            AlterColumn("dbo.Contest", "ContestName", c => c.String(maxLength: 30));
            AddPrimaryKey("dbo.Qso", "QsoId");
        }
    }
}
