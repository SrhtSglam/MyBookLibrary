using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using mybooklibrary.Presentation.Models;

namespace mybooklibrary.Presentation.Controllers{
    public class UserController : Controller{
        public IActionResult Index(){
            return View();
        }

        public IActionResult Privacy(){
            return View();
        }
    }
}
