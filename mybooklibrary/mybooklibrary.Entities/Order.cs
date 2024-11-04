namespace mybooklibrary.Entities
{
    public class Order
    {
        public int Id { get; set;}
        public int UserId { get; set; }
        public List<OrderItem> OrderItems { get; set; }
    }

    // public enum OrderStatus{
    //     Waiting = 0,
    //     Inpaid = 1,
    //     Complated = 2

    // }
}