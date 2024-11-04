// using System;
// using System.Linq;
// using Microsoft.AspNetCore.Authorization;
// using Microsoft.AspNetCore.Identity;
// using Microsoft.AspNetCore.Mvc;
// using mybooklibrary.Business.Abstract;
// using mybooklibrary.Entities;
// using mybooklibrary.Presentation.Identity;
// using mybooklibrary.Presentation.Models;

// namespace mybooklibrary.Presentation.Controllers
// {
//     [Authorize]
//     public class OrderController:Controller
//     {
//         private IOrderService _orderService;
//         private UserManager<User> _userManager;
//         public OrderController(IOrderService orderService,UserManager<User> userManager)
//         {
//             _orderService = orderService;
//             _userManager = userManager;
//         }
//         // CartModel model = new CartModel();

//         public IActionResult Index()
//         {
//             var order = _orderService.GetOrderByUserId(_userManager.GetUserId(User));
//             // model.CartId = 0;
//             return View(new OrderModel(){
//                 OrderId = order.Id,
//                 OrderItems = order.OrderItems.Select(i=>new OrderItemModel(){
//                     OrderItemId = i.Id,
//                     ProductId = i.ProductId,
//                     Name = i.Product.Name,
//                     Price = i.Product.Price.Value,
//                     ImageUrl = i.Product.ImageUrl,
//                     Quantity = i.Quantity
//                 }).ToList()
//             });
//             // return View(new CartModel(){
//             //     CartId = cart.Id,
//             //     CartItems = cart.CartItems.Select(i=>new CartItemModel()
//             //     {
//             //         CartItemId = i.Id,
//             //         ProductId = i.ProductId,
//             //         Name = i.Product.Name,
//             //         Price = 0,
//             //         ImageUrl = i.Product.ImageUrl,
//             //         Quantity =i.Quantity

//             //     }).ToList()
//             // });
//         } 

//         [HttpPost]
//         public IActionResult AddToCart(int productId,int quantity)
//         {
//             var userId = _userManager.GetUserId(User);
//             _orderService.AddToOrder(userId,productId,quantity);
//             return RedirectToAction("Index");
//         } 

//         [HttpPost]
//         public IActionResult DeleteFromCart(int productId)
//         {
//              var userId = _userManager.GetUserId(User);
//             _orderService.DeleteFromOrder(userId,productId);
//             return RedirectToAction("Index");
//         }
//     }
// }