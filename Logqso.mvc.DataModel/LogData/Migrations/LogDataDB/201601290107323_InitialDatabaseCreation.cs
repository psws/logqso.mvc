namespace Logqso.mvc.DataModel.LogData.Migrations.LogDataDB
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialDatabaseCreation : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CabrilloInfo",
                c => new
                    {
                        CabrilloInfoId = c.Int(nullable: false, identity: true),
                        ClaimedScore = c.Int(nullable: false),
                        Club = c.String(maxLength: 20, unicode: false),
                        Operators = c.String(maxLength: 200, unicode: false),
                        Address = c.String(maxLength: 200, unicode: false),
                        AddressCity = c.String(maxLength: 100, unicode: false),
                        AddressState = c.String(maxLength: 100, unicode: false),
                        AddressPostalCode = c.String(maxLength: 50, unicode: false),
                        AddressCountry = c.String(maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.CabrilloInfoId);
            
            CreateTable(
                "dbo.CallInfo",
                c => new
                    {
                        CallInfoId = c.Int(nullable: false, identity: true),
                        CallGroup = c.Int(nullable: false),
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        SelectedCall = c.String(maxLength: 25, unicode: false),
                        CallsignId = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        SessionName = c.String(nullable: false, maxLength: 256, unicode: false),
                        LogId = c.Int(nullable: false),
                        StationId = c.Int(),
                    })
                .PrimaryKey(t => t.CallInfoId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.Log", t => t.LogId)
                .Index(t => t.ContestId)
                .Index(t => t.CallsignId)
                .Index(t => t.LogId);
            
            CreateTable(
                "dbo.CallSign",
                c => new
                    {
                        CallSignId = c.Int(nullable: false, identity: true),
                        Call = c.String(nullable: false, maxLength: 20, unicode: false),
                        Continent = c.Int(nullable: false),
                        Accuracy = c.Int(nullable: false),
                        Latitude = c.Double(),
                        Longitude = c.Double(),
                        GeoCodeChk = c.Boolean(),
                    })
                .PrimaryKey(t => t.CallSignId)
                .Index(t => t.Call, unique: true);
            
            CreateTable(
                "dbo.Contest",
                c => new
                    {
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        ContestName = c.String(nullable: false, maxLength: 30, unicode: false),
                        ContestTypeEnum = c.Int(nullable: false),
                        QsoModeTypeEnum = c.Int(nullable: false),
                        StartDateTime = c.DateTime(nullable: false),
                        EndDateTime = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ContestId)
                .ForeignKey("dbo.ContestType", t => t.ContestTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.QsoModeType", t => t.QsoModeTypeEnum, cascadeDelete: true)
                .Index(t => t.ContestTypeEnum)
                .Index(t => t.QsoModeTypeEnum);
            
            CreateTable(
                "dbo.ContestType",
                c => new
                    {
                        ContestTypeEnum = c.Int(nullable: false),
                        ContestTypeEnumName = c.String(nullable: false, maxLength: 20, unicode: false),
                        QsoExchangeTypeEnum = c.Int(nullable: false),
                        QsoExchangeName = c.String(nullable: false, maxLength: 20, unicode: false),
                        QsoMultName = c.String(nullable: false, maxLength: 20, unicode: false),
                        QsoMult2Name = c.String(maxLength: 20, unicode: false),
                        ExtraDataName = c.String(maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.ContestTypeEnum)
                .ForeignKey("dbo.QsoExchangeType", t => t.QsoExchangeTypeEnum, cascadeDelete: true)
                .Index(t => t.QsoExchangeTypeEnum);
            
            CreateTable(
                "dbo.QsoExchangeType",
                c => new
                    {
                        QsoExchangeTypeEnum = c.Int(nullable: false),
                        QsoExchangeTypeEnumName = c.String(maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.QsoExchangeTypeEnum);
            
            CreateTable(
                "dbo.QsoModeType",
                c => new
                    {
                        QsoModeTypeEnum = c.Int(nullable: false),
                        QsoModeEnumName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.QsoModeTypeEnum);
            
            CreateTable(
                "dbo.Log",
                c => new
                    {
                        LogId = c.Int(nullable: false, identity: true),
                        ContestYear = c.DateTime(nullable: false),
                        CallsignId = c.Int(nullable: false),
                        ContestId = c.String(maxLength: 35, unicode: false),
                        LogCategoryId = c.Int(nullable: false),
                        QsoExchangeNumber = c.Short(),
                        QsoDatabaseServerInstance = c.String(nullable: false, maxLength: 100, unicode: false),
                        QsoDatabaseInstance = c.String(nullable: false, maxLength: 100, unicode: false),
                        QsoDatabaseTableName = c.String(nullable: false, maxLength: 100, unicode: false),
                        CabrilloInfoID = c.Int(),
                        WintestDataID = c.Int(),
                        N1mmDataID = c.Int(),
                    })
                .PrimaryKey(t => t.LogId)
                .ForeignKey("dbo.CabrilloInfo", t => t.CabrilloInfoID)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId)
                .ForeignKey("dbo.LogCategory", t => t.LogCategoryId, cascadeDelete: true)
                .Index(t => t.CallsignId)
                .Index(t => t.ContestId)
                .Index(t => t.LogCategoryId)
                .Index(t => t.CabrilloInfoID);
            
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
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        Frequency = c.Decimal(nullable: false, precision: 18, scale: 2),
                        StationId = c.Int(),
                        CallsignId = c.Int(nullable: false),
                        QsoDateTime = c.DateTime(nullable: false),
                        RxRst = c.Byte(nullable: false),
                        TxRst = c.Byte(nullable: false),
                        QsoExchangeNumber = c.Short(),
                        QsoModeTypeEnum = c.Int(nullable: false),
                        QsoRadioTypeEnum = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId })
                .ForeignKey("dbo.CallSign", t => t.CallsignId)
                .ForeignKey("dbo.QsoModeType", t => t.QsoModeTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.QsoRadioType", t => t.QsoRadioTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.Log", t => t.LogId, cascadeDelete: true)
                .Index(t => t.LogId)
                .Index(t => t.CallsignId)
                .Index(t => t.QsoModeTypeEnum)
                .Index(t => t.QsoRadioTypeEnum);
            
            CreateTable(
                "dbo.QsoRadioType",
                c => new
                    {
                        QsoRadioTypeEnum = c.Int(nullable: false),
                        QsoRadioTypeName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => t.QsoRadioTypeEnum);
            
            CreateTable(
                "dbo.Station",
                c => new
                    {
                        StationId = c.Int(nullable: false, identity: true),
                        LogId = c.Int(nullable: false),
                        StationName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.StationId, t.LogId, t.StationName })
                .ForeignKey("dbo.Log", t => t.LogId, cascadeDelete: true)
                .Index(t => t.LogId);
            
            CreateTable(
                "dbo.QsoExchangeAlpha",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        QsoExhangeAlphaValue = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId })
                .ForeignKey("dbo.Qso", t => new { t.QsoNo, t.LogId })
                .Index(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.QsoExtraData",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        QsoExtraDataValue = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId })
                .ForeignKey("dbo.Qso", t => new { t.QsoNo, t.LogId })
                .Index(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.Session",
                c => new
                    {
                        CallInfo1Id = c.Int(),
                        CallInfo2Id = c.Int(),
                        CallInfo3Id = c.Int(),
                        SessionName = c.String(nullable: false, maxLength: 256, unicode: false),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        SessionDateTime = c.DateTime(nullable: false),
                        ControlCategorySettingsEntity = c.String(storeType: "xml"),
                        ControlFiltersSettingsEntity = c.String(storeType: "xml"),
                        ControlXaxisSettingsEntity = c.String(storeType: "xml"),
                        ControlYaxisSettingsEntity = c.String(storeType: "xml"),
                        Subscription = c.Decimal(storeType: "smallmoney"),
                    })
                .PrimaryKey(t => t.SessionName)
                .ForeignKey("dbo.CallInfo", t => t.CallInfo1Id)
                .ForeignKey("dbo.CallInfo", t => t.CallInfo2Id)
                .ForeignKey("dbo.CallInfo", t => t.CallInfo3Id)
                .Index(t => t.CallInfo1Id)
                .Index(t => t.CallInfo2Id)
                .Index(t => t.CallInfo3Id);
            
            CreateTable(
                "dbo.UbnDupes",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.UbnIncorrectCall",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        CorrectCall = c.String(),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.UbnIncorrectExchange",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        CorrectExchange = c.String(),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.UbnNotInLog",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.UbnSummary",
                c => new
                    {
                        CallsignId = c.Int(nullable: false),
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        ContestYear = c.DateTime(nullable: false),
                        LogCategoryId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.CallsignId, t.ContestId })
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.LogCategory", t => t.LogCategoryId, cascadeDelete: true)
                .Index(t => t.CallsignId)
                .Index(t => t.ContestId)
                .Index(t => t.LogCategoryId);
            
            CreateTable(
                "dbo.UbnUniques",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.UbnSummary", "LogCategoryId", "dbo.LogCategory");
            DropForeignKey("dbo.UbnSummary", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.UbnSummary", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Session", "CallInfo3Id", "dbo.CallInfo");
            DropForeignKey("dbo.Session", "CallInfo2Id", "dbo.CallInfo");
            DropForeignKey("dbo.Session", "CallInfo1Id", "dbo.CallInfo");
            DropForeignKey("dbo.QsoExtraData", new[] { "QsoNo", "LogId" }, "dbo.Qso");
            DropForeignKey("dbo.QsoExchangeAlpha", new[] { "QsoNo", "LogId" }, "dbo.Qso");
            DropForeignKey("dbo.CallInfo", "LogId", "dbo.Log");
            DropForeignKey("dbo.Station", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", "QsoRadioTypeEnum", "dbo.QsoRadioType");
            DropForeignKey("dbo.Qso", "QsoModeTypeEnum", "dbo.QsoModeType");
            DropForeignKey("dbo.Qso", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Log", "LogCategoryId", "dbo.LogCategory");
            DropForeignKey("dbo.Log", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Log", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Log", "CabrilloInfoID", "dbo.CabrilloInfo");
            DropForeignKey("dbo.CallInfo", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Contest", "QsoModeTypeEnum", "dbo.QsoModeType");
            DropForeignKey("dbo.Contest", "ContestTypeEnum", "dbo.ContestType");
            DropForeignKey("dbo.ContestType", "QsoExchangeTypeEnum", "dbo.QsoExchangeType");
            DropForeignKey("dbo.CallInfo", "CallsignId", "dbo.CallSign");
            DropIndex("dbo.UbnSummary", new[] { "LogCategoryId" });
            DropIndex("dbo.UbnSummary", new[] { "ContestId" });
            DropIndex("dbo.UbnSummary", new[] { "CallsignId" });
            DropIndex("dbo.Session", new[] { "CallInfo3Id" });
            DropIndex("dbo.Session", new[] { "CallInfo2Id" });
            DropIndex("dbo.Session", new[] { "CallInfo1Id" });
            DropIndex("dbo.QsoExtraData", new[] { "QsoNo", "LogId" });
            DropIndex("dbo.QsoExchangeAlpha", new[] { "QsoNo", "LogId" });
            DropIndex("dbo.Station", new[] { "LogId" });
            DropIndex("dbo.Qso", new[] { "QsoRadioTypeEnum" });
            DropIndex("dbo.Qso", new[] { "QsoModeTypeEnum" });
            DropIndex("dbo.Qso", new[] { "CallsignId" });
            DropIndex("dbo.Qso", new[] { "LogId" });
            DropIndex("dbo.Log", new[] { "CabrilloInfoID" });
            DropIndex("dbo.Log", new[] { "LogCategoryId" });
            DropIndex("dbo.Log", new[] { "ContestId" });
            DropIndex("dbo.Log", new[] { "CallsignId" });
            DropIndex("dbo.ContestType", new[] { "QsoExchangeTypeEnum" });
            DropIndex("dbo.Contest", new[] { "QsoModeTypeEnum" });
            DropIndex("dbo.Contest", new[] { "ContestTypeEnum" });
            DropIndex("dbo.CallSign", new[] { "Call" });
            DropIndex("dbo.CallInfo", new[] { "LogId" });
            DropIndex("dbo.CallInfo", new[] { "CallsignId" });
            DropIndex("dbo.CallInfo", new[] { "ContestId" });
            DropTable("dbo.UbnUniques");
            DropTable("dbo.UbnSummary");
            DropTable("dbo.UbnNotInLog");
            DropTable("dbo.UbnIncorrectExchange");
            DropTable("dbo.UbnIncorrectCall");
            DropTable("dbo.UbnDupes");
            DropTable("dbo.Session");
            DropTable("dbo.QsoExtraData");
            DropTable("dbo.QsoExchangeAlpha");
            DropTable("dbo.Station");
            DropTable("dbo.QsoRadioType");
            DropTable("dbo.Qso");
            DropTable("dbo.LogCategory");
            DropTable("dbo.Log");
            DropTable("dbo.QsoModeType");
            DropTable("dbo.QsoExchangeType");
            DropTable("dbo.ContestType");
            DropTable("dbo.Contest");
            DropTable("dbo.CallSign");
            DropTable("dbo.CallInfo");
            DropTable("dbo.CabrilloInfo");
        }
    }
}
