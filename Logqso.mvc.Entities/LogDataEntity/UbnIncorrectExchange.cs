using System;
using System.Collections.Generic;
using Infrastructure;

namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class UbnIncorrectExchange : Entity
    {
        public short QsoNo { get; set; }
        public int LogId { get; set; }
        public string CorrectExchange { get; set; }
    }
}
