using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using Microsoft.Extensions.FileProviders;
using System.Runtime.InteropServices;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.VisualBasic;
using mybooklibrary.Entities;
using System.Diagnostics;

namespace mybooklibrary.Data.Concrete.EfCore
{
    public class ShopContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Cart> Cart { get; set; }
        // public DbSet<Order> Order { get; set; }
        public DbSet<CartItem> CartItems { get; set; }
        public DbSet<Orders> Orders { get; set; }
        public DbSet<OrderItem> OrderItems { get; set; }
        
        // private string _configurationString;

        //    public ShopContext(IConfiguration configuration)
        //     {
        //         _configuration = configuration;
        //     }

    //     public ShopContext(string connectionString)
    // {
    //     _configurationString = connectionString;
    // }

        // protected string JSONData(IConfiguration configuration){
        //     _configuration = configuration;
        //     return _configuration.GetConnectionString("Default");
        // }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // optionsBuilder.UseSqlite("Data Source=shopDb");
            // optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=shopDb;User Id=sa;Password=Abc123+;TrustServerCertificate=true");
            //  string connectionString = _configuration.GetConnectionString("Default");
            //  optionsBuilder.UseSqlServer(connectionString);
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();
            var dbtypenum = configuration.GetSection("DatabaseSettings:DbTypeNum").Value;
            if (dbtypenum == "1")
                optionsBuilder.UseSqlServer(configuration.GetConnectionString("Default"));
            else if (dbtypenum == "2")
                optionsBuilder.UseSqlite(configuration.GetConnectionString("Sqlite"));
            else{
                Console.WriteLine("Hata");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductCategory>()
                .HasKey(c => new { c.CategoryId, c.ProductId });

            // modelBuilder.Entity<Product>();
            // modelBuilder.Entity<Category>();
            // modelBuilder.Entity<Cart>();
            // modelBuilder.Entity<Order>();
            // modelBuilder.Entity<CartItem>();

            base.OnModelCreating(modelBuilder);
        }


    }
}