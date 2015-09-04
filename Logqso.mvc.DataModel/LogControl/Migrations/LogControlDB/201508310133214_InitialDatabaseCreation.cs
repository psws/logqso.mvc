namespace Logqso.mvc.DataModel.LogControl.Migrations.LogControlDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabaseCreation : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CatAssisted",
                c => new
                    {
                        CatAssist = c.Int(nullable: false),
                        CatAssistedName = c.String(nullable: false, maxLength: 15, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.CatAssist);
            
            CreateTable(
                "dbo.CatBand",
                c => new
                    {
                        CatBnd = c.Int(nullable: false),
                        CatBandName = c.String(nullable: false, maxLength: 4, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.CatBnd);
            
            CreateTable(
                "dbo.CatDefault",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        CatOpr = c.Int(nullable: false),
                        CatAssist = c.Int(nullable: false),
                        CatBnd = c.Int(nullable: false),
                        CatTx = c.Int(nullable: false),
                        CatPwr = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CatAssisted", t => t.CatAssist, cascadeDelete: true)
                .ForeignKey("dbo.CatBand", t => t.CatBnd, cascadeDelete: true)
                .ForeignKey("dbo.CatNoOfTx", t => t.CatTx, cascadeDelete: true)
                .ForeignKey("dbo.CatOperator", t => t.CatOpr, cascadeDelete: true)
                .ForeignKey("dbo.CatPower", t => t.CatPwr, cascadeDelete: true)
                .Index(t => t.CatOpr)
                .Index(t => t.CatAssist)
                .Index(t => t.CatBnd)
                .Index(t => t.CatTx)
                .Index(t => t.CatPwr);
            
            CreateTable(
                "dbo.CatNoOfTx",
                c => new
                    {
                        CatTx = c.Int(nullable: false),
                        CatNoOfTxName = c.String(nullable: false, maxLength: 12, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.CatTx);
            
            CreateTable(
                "dbo.CatOperator",
                c => new
                    {
                        CatOpr = c.Int(nullable: false),
                        CatOprName = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.CatOpr);
            
            CreateTable(
                "dbo.CatPower",
                c => new
                    {
                        CatPwr = c.Int(nullable: false),
                        CatPowerName = c.String(nullable: false, maxLength: 6, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.CatPwr);
            
            CreateTable(
                "dbo.FiltBand",
                c => new
                    {
                        FiltBnd = c.Int(nullable: false),
                        FiltBandName = c.String(nullable: false, maxLength: 4, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.FiltBnd);
            
            CreateTable(
                "dbo.FiltContinent",
                c => new
                    {
                        FiltCont = c.Int(nullable: false),
                        FiltContName = c.String(nullable: false, maxLength: 3, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.FiltCont);
            
            CreateTable(
                "dbo.FiltCQZone",
                c => new
                    {
                        FiltCQZoneVal = c.String(nullable: false, maxLength: 6, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.FiltCQZoneVal);
            
            CreateTable(
                "dbo.FiltDefaullt",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        FiltBnd = c.Int(nullable: false),
                        FiltCont = c.Int(nullable: false),
                        FiltPref = c.String(nullable: false, maxLength: 10, unicode: false),
                        FiltCQZoneVal = c.String(nullable: false, maxLength: 6, unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.FiltBand", t => t.FiltBnd, cascadeDelete: true)
                .ForeignKey("dbo.FiltContinent", t => t.FiltCont, cascadeDelete: true)
                .ForeignKey("dbo.FiltCQZone", t => t.FiltCQZoneVal, cascadeDelete: true)
                .ForeignKey("dbo.FiltPrefix", t => t.FiltPref, cascadeDelete: true)
                .Index(t => t.FiltBnd)
                .Index(t => t.FiltCont)
                .Index(t => t.FiltPref)
                .Index(t => t.FiltCQZoneVal);
            
            CreateTable(
                "dbo.FiltPrefix",
                c => new
                    {
                        FiltPref = c.String(nullable: false, maxLength: 10, unicode: false),
                        CountryName = c.String(nullable: false, maxLength: 24, unicode: false),
                    })
                .PrimaryKey(t => t.FiltPref);
            
            CreateTable(
                "dbo.XaxisDefault",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        XaxisDurationTime = c.String(nullable: false, maxLength: 4, unicode: false),
                        XaxisStrtTime = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.XaxisDuration", t => t.XaxisDurationTime, cascadeDelete: true)
                .ForeignKey("dbo.XaxisStartTime", t => t.XaxisStrtTime, cascadeDelete: true)
                .Index(t => t.XaxisDurationTime)
                .Index(t => t.XaxisStrtTime);
            
            CreateTable(
                "dbo.XaxisDuration",
                c => new
                    {
                        XaxisDurationTime = c.String(nullable: false, maxLength: 4, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.XaxisDurationTime);
            
            CreateTable(
                "dbo.XaxisStartTime",
                c => new
                    {
                        XaxisStrtTime = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.XaxisStrtTime);
            
            CreateTable(
                "dbo.YaxisDefault",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        YaxisFuncName = c.String(nullable: false, maxLength: 20, unicode: false),
                        YaxisIntvVal = c.String(nullable: false, maxLength: 4, unicode: false),
                        YaxisViewTypeName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.YaxisFunction", t => t.YaxisFuncName, cascadeDelete: true)
                .ForeignKey("dbo.YaxisInterval", t => t.YaxisIntvVal, cascadeDelete: true)
                .ForeignKey("dbo.YaxisViewType", t => t.YaxisViewTypeName, cascadeDelete: true)
                .Index(t => t.YaxisFuncName)
                .Index(t => t.YaxisIntvVal)
                .Index(t => t.YaxisViewTypeName);
            
            CreateTable(
                "dbo.YaxisFunction",
                c => new
                    {
                        YaxisFuncName = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.YaxisFuncName);
            
            CreateTable(
                "dbo.YaxisInterval",
                c => new
                    {
                        YaxisIntvVal = c.String(nullable: false, maxLength: 4, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.YaxisIntvVal);
            
            CreateTable(
                "dbo.YaxisViewType",
                c => new
                    {
                        YaxisViewTypeName = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.YaxisViewTypeName)
                .Index(t => t.YaxisViewTypeName, unique: true);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.YaxisDefault", "YaxisViewTypeName", "dbo.YaxisViewType");
            DropForeignKey("dbo.YaxisDefault", "YaxisIntvVal", "dbo.YaxisInterval");
            DropForeignKey("dbo.YaxisDefault", "YaxisFuncName", "dbo.YaxisFunction");
            DropForeignKey("dbo.XaxisDefault", "XaxisStrtTime", "dbo.XaxisStartTime");
            DropForeignKey("dbo.XaxisDefault", "XaxisDurationTime", "dbo.XaxisDuration");
            DropForeignKey("dbo.FiltDefaullt", "FiltPref", "dbo.FiltPrefix");
            DropForeignKey("dbo.FiltDefaullt", "FiltCQZoneVal", "dbo.FiltCQZone");
            DropForeignKey("dbo.FiltDefaullt", "FiltCont", "dbo.FiltContinent");
            DropForeignKey("dbo.FiltDefaullt", "FiltBnd", "dbo.FiltBand");
            DropForeignKey("dbo.CatDefault", "CatPwr", "dbo.CatPower");
            DropForeignKey("dbo.CatDefault", "CatOpr", "dbo.CatOperator");
            DropForeignKey("dbo.CatDefault", "CatTx", "dbo.CatNoOfTx");
            DropForeignKey("dbo.CatDefault", "CatBnd", "dbo.CatBand");
            DropForeignKey("dbo.CatDefault", "CatAssist", "dbo.CatAssisted");
            DropIndex("dbo.YaxisViewType", new[] { "YaxisViewTypeName" });
            DropIndex("dbo.YaxisDefault", new[] { "YaxisViewTypeName" });
            DropIndex("dbo.YaxisDefault", new[] { "YaxisIntvVal" });
            DropIndex("dbo.YaxisDefault", new[] { "YaxisFuncName" });
            DropIndex("dbo.XaxisDefault", new[] { "XaxisStrtTime" });
            DropIndex("dbo.XaxisDefault", new[] { "XaxisDurationTime" });
            DropIndex("dbo.FiltDefaullt", new[] { "FiltCQZoneVal" });
            DropIndex("dbo.FiltDefaullt", new[] { "FiltPref" });
            DropIndex("dbo.FiltDefaullt", new[] { "FiltCont" });
            DropIndex("dbo.FiltDefaullt", new[] { "FiltBnd" });
            DropIndex("dbo.CatDefault", new[] { "CatPwr" });
            DropIndex("dbo.CatDefault", new[] { "CatTx" });
            DropIndex("dbo.CatDefault", new[] { "CatBnd" });
            DropIndex("dbo.CatDefault", new[] { "CatAssist" });
            DropIndex("dbo.CatDefault", new[] { "CatOpr" });
            DropTable("dbo.YaxisViewType");
            DropTable("dbo.YaxisInterval");
            DropTable("dbo.YaxisFunction");
            DropTable("dbo.YaxisDefault");
            DropTable("dbo.XaxisStartTime");
            DropTable("dbo.XaxisDuration");
            DropTable("dbo.XaxisDefault");
            DropTable("dbo.FiltPrefix");
            DropTable("dbo.FiltDefaullt");
            DropTable("dbo.FiltCQZone");
            DropTable("dbo.FiltContinent");
            DropTable("dbo.FiltBand");
            DropTable("dbo.CatPower");
            DropTable("dbo.CatOperator");
            DropTable("dbo.CatNoOfTx");
            DropTable("dbo.CatDefault");
            DropTable("dbo.CatBand");
            DropTable("dbo.CatAssisted");
        }
    }
}
