using System.Collections.Generic;
using mybooklibrary.Entities;

namespace mybooklibrary.Presentation.Models
{
    public class ProductDetailModel
    {
        public Product Product { get; set; }
        public List<Category> Categories { get; set; }
    }
}