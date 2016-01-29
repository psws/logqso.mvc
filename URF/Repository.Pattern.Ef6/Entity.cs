using System.ComponentModel.DataAnnotations.Schema;
using Infrastructure;

namespace Repository.Pattern.Ef6
{
    public abstract class Entity : IObjectState
    {
        [NotMapped]
        public ObjectState ObjectState { get; set; }
    }
}