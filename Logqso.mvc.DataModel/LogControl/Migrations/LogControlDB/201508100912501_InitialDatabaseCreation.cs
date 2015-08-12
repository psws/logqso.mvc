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
                "dbo.FiltCountry",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Prefix = c.String(nullable: false, maxLength: 8, unicode: false),
                        CountryName = c.String(nullable: false, maxLength: 24, unicode: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.FiltCQZone",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FiltCQZoneVal = c.String(nullable: false, maxLength: 4, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.XaxisDuration",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        XaxisDurationTime = c.Int(nullable: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.XaxisStartTime",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        XaxisStrtTime = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.YaxisFunction",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        YaxisFuncName = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.YaxisInterval",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        YaxisIntvVal = c.Int(nullable: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.YaxisViewType",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        YaxisViewTypeName = c.String(nullable: false, maxLength: 20, unicode: false),
                        Index = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.YaxisViewType");
            DropTable("dbo.YaxisInterval");
            DropTable("dbo.YaxisFunction");
            DropTable("dbo.XaxisStartTime");
            DropTable("dbo.XaxisDuration");
            DropTable("dbo.FiltCQZone");
            DropTable("dbo.FiltCountry");
            DropTable("dbo.FiltContinent");
            DropTable("dbo.FiltBand");
            DropTable("dbo.CatPower");
            DropTable("dbo.CatOperator");
            DropTable("dbo.CatNoOfTx");
            DropTable("dbo.CatBand");
            DropTable("dbo.CatAssisted");
        }
    }
}
