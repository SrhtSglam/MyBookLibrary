using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Localization;
using Microsoft.AspNetCore.Mvc;
using mybooklibrary.Business.Abstract;
using mybooklibrary.Data.Abstract;
using mybooklibrary.Presentation.Models;
using mybooklibrary.Presentation.Services;

namespace mybooklibrary.Presentation.Controllers
{
    // localhost:5000/home
    public class HomeController : Controller
    {
        private readonly IProductService _productService;
        private readonly LanguageService _localization;
        public string currentCulture;

        public HomeController(IProductService productService, LanguageService localization)
        {
            _productService = productService;
            _localization = localization;
        }

        public IActionResult Index()
        {
            // CurrentCulture'a göre localized metin al
            currentCulture = Thread.CurrentThread.CurrentCulture.Name;
            // ViewBag.Welcome = _localization.GetKey("greeting", currentCulture); //Test kodudur.

            var productViewModel = new ProductListViewModel
            {
                Products = _productService.GetHomePageProducts()
            };

            return View(productViewModel);
        }

        public IActionResult ChangeLanguage(string culture)
        {
            Response.Cookies.Append(CookieRequestCultureProvider.DefaultCookieName,
                CookieRequestCultureProvider.MakeCookieValue(new RequestCulture(culture)),
                new CookieOptions { Expires = DateTimeOffset.UtcNow.AddYears(1) });

            return Redirect(Request.Headers["Referer"].ToString());
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Contact()
        {
            ViewBag.ContactTitle = _localization.GetKey("contact", Thread.CurrentThread.CurrentCulture.Name);
            return View();
        }
    }

}