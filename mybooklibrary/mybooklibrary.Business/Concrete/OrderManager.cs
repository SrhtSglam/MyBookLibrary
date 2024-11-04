// using mybooklibrary.Business.Abstract;
// using mybooklibrary.Data.Abstract;
// using mybooklibrary.Entities;

// namespace mybooklibrary.Business.Concrete
// {
//     public class OrderManager : IOrderService
//     {
//         private IOrderRepository _orderRepository;
//         public OrderManager(IOrderRepository orderRepository)
//         {
//             _orderRepository = orderRepository;
//         }

//         public void AddToOrder(string userId, int productId, int quantity)
//         {
//             var order = GetOrderByUserId(userId);

//             if(order!=null)
//             {
//                 // eklenmek isteyen ürün sepette varmı (güncelleme)
//                 // eklenmek isteyen ürün sepette var ve yeni kayıt oluştur. (kayıt ekleme)

//                 var index = order.OrderItems.FindIndex(i=>i.ProductId==productId);                
//                 if(index<0)
//                 {
//                     order.OrderItems.Add(new OrderItem(){
//                         ProductId = productId,
//                         Quantity = quantity,
//                         OrderId = order.Id
//                     });
//                 }
//                 else{
//                     order.OrderItems[index].Quantity += quantity;
//                 }

//                 _orderRepository.Update(order);

//             }
//         }

//         public void DeleteFromOrder(string userId, int productId)
//         {
//             var cart = GetOrderByUserId(userId);
//             if(cart!=null)
//             {
//                 _orderRepository.DeleteFromCart(cart.Id,productId);
//             }   
//         }

//         public Cart GetOrderByUserId(string userId)
//         {
//             return _orderRepository.GetByUserId(userId);
//         }

//         public void InitializeOrder(string userId)
//         {
//             _orderRepository.Create(new Cart(){UserId = userId});
//         }
//     }
// }