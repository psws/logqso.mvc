namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabaseCreation : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CallSign",
                c => new
                    {
                        CallSignId = c.Int(nullable: false, identity: true),
                        Call = c.String(nullable: false, maxLength: 20, unicode: false),
                        Continent = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.CallSignId);
            
            CreateTable(
                "dbo.Contest",
                c => new
                    {
                        ContestId = c.Int(nullable: false, identity: true),
                        ContestName = c.String(maxLength: 30),
                    })
                .PrimaryKey(t => t.ContestId);
            
            CreateTable(
                "dbo.Log",
                c => new
                    {
                        LogId = c.Int(nullable: false, identity: true),
                        ContestYear = c.DateTime(nullable: false),
                        ContestId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.LogId)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .Index(t => t.ContestId);
            
            CreateTable(
                "dbo.Qso",
                c => new
                    {
                        QsoId = c.Int(nullable: false, identity: true),
                        LogId = c.Int(nullable: false),
                        CallsignId = c.Int(nullable: false),
                        QsoDateEime = c.DateTime(nullable: false),
                        RxRst = c.Byte(nullable: false),
                        TxRst = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.QsoId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Log", t => t.LogId, cascadeDelete: true)
                .Index(t => t.LogId)
                .Index(t => t.CallsignId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Qso", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Log", "ContestId", "dbo.Contest");
            DropIndex("dbo.Qso", new[] { "CallsignId" });
            DropIndex("dbo.Qso", new[] { "LogId" });
            DropIndex("dbo.Log", new[] { "ContestId" });
            DropTable("dbo.Qso");
            DropTable("dbo.Log");
            DropTable("dbo.Contest");
            DropTable("dbo.CallSign");
        }
    }
}
