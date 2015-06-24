using System;
using System.IO;

using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logqso.mvc.common
{
    public class StringOps
    {
        public static string GetRandomString(int length)
        {
            string StrReturn = string.Empty;
            while (StrReturn.Length < length)
            {
                string path = Path.GetRandomFileName();
                path = path.Replace(".", ""); // Remove period.
                StrReturn += path;
            }
            StrReturn.Substring(0, length);
            return StrReturn;
        }
    }
}
