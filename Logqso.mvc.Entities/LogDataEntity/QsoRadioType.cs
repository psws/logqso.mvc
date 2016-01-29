using System;
using System.Collections.Generic;
using Infrastructure;



namespace Logqso.mvc.Entities.LogDataEntity
{
    public partial class QsoRadioType : Entity
    {
        public QsoRadioType()
        {
            this.Qsoes = new List<Qso>();
        }

        public int QsoRadioTypeEnum { get; set; }
        public string QsoRadioTypeName { get; set; }
        public virtual ICollection<Qso> Qsoes { get; set; }
    }
}
