namespace mybooklibrary.Entities
{
    public class Orders
    {
        public int Id { get; set;}
        public string UserId { get; set; }
        public List<OrderItem> OrderItems { get; set; }
    }
}