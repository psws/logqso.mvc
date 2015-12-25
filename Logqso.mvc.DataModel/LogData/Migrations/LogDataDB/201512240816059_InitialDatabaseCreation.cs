namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabaseCreation : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CallInfo",
                c => new
                    {
                        StationId = c.Int(nullable: false),
                        LogId = c.Int(nullable: false),
                        StationName = c.String(maxLength: 20, unicode: false),
                        CallInfoId = c.Int(nullable: false, identity: true),
                        CallGroup = c.Int(nullable: false),
                        ContestId = c.String(nullable: false, maxLength: 25, unicode: false),
                        Call = c.String(maxLength: 25, unicode: false),
                        CallsignId = c.Int(nullable: false),
                        CallInfoDefault_Id = c.Int(),
                    })
                .PrimaryKey(t => t.CallInfoId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.Station", t => new { t.StationId, t.LogId, t.StationName })
                .ForeignKey("dbo.CallInfoDefault", t => t.CallInfoDefault_Id)
                .Index(t => new { t.StationId, t.LogId, t.StationName })
                .Index(t => t.ContestId)
                .Index(t => t.CallsignId)
                .Index(t => t.CallInfoDefault_Id);
            
            CreateTable(
                "dbo.CallSign",
                c => new
                    {
                        CallSignId = c.Int(nullable: false, identity: true),
                        Call = c.String(nullable: false, maxLength: 20, unicode: false),
                        Continent = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.CallSignId)
                .Index(t => t.Call, unique: true);
            
            CreateTable(
                "dbo.Contest",
                c => new
                    {
                        ContestId = c.String(nullable: false, maxLength: 25, unicode: false),
                        ContestName = c.String(nullable: false, maxLength: 30, unicode: false),
                        ContestGroup = c.Int(nullable: false),
                        ContestType = c.Int(nullable: false),
                        StartDateTime = c.DateTime(nullable: false),
                        EndDateTime = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ContestId);
            
            CreateTable(
                "dbo.Station",
                c => new
                    {
                        StationId = c.Int(nullable: false),
                        LogId = c.Int(nullable: false),
                        StationName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.StationId, t.LogId, t.StationName })
                .ForeignKey("dbo.Log", t => t.LogId, cascadeDelete: true)
                .Index(t => t.LogId);
            
            CreateTable(
                "dbo.CallInfoDefault",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        SessionName = c.String(nullable: false, maxLength: 256, unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .Index(t => t.UserName, unique: true);
            
            CreateTable(
                "dbo.Log",
                c => new
                    {
                        LogId = c.Int(nullable: false, identity: true),
                        ContestYear = c.DateTime(nullable: false),
                        CallsignId = c.Int(nullable: false),
                        ContestId = c.String(maxLength: 25, unicode: false),
                        LogCategoryId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.LogId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId)
                .ForeignKey("dbo.LogCategory", t => t.LogCategoryId, cascadeDelete: true)
                .Index(t => t.CallsignId)
                .Index(t => t.ContestId)
                .Index(t => t.LogCategoryId);
            
            CreateTable(
                "dbo.LogCategory",
                c => new
                    {
                        LogCategoryId = c.Int(nullable: false, identity: true),
                        CatOperator = c.Int(nullable: false),
                        CatOperatorOverlay = c.Int(nullable: false),
                        CatBand = c.Int(nullable: false),
                        CatPower = c.Int(nullable: false),
                        CatAssisted = c.Int(nullable: false),
                        CatNoOfIx = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.LogCategoryId);
            
            CreateTable(
                "dbo.Qso",
                c => new
                    {
                        QsoId = c.Int(nullable: false, identity: true),
                        LogId = c.Int(nullable: false),
                        StationName = c.String(maxLength: 20, unicode: false),
                        CallsignId = c.Int(nullable: false),
                        QsoDateEime = c.DateTime(nullable: false),
                        RxRst = c.Byte(nullable: false),
                        TxRst = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.QsoId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Log", t => t.LogId)
                .Index(t => t.LogId)
                .Index(t => t.CallsignId);
            
            CreateTable(
                "dbo.Session",
                c => new
                    {
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        ControlCategorySettingsEntity = c.String(storeType: "xml"),
                        ControlFiltersSettingsEntity = c.String(storeType: "xml"),
                        ControlXaxisSettingsEntity = c.String(storeType: "xml"),
                        ControlYaxisSettingsEntity = c.String(storeType: "xml"),
                        CallInfo1 = c.String(storeType: "xml"),
                        CallInfo2 = c.String(storeType: "xml"),
                        CallInfo3 = c.String(storeType: "xml"),
                        Subscription = c.Decimal(nullable: false, storeType: "smallmoney"),
                    })
                .PrimaryKey(t => t.UserName);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Qso", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Station", "LogId", "dbo.Log");
            DropForeignKey("dbo.Log", "LogCategoryId", "dbo.LogCategory");
            DropForeignKey("dbo.Log", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Log", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.CallInfo", "CallInfoDefault_Id", "dbo.CallInfoDefault");
            DropForeignKey("dbo.CallInfo", new[] { "StationId", "LogId", "StationName" }, "dbo.Station");
            DropForeignKey("dbo.CallInfo", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.CallInfo", "CallsignId", "dbo.CallSign");
            DropIndex("dbo.Qso", new[] { "CallsignId" });
            DropIndex("dbo.Qso", new[] { "LogId" });
            DropIndex("dbo.Log", new[] { "LogCategoryId" });
            DropIndex("dbo.Log", new[] { "ContestId" });
            DropIndex("dbo.Log", new[] { "CallsignId" });
            DropIndex("dbo.CallInfoDefault", new[] { "UserName" });
            DropIndex("dbo.Station", new[] { "LogId" });
            DropIndex("dbo.CallSign", new[] { "Call" });
            DropIndex("dbo.CallInfo", new[] { "CallInfoDefault_Id" });
            DropIndex("dbo.CallInfo", new[] { "CallsignId" });
            DropIndex("dbo.CallInfo", new[] { "ContestId" });
            DropIndex("dbo.CallInfo", new[] { "StationId", "LogId", "StationName" });
            DropTable("dbo.Session");
            DropTable("dbo.Qso");
            DropTable("dbo.LogCategory");
            DropTable("dbo.Log");
            DropTable("dbo.CallInfoDefault");
            DropTable("dbo.Station");
            DropTable("dbo.Contest");
            DropTable("dbo.CallSign");
            DropTable("dbo.CallInfo");
        }
    }
}
