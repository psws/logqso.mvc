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
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        CallSignId = c.Int(nullable: false),
                        ClaimedScore = c.Int(nullable: false),
                        Club = c.String(maxLength: 20, unicode: false),
                        Operators = c.String(maxLength: 200, unicode: false),
                        Address = c.String(maxLength: 200, unicode: false),
                        AddressCity = c.String(maxLength: 100, unicode: false),
                        AddressState = c.String(maxLength: 100, unicode: false),
                        AddressPostalCode = c.String(maxLength: 50, unicode: false),
                        AddressCountry = c.String(maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => new { t.ContestId, t.CallSignId })
                .ForeignKey("dbo.CallSign", t => t.CallSignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .Index(t => t.ContestId)
                .Index(t => t.CallSignId);
            
            CreateTable(
                "dbo.CallSign",
                c => new
                    {
                        CallSignId = c.Int(nullable: false, identity: true),
                        Call = c.String(nullable: false, maxLength: 20, unicode: false),
                        Prefix = c.String(nullable: false, maxLength: 10, unicode: false),
                        ContinentEnum = c.Int(nullable: false),
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
                        Active = c.Boolean(nullable: false),
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
                "dbo.CallInfo",
                c => new
                    {
                        LogId = c.Int(nullable: false),
                        StationName = c.String(maxLength: 20, unicode: false),
                        CallInfoId = c.Int(nullable: false),
                        CallGroup = c.Int(nullable: false),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        CallsignId = c.Int(nullable: false),
                        SessionName = c.String(nullable: false, maxLength: 256, unicode: false),
                        Disabled = c.Boolean(nullable: false),
                        QsoRadioTypeEnum = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.CallInfoId, t.CallGroup, t.UserName })
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.QsoRadioType", t => t.QsoRadioTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.Session", t => t.SessionName, cascadeDelete: true)
                .ForeignKey("dbo.Station", t => new { t.LogId, t.StationName })
                .Index(t => new { t.LogId, t.StationName })
                .Index(t => t.ContestId)
                .Index(t => t.CallsignId)
                .Index(t => t.SessionName)
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
                "dbo.Session",
                c => new
                    {
                        SessionName = c.String(nullable: false, maxLength: 256, unicode: false),
                        UserName = c.String(nullable: false, maxLength: 256, unicode: false),
                        SessionDateTime = c.DateTime(nullable: false),
                        CategorySettings = c.String(storeType: "xml"),
                        FiltersSettings = c.String(storeType: "xml"),
                        XaxisSettings = c.String(storeType: "xml"),
                        YaxisSettings = c.String(storeType: "xml"),
                        Subscription = c.Decimal(storeType: "smallmoney"),
                    })
                .PrimaryKey(t => t.SessionName);
            
            CreateTable(
                "dbo.Station",
                c => new
                    {
                        LogId = c.Int(nullable: false),
                        StationName = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.LogId, t.StationName })
                .ForeignKey("dbo.Log", t => t.LogId, cascadeDelete: true)
                .Index(t => t.LogId);
            
            CreateTable(
                "dbo.Log",
                c => new
                    {
                        LogId = c.Int(nullable: false, identity: true),
                        ContestYear = c.DateTime(nullable: false),
                        CallsignId = c.Int(nullable: false),
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        LogCategoryId = c.Int(nullable: false),
                        QsoExchangeNumber = c.Short(),
                        QsoDatabaseServerInstance = c.String(nullable: false, maxLength: 100, unicode: false),
                        QsoDatabaseInstance = c.String(nullable: false, maxLength: 100, unicode: false),
                        QsoDatabaseTableName = c.String(nullable: false, maxLength: 100, unicode: false),
                        WintestDataID = c.Int(),
                        N1mmDataID = c.Int(),
                    })
                .PrimaryKey(t => t.LogId)
                .ForeignKey("dbo.CallSign", t => t.CallsignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.LogCategory", t => t.LogCategoryId, cascadeDelete: true)
                .Index(t => t.CallsignId)
                .Index(t => t.ContestId)
                .Index(t => t.LogCategoryId);
            
            CreateTable(
                "dbo.LogCategory",
                c => new
                    {
                        LogCategoryId = c.Int(nullable: false, identity: true),
                        CatOperatorEnum = c.Int(nullable: false),
                        CatOperatorOverlayEnum = c.Int(nullable: false),
                        CatBandEnum = c.Int(nullable: false),
                        CatPowerEnum = c.Int(nullable: false),
                        CatAssistedEnum = c.Int(nullable: false),
                        CatNoOfTxEnum = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.LogCategoryId);
            
            CreateTable(
                "dbo.Qso",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        StationName = c.String(maxLength: 20, unicode: false),
                        Frequency = c.Decimal(nullable: false, precision: 18, scale: 2),
                        CallsignId = c.Int(nullable: false),
                        QsoDateTime = c.DateTime(nullable: false),
                        RxRst = c.Short(nullable: false),
                        TxRst = c.Short(nullable: false),
                        QsoExchangeNumber = c.Short(),
                        QsoModeTypeEnum = c.Int(nullable: false),
                        QsoRadioTypeEnum = c.Int(nullable: false),
                        QZoneMult = c.Boolean(nullable: false),
                        QCtyMult = c.Boolean(nullable: false),
                        QPrefixMult = c.Boolean(nullable: false),
                        QPts1 = c.Boolean(nullable: false),
                        QPts2 = c.Boolean(nullable: false),
                        QPts4 = c.Boolean(nullable: false),
                        QPts8 = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId })
                .ForeignKey("dbo.CallSign", t => t.CallsignId)
                .ForeignKey("dbo.QsoModeType", t => t.QsoModeTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.QsoRadioType", t => t.QsoRadioTypeEnum, cascadeDelete: true)
                .ForeignKey("dbo.Station", t => new { t.LogId, t.StationName })
                .ForeignKey("dbo.Log", t => t.LogId)
                .Index(t => new { t.LogId, t.StationName })
                .Index(t => t.CallsignId)
                .Index(t => t.QsoModeTypeEnum)
                .Index(t => t.QsoRadioTypeEnum);
            
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
                "dbo.QsoExchangeNumber",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        QsoExhangeNumberValue = c.Short(nullable: false),
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
                "dbo.Spot",
                c => new
                    {
                        SpotId = c.Int(nullable: false, identity: true),
                        ContestId = c.String(nullable: false, maxLength: 35, unicode: false),
                        CallSignId = c.Int(nullable: false),
                        SpoterCallSignId = c.Int(nullable: false),
                        SpotDateTime = c.DateTime(nullable: false),
                        Frequency = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.SpotId)
                .ForeignKey("dbo.CallSign", t => t.CallSignId, cascadeDelete: true)
                .ForeignKey("dbo.Contest", t => t.ContestId, cascadeDelete: true)
                .ForeignKey("dbo.CallSign", t => t.SpoterCallSignId)
                .Index(t => t.ContestId)
                .Index(t => t.CallSignId)
                .Index(t => t.SpoterCallSignId);
            
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
                        CorrectCall = c.String(nullable: false, maxLength: 20, unicode: false),
                    })
                .PrimaryKey(t => new { t.QsoNo, t.LogId });
            
            CreateTable(
                "dbo.UbnIncorrectExchange",
                c => new
                    {
                        QsoNo = c.Short(nullable: false),
                        LogId = c.Int(nullable: false),
                        CorrectExchange = c.String(nullable: false, maxLength: 20, unicode: false),
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
                        DuplicateCount = c.Int(nullable: false),
                        Claimed160Qso = c.Short(),
                        Claimed160Points = c.Int(),
                        Claimed160Countries = c.Short(),
                        Claimed160Zones = c.Short(),
                        Claimed80Qso = c.Short(),
                        Claimed80Points = c.Int(),
                        Claimed80Countries = c.Short(),
                        Claimed80Zones = c.Short(),
                        Claimed40Qso = c.Short(),
                        Claimed40Points = c.Int(),
                        Claimed40Countries = c.Short(),
                        Claimed40Zones = c.Short(),
                        Claimed20Qso = c.Short(),
                        Claimed20Points = c.Int(),
                        Claimed20Countries = c.Short(),
                        Claimed20Zones = c.Short(),
                        Claimed15Qso = c.Short(),
                        Claimed15Points = c.Int(),
                        Claimed15Countries = c.Short(),
                        Claimed15Zone3 = c.Short(),
                        Claimed10Qso = c.Short(),
                        Claimed10Points = c.Int(),
                        Claimed10Countries = c.Short(),
                        Claimed10Zones = c.Short(),
                        ClaimedTotalQSO = c.Int(),
                        ClaimedCountries = c.Short(),
                        ClaimedZones = c.Short(),
                        ClaimedTotalPoints = c.Int(),
                        ClaimedScore = c.Int(),
                        Final160Qso = c.Short(),
                        Final160Points = c.Int(),
                        Final160Countries = c.Short(),
                        Final160Zones = c.Short(),
                        Final80Qso = c.Short(),
                        Final80Points = c.Int(),
                        Final80Countries = c.Short(),
                        Final80Zones = c.Short(),
                        Final40Qso = c.Short(),
                        Final40Points = c.Int(),
                        Final40Countries = c.Short(),
                        Final40Zones = c.Short(),
                        Final20Qso = c.Short(),
                        Final20Points = c.Int(),
                        Final20Countries = c.Short(),
                        Final20Zones = c.Short(),
                        Final15Qso = c.Int(),
                        Final15Points = c.Int(),
                        Final15Countries = c.Int(),
                        Final15Zones = c.Int(),
                        Final10Qso = c.Short(),
                        Final10Points = c.Int(),
                        Final10Countries = c.Short(),
                        Final10Zones = c.Short(),
                        FinalTotalQSO = c.Int(),
                        FinalCountries = c.Short(),
                        FinalZones = c.Short(),
                        FinalTotalPoints = c.Int(),
                        FinalScore = c.Int(),
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
            DropForeignKey("dbo.Spot", "SpoterCallSignId", "dbo.CallSign");
            DropForeignKey("dbo.Spot", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Spot", "CallSignId", "dbo.CallSign");
            DropForeignKey("dbo.QsoExtraData", new[] { "QsoNo", "LogId" }, "dbo.Qso");
            DropForeignKey("dbo.QsoExchangeNumber", new[] { "QsoNo", "LogId" }, "dbo.Qso");
            DropForeignKey("dbo.QsoExchangeAlpha", new[] { "QsoNo", "LogId" }, "dbo.Qso");
            DropForeignKey("dbo.Station", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", "LogId", "dbo.Log");
            DropForeignKey("dbo.Qso", new[] { "LogId", "StationName" }, "dbo.Station");
            DropForeignKey("dbo.Qso", "QsoRadioTypeEnum", "dbo.QsoRadioType");
            DropForeignKey("dbo.Qso", "QsoModeTypeEnum", "dbo.QsoModeType");
            DropForeignKey("dbo.Qso", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.Log", "LogCategoryId", "dbo.LogCategory");
            DropForeignKey("dbo.Log", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Log", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.CallInfo", new[] { "LogId", "StationName" }, "dbo.Station");
            DropForeignKey("dbo.CallInfo", "SessionName", "dbo.Session");
            DropForeignKey("dbo.CallInfo", "QsoRadioTypeEnum", "dbo.QsoRadioType");
            DropForeignKey("dbo.CallInfo", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.CallInfo", "CallsignId", "dbo.CallSign");
            DropForeignKey("dbo.CabrilloInfo", "ContestId", "dbo.Contest");
            DropForeignKey("dbo.Contest", "QsoModeTypeEnum", "dbo.QsoModeType");
            DropForeignKey("dbo.Contest", "ContestTypeEnum", "dbo.ContestType");
            DropForeignKey("dbo.ContestType", "QsoExchangeTypeEnum", "dbo.QsoExchangeType");
            DropForeignKey("dbo.CabrilloInfo", "CallSignId", "dbo.CallSign");
            DropIndex("dbo.UbnSummary", new[] { "LogCategoryId" });
            DropIndex("dbo.UbnSummary", new[] { "ContestId" });
            DropIndex("dbo.UbnSummary", new[] { "CallsignId" });
            DropIndex("dbo.Spot", new[] { "SpoterCallSignId" });
            DropIndex("dbo.Spot", new[] { "CallSignId" });
            DropIndex("dbo.Spot", new[] { "ContestId" });
            DropIndex("dbo.QsoExtraData", new[] { "QsoNo", "LogId" });
            DropIndex("dbo.QsoExchangeNumber", new[] { "QsoNo", "LogId" });
            DropIndex("dbo.QsoExchangeAlpha", new[] { "QsoNo", "LogId" });
            DropIndex("dbo.Qso", new[] { "QsoRadioTypeEnum" });
            DropIndex("dbo.Qso", new[] { "QsoModeTypeEnum" });
            DropIndex("dbo.Qso", new[] { "CallsignId" });
            DropIndex("dbo.Qso", new[] { "LogId", "StationName" });
            DropIndex("dbo.Log", new[] { "LogCategoryId" });
            DropIndex("dbo.Log", new[] { "ContestId" });
            DropIndex("dbo.Log", new[] { "CallsignId" });
            DropIndex("dbo.Station", new[] { "LogId" });
            DropIndex("dbo.CallInfo", new[] { "QsoRadioTypeEnum" });
            DropIndex("dbo.CallInfo", new[] { "SessionName" });
            DropIndex("dbo.CallInfo", new[] { "CallsignId" });
            DropIndex("dbo.CallInfo", new[] { "ContestId" });
            DropIndex("dbo.CallInfo", new[] { "LogId", "StationName" });
            DropIndex("dbo.ContestType", new[] { "QsoExchangeTypeEnum" });
            DropIndex("dbo.Contest", new[] { "QsoModeTypeEnum" });
            DropIndex("dbo.Contest", new[] { "ContestTypeEnum" });
            DropIndex("dbo.CallSign", new[] { "Call" });
            DropIndex("dbo.CabrilloInfo", new[] { "CallSignId" });
            DropIndex("dbo.CabrilloInfo", new[] { "ContestId" });
            DropTable("dbo.UbnUniques");
            DropTable("dbo.UbnSummary");
            DropTable("dbo.UbnNotInLog");
            DropTable("dbo.UbnIncorrectExchange");
            DropTable("dbo.UbnIncorrectCall");
            DropTable("dbo.UbnDupes");
            DropTable("dbo.Spot");
            DropTable("dbo.QsoExtraData");
            DropTable("dbo.QsoExchangeNumber");
            DropTable("dbo.QsoExchangeAlpha");
            DropTable("dbo.Qso");
            DropTable("dbo.LogCategory");
            DropTable("dbo.Log");
            DropTable("dbo.Station");
            DropTable("dbo.Session");
            DropTable("dbo.QsoRadioType");
            DropTable("dbo.CallInfo");
            DropTable("dbo.QsoModeType");
            DropTable("dbo.QsoExchangeType");
            DropTable("dbo.ContestType");
            DropTable("dbo.Contest");
            DropTable("dbo.CallSign");
            DropTable("dbo.CabrilloInfo");
        }
    }
}
