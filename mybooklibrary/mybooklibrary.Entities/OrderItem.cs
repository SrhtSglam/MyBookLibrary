namespace mybooklibrary.Entities
{
    public class OrderItem
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public Product Product { get; set;}
        public int OrderId { get; set; }
        public Order Order {get; set;} 
        public double Price {get; set;}
        public int Quantity {get; set;}
    }

    // public enum OrderStatus{
    //     Waiting = 0,
    //     Inpaid = 1,
    //     Complated = 2

    // }
}