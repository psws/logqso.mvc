using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.Repository
{
    public static class DbParameterExtensions
    {
        public static void AddParameterWithValue(this DbCommand command, string parameterName, DbType DbType, object parameterValue)
        {
            var parameter = command.CreateParameter();
            parameter.ParameterName = parameterName;
            parameter.Value = parameterValue;
            command.Parameters.Add(parameter);
        }

    }
}
