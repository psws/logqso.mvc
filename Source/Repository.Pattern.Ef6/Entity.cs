using System.ComponentModel.DataAnnotations.Schema;
using Repository.Pattern.Infrastructure;
using Logqso.mvc.common.Infrastructure;

namespace Repository.Pattern.Ef6
{
    public abstract class Entity : IObjectState
    {
        [NotMapped]
        public ObjectState ObjectState { get; set; }
    }
}