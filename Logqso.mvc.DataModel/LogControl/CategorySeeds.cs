using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.common.Enum;
using Logqso.mvc.DataModel.LogControl.CategoryModels;


namespace Logqso.mvc.DataModel.LogControl
{
    public class CategorySeeds
    {
        public static void SeedCategory(Logqso.mvc.DataModel.LogControl.LogControlDB context)
        {
            //called by
            // CategorySeeds.SeedCategory( context) in LoalControlDB.cs

            context.CatOperator.AddOrUpdate(
                  p => p.CatOprName,
                  new CatOperator { CatOpr = CatOperatorEnum.ALL, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.ALL), Index = 1 },
                   new CatOperator { CatOpr = CatOperatorEnum.SINGLE_OP, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP).Replace('_', '-'), Index = 2 },
                   new CatOperator { CatOpr = CatOperatorEnum.MULTI_OP, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.MULTI_OP).Replace('_', '-'), Index = 3 },
                   new CatOperator { CatOpr = CatOperatorEnum.SINGLE_OP_CLASSIC, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP_CLASSIC), Index = 4 },
                  new CatOperator { CatOpr = CatOperatorEnum.SINGLE_OP_ROOKIE, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP_ROOKIE), Index = 5 },
                 new CatOperator { CatOpr = CatOperatorEnum.CHECKLOG, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.CHECKLOG), Index = 6 }
              );

            context.CatBand.AddOrUpdate(
                  p => p.CatBandName,
                  new CatBand { CatBnd = CatBandEnum.ALL, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum.ALL), Index = 1 },
                   new CatBand { CatBnd = CatBandEnum._160M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._160M).Replace("_", ""), Index = 2 },
                   new CatBand { CatBnd = CatBandEnum._80M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._80M).Replace("_", ""), Index = 3 },
                  new CatBand { CatBnd = CatBandEnum._40M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._40M).Replace("_", ""), Index = 4 },
                   new CatBand { CatBnd = CatBandEnum._20M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._20M).Replace("_", ""), Index = 5 },
                  new CatBand { CatBnd = CatBandEnum._15M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._15M).Replace("_", ""), Index = 6 },
                  new CatBand { CatBnd = CatBandEnum._10M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._10M).Replace("_", ""), Index = 7 }
             );

            context.CatPower.AddOrUpdate(
              p => p.CatPowerName,
              new CatPower { CatPwr = CatPowerrEnum.ALL, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.ALL), Index = 1 },
               new CatPower { CatPwr = CatPowerrEnum.HIGH, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.HIGH), Index = 2 },
              new CatPower { CatPwr = CatPowerrEnum.LOW, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.LOW), Index = 3 },
              new CatPower { CatPwr = CatPowerrEnum.QRP, CatPowerName = Enum.GetName(typeof(CatPowerrEnum), CatPowerrEnum.QRP), Index = 4 }
             );

            context.CatAssisted.AddOrUpdate(
              p => p.CatAssistedName,
              new CatAssisted { CatAssist = CatAssistedEnum.ALL, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ALL), Index = 1 },
              new CatAssisted { CatAssist = CatAssistedEnum.ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ASSISTED), Index = 2 },
              new CatAssisted { CatAssist = CatAssistedEnum.NON_ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.NON_ASSISTED).Replace('_', '-'), Index = 3 }
             );

            context.CatNoOfTx.AddOrUpdate(
              p => p.CatTx,
              new CatNoOfTx { CatTx = CatNoOfIxEnum.ALL, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.ALL), Index = 1 },
               new CatNoOfTx { CatTx = CatNoOfIxEnum.ONE, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.ONE), Index = 2 },
              new CatNoOfTx { CatTx = CatNoOfIxEnum.TWO, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.TWO), Index = 3 },
              new CatNoOfTx { CatTx = CatNoOfIxEnum.UNLIMITED, CatNoOfTxName = Enum.GetName(typeof(CatNoOfIxEnum), CatNoOfIxEnum.UNLIMITED), Index = 4 }
            );

            //alternate methid
            //var courses = new List<Course>
            //{
            //    new Course {CourseID = 1050, Title = "Chemistry",      Credits = 3, },
            //    new Course {CourseID = 4022, Title = "Microeconomics", Credits = 3, },
            //    new Course {CourseID = 4041, Title = "Macroeconomics", Credits = 3, },
            //    new Course {CourseID = 1045, Title = "Calculus",       Credits = 4, },
            //    new Course {CourseID = 3141, Title = "Trigonometry",   Credits = 4, },
            //    new Course {CourseID = 2021, Title = "Composition",    Credits = 3, },
            //    new Course {CourseID = 2042, Title = "Literature",     Credits = 4, }
            //};
            //courses.ForEach(s => context.Courses.AddOrUpdate(p => p.Title, s));
        }
    }
}
