using System.ComponentModel.DataAnnotations.Schema;



namespace Infrastructure
{
    public abstract class Entity : IObjectState
    {
        [NotMapped]
        public ObjectState ObjectState { get; set; }
    }
}