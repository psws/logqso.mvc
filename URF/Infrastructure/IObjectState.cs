﻿
using System.ComponentModel.DataAnnotations.Schema;

namespace Infrastructure
{
    public interface IObjectState
    {
        [NotMapped]
        ObjectState ObjectState { get; set; }
    }
}