using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using mybooklibrary.Business.Abstract;
using mybooklibrary.Data.Abstract;
using mybooklibrary.Presentation.Models;

namespace mybooklibrary.Presentation.Controllers
{
    // localhost:5000/home
    public class HomeController:Controller
    {      
        private IProductService _productService;
        public HomeController(IProductService productService)
        {
            this._productService=productService;
        }
        
        public IActionResult Index()
        {
            var productViewModel = new ProductListViewModel()
            {
                Products = _productService.GetHomePageProducts()
            };

            return View(productViewModel);
        }

        public IActionResult About()
        {
            return View();
        }

         public IActionResult Contact()
        {
            return View("MyView");
        }
    }
}