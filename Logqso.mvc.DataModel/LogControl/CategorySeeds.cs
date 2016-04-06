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
                  new CatOperator { CatOperatorEnum = CatOperatorEnum.ALL, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.ALL), Index = 1 },
                   new CatOperator { CatOperatorEnum = CatOperatorEnum.SINGLE_OP, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP).Replace('_', '-'), Index = 2 },
                   new CatOperator { CatOperatorEnum = CatOperatorEnum.MULTI_OP, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.MULTI_OP).Replace('_', '-'), Index = 3 },
                // new CatOperator { CatOperatorEnum = CatOperatorEnum.SINGLE_OP_CLASSIC, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP_CLASSIC), Index = 4 },
                //new CatOperator { CatOperatorEnum = CatOperatorEnum.SINGLE_OP_ROOKIE, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.SINGLE_OP_ROOKIE), Index = 5 },
                 new CatOperator { CatOperatorEnum = CatOperatorEnum.CHECKLOG, CatOprName = Enum.GetName(typeof(CatOperatorEnum), CatOperatorEnum.CHECKLOG), Index = 4 }
              );

            context.CatBand.AddOrUpdate(
                  p => p.CatBandName,
                  new CatBand { CatBandEnum = CatBandEnum.ALL, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum.ALL), Index = 1 },
                   new CatBand { CatBandEnum = CatBandEnum._160M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._160M).Replace("_", ""), Index = 2 },
                   new CatBand { CatBandEnum = CatBandEnum._80M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._80M).Replace("_", ""), Index = 3 },
                  new CatBand { CatBandEnum = CatBandEnum._40M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._40M).Replace("_", ""), Index = 4 },
                   new CatBand { CatBandEnum = CatBandEnum._20M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._20M).Replace("_", ""), Index = 5 },
                  new CatBand { CatBandEnum = CatBandEnum._15M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._15M).Replace("_", ""), Index = 6 },
                  new CatBand { CatBandEnum = CatBandEnum._10M, CatBandName = Enum.GetName(typeof(CatBandEnum), CatBandEnum._10M).Replace("_", ""), Index = 7 }
             );

            context.CatPower.AddOrUpdate(
              p => p.CatPowerName,
              new CatPower { CatPowerEnum = CatPowerEnum.ALL, CatPowerName = Enum.GetName(typeof(CatPowerEnum), CatPowerEnum.ALL), Index = 1 },
               new CatPower { CatPowerEnum = CatPowerEnum.HIGH, CatPowerName = Enum.GetName(typeof(CatPowerEnum), CatPowerEnum.HIGH), Index = 2 },
              new CatPower { CatPowerEnum = CatPowerEnum.LOW, CatPowerName = Enum.GetName(typeof(CatPowerEnum), CatPowerEnum.LOW), Index = 3 },
              new CatPower { CatPowerEnum = CatPowerEnum.QRP, CatPowerName = Enum.GetName(typeof(CatPowerEnum), CatPowerEnum.QRP), Index = 4 }
             );

            context.CatAssisted.AddOrUpdate(
              p => p.CatAssistedName,
              new CatAssisted { CatAssistedEnum = CatAssistedEnum.ALL, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ALL), Index = 1 },
              new CatAssisted { CatAssistedEnum = CatAssistedEnum.ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.ASSISTED), Index = 2 },
              new CatAssisted { CatAssistedEnum = CatAssistedEnum.NON_ASSISTED, CatAssistedName = Enum.GetName(typeof(CatAssistedEnum), CatAssistedEnum.NON_ASSISTED).Replace('_', '-'), Index = 3 }
             );

            context.CatNoOfTx.AddOrUpdate(
              p => p.CatNoOfTxEnum,
              new CatNoOfTx { CatNoOfTxEnum = CatNoOfTxEnum.ALL, CatNoOfTxName = Enum.GetName(typeof(CatNoOfTxEnum), CatNoOfTxEnum.ALL), Index = 1 },
               new CatNoOfTx { CatNoOfTxEnum = CatNoOfTxEnum.ONE, CatNoOfTxName = Enum.GetName(typeof(CatNoOfTxEnum), CatNoOfTxEnum.ONE), Index = 2 },
              new CatNoOfTx { CatNoOfTxEnum = CatNoOfTxEnum.TWO, CatNoOfTxName = Enum.GetName(typeof(CatNoOfTxEnum), CatNoOfTxEnum.TWO), Index = 3 },
              new CatNoOfTx { CatNoOfTxEnum = CatNoOfTxEnum.UNLIMITED, CatNoOfTxName = Enum.GetName(typeof(CatNoOfTxEnum), CatNoOfTxEnum.UNLIMITED), Index = 4 }
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
