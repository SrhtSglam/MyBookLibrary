using System.Collections.Generic;
using System.Linq;
using mybooklibrary.Entities;

namespace mybooklibrary.Presentation.Models
{
    public class OrderModel
    {
        public int OrderId { get; set; }
        public List<OrderItemModel> OrderItems { get; set; }

        public double TotalPrice()
        {
            return OrderItems.Sum(i=>i.Price*i.Quantity);
        }

        DateTime date;

        public DateTime Date()
        {
            foreach(var items in OrderItems){
                date = items.Date; 
            }
            return date;
        }
    }

    public class OrderItemModel 
    {
        public int OrderItemId { get; set; }
        public int ProductId { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public string ImageUrl { get; set; }
        public int Quantity { get; set; }
        public DateTime Date {get; set;}
        public double ShipmentPrice { get; set; }
    }


}