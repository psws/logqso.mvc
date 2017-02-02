#region

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Diagnostics;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.VisualStudio.TestTools.UnitTesting;

#endregion

namespace   Logqso.mvc.domain.test.IntegrationTests
{
    public static class Utility
    {
        public static void CreateSeededTestDatabase(string connectionDB, string pathsql)
        {
            //connection string comes from  app.config
            var connectionString = ConfigurationManager.ConnectionStrings[connectionDB].ConnectionString;

            var path = Environment.CurrentDirectory.Replace("bin\\Debug", pathsql);
            var file = new FileInfo(path);
            var script = file.OpenText().ReadToEnd();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlConnection.ClearPool(connection); //clears SSMS connection
                var server = new Server(new ServerConnection(connection));

                try
                {
                    server.ConnectionContext.ExecuteNonQuery(script);
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(string.Format("UpdateQsoStations() exception {0}", ex.Message)); 
                    connection.Dispose();
                    throw;
                }
            }
        }
        //public void CloseAllSQLConnections(string Connection)()
        //{
        //      using(var comm = new SqlConnection(Connection))
        //      using(var comExecuteInsert = new SqlCommand())
        //      {
        //        comExecuteInsert.Connection = comm;
        //        comExecuteInsert.CommandType = CommandType.StoredProcedure;
        //        comExecuteInsert.CommandText = strProcedureName;
        //        comExecuteInsert.ExecuteScalar();
        //        comExecuteInsert.Parameters.Clear();
        //        comm.Close();
        //      }    

        //        SqlConnection.ClearAllPools();
        //}



    }
}