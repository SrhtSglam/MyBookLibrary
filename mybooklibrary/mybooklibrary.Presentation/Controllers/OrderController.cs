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
//         // private ICartService _cartService;
//         private UserManager<User> _userManager;
//         public OrderController(UserManager<User> userManager)
//         {
//             // _cartService = cartService;
//             _userManager = userManager;
//         }
//         // CartModel model = new CartModel();

//         public IActionResult Index()
//         {
//             // var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
//             // // model.CartId = 0;
//             // return View(new CartModel(){
//             //     CartId = cart.Id,
//             //     CartItems = cart.CartItems.Select(i=>new CartItemModel(){
//             //         CartItemId = i.Id,
//             //         ProductId = i.ProductId,
//             //         Name = i.Product.Name,
//             //         Price = i.Product.Price.Value,
//             //         ImageUrl = i.Product.ImageUrl,
//             //         Quantity = i.Quantity
//             //     }).ToList()
//             // });
//         } 

//         // [HttpPost]
//         // public IActionResult AddToCart(int productId,int quantity)
//         // {
//         //     var userId = _userManager.GetUserId(User);
//         //     _cartService.AddToCart(userId,productId,quantity);
//         //     return RedirectToAction("Index");
//         // } 

//         // [HttpPost]
//         // public IActionResult DeleteFromCart(int productId)
//         // {
//         //      var userId = _userManager.GetUserId(User);
//         //     _cartService.DeleteFromCart(userId,productId);
//         //     return RedirectToAction("Index");
//         // }

//         // public IActionResult checkout(){
//         //     var cart = _cartService.GetCartByUserId(_userManager.GetUserId(User));
//         //     var orderModel = new OrderModel();
//         //     orderModel.CartModel = new CartModel(){
//         //         CartId = cart.Id,
//         //         CartItems = cart.CartItems.Select(i=>new CartItemModel(){
//         //             CartItemId = i.Id,
//         //             ProductId = i.ProductId,
//         //             Name = i.Product.Name,
//         //             Price = i.Product.Price.Value,
//         //             ImageUrl = i.Product.ImageUrl,
//         //             Quantity = i.Quantity
//         //         }).ToList()
//         //     };

//         //     return View(orderModel);
//         // }
//     }
// }