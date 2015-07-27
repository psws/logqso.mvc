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
                    })
                .PrimaryKey(t => t.CatAssist);
            
            CreateTable(
                "dbo.CatBand",
                c => new
                    {
                        CatBnd = c.Int(nullable: false),
                        CatBandName = c.String(nullable: false, maxLength: 4, unicode: false),
                    })
                .PrimaryKey(t => t.CatBnd);
            
            CreateTable(
                "dbo.CatNoOfTx",
                c => new
                    {
                        CatTx = c.Int(nullable: false),
                        CatNoOfTxName = c.String(nullable: false, maxLength: 12, unicode: false),
                    })
                .PrimaryKey(t => t.CatTx);
            
            CreateTable(
                "dbo.CatOperator",
                c => new
                    {
                        CatOpr = c.Int(nullable: false),
                        CatOprName = c.String(nullable: false, maxLength: 15, unicode: false),
                    })
                .PrimaryKey(t => t.CatOpr);
            
            CreateTable(
                "dbo.CatPower",
                c => new
                    {
                        CatPwr = c.Int(nullable: false),
                        CatPowerName = c.String(nullable: false, maxLength: 6, unicode: false),
                    })
                .PrimaryKey(t => t.CatPwr);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.CatPower");
            DropTable("dbo.CatOperator");
            DropTable("dbo.CatNoOfTx");
            DropTable("dbo.CatBand");
            DropTable("dbo.CatAssisted");
        }
    }
}
