using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using mybooklibrary.Presentation.Models;

namespace mybooklibrary.Presentation.Controllers{
    public class HomeController : Controller{
        public IActionResult Index(){
            
            return View();
        }
        public IActionResult Book(){
            return View();
        }
        public IActionResult Cart(){
            return View();
        }
    }
}