using System;
using System.Collections.Generic;
using mybooklibrary.Entities;

namespace mybooklibrary.Presentation.Models
{
    public class HomeModel{
        public PageInfo PageInfo { get; set; }
        public ProductListViewModel ProductListViewModel { get; set; }
        public CarouselSettings CarouselSettings { get; set; }
    }
}