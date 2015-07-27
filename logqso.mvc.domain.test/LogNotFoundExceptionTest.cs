using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using Logqso.mvc.Exceptions;
using Logqso.mvc.common;

namespace logqso.mvc.domain.test
{
    [TestClass]
    public class LogNotFoundExceptionTest
    {
         //private Guid guid;
         private int LogId;

         [TestInitialize]
         public void initialize()
         {
             //initialixe serves as the composition root
             //guid = Guid.NewGuid();
             LogId = 1;
         }

         [TestMethod]
         public void LogNotFoundException_DefaultConstructor_ValidException()
         {

             //arrange
             bool caught = false;
             LogNotFoundException e = new LogNotFoundException();
             e.LogID = LogId;

             try
             {
                 throw e;
             }
             catch (LogNotFoundException ex)
             {
                 Assert.IsTrue(ex.LogID == LogId);
                 Assert.IsTrue(ex.InnerException == null);
                 Assert.IsTrue(ex.Message.Length > 0);
                 Assert.IsTrue(ex.Source.Length > 0);
                 Assert.IsTrue(ex.StackTrace.Length > 0);
                 Assert.IsTrue(ex.TargetSite.Module.Name.Length > 0);
                 Assert.IsTrue(ex.TargetSite.Name.Length > 0);
                 caught = true;
             }

             Assert.IsTrue(caught);
         }

         [TestMethod]
         public void LogNotFoundException_MessageConstructor_ValidException()
         {

             //arrange
             bool caught = false;
             var message1 = StringOps.GetRandomString(60);
             LogNotFoundException e = new LogNotFoundException(message1);
             e.LogID = LogId;

             try
             {
                 throw e;
             }
             catch (LogNotFoundException ex)
             {
                 Assert.IsTrue(ex.Message.Contains(message1));
                 Assert.IsTrue(ex.LogID == LogId);
                 Assert.IsTrue(ex.InnerException == null);
                 Assert.IsTrue(ex.Message.Length > 0);
                 Assert.IsTrue(ex.Source.Length > 0);
                 Assert.IsTrue(ex.StackTrace.Length > 0);
                 Assert.IsTrue(ex.TargetSite.Module.Name.Length > 0);
                 Assert.IsTrue(ex.TargetSite.Name.Length > 0);
                 caught = true;
             }

             Assert.IsTrue(caught);
         }


         [TestMethod]
         public void LogNotFoundException_InnerExceptionr_ValidException()
         {
             bool caught = false;
             var message1 = StringOps.GetRandomString(60);
             var message2 = StringOps.GetRandomString(60);
             LogNotFoundException e2 = new LogNotFoundException(message2);
             e2.LogID = LogId;
            LogNotFoundException e = new LogNotFoundException(message1,e2);
            e.LogID = LogId;

             try
            {
                throw e;
            }
            catch (LogNotFoundException ex)
            {
                Assert.IsTrue(ex.Message.Contains(message1));
                Assert.IsTrue(ex.LogID == LogId);
                Assert.IsTrue(ex.InnerException != null);
                Assert.IsTrue(ex.InnerException.Message.Contains(message2));
                Assert.IsTrue(((LogNotFoundException)(ex.InnerException)).LogID == LogId);
                Assert.IsTrue(((LogNotFoundException)(ex.InnerException)).InnerException == null);

                Assert.IsTrue(ex.Message.Length > 0);
                Assert.IsTrue(ex.Source.Length > 0);
                Assert.IsTrue(ex.StackTrace.Length > 0);
                Assert.IsTrue(ex.TargetSite.Module.Name.Length > 0);
                Assert.IsTrue(ex.TargetSite.Name.Length > 0);
                Assert.IsTrue(ex.InnerException != null);
                caught = true;
            }

            Assert.IsTrue(caught);
         }
         
        
        [TestMethod]
         public void LogNotFoundException_Serialization_ValidLogID()
        {
            //http://blog.gurock.com/articles/creating-custom-exceptions-in-dotnet/
            LogNotFoundException e = new LogNotFoundException();
            e.LogID = LogId;

            using (Stream s = new MemoryStream())
            {
                BinaryFormatter formatter = new BinaryFormatter();
                formatter.Serialize(s, e);
                s.Position = 0; // Reset stream position
                e = (LogNotFoundException)formatter.Deserialize(s);
            }

            Assert.AreEqual<int>(e.LogID, LogId);
        }


    }
}
