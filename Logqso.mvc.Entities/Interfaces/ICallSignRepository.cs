﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logqso.mvc.DataModel;

namespace Logqso.mvc.Entities.Interfaces
{
    public interface ICallSignRepository
    {
        CallSign  GetCallSignID(string Call);
    }
}
