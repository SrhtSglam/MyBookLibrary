using Microsoft.EntityFrameworkCore;
using mybooklibrary.Entities;

namespace mybooklibrary.Data.Concrete.EfCore
{
    public class ShopContext : DbContext
    {
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Cart> Cart { get; set; }
        // public DbSet<Order> Order { get; set; }
        public DbSet<CartItem> CartItems { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // optionsBuilder.UseSqlite("Data Source=shopDb");
            optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=shopDb;User Id=sa;Password=Abc123+;TrustServerCertificate=true");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductCategory>()
                .HasKey(c => new { c.CategoryId, c.ProductId });

            // modelBuilder.Entity<Product>();
            // modelBuilder.Entity<Category>();
            // modelBuilder.Entity<Cart>();
            // // modelBuilder.Entity<Order>();
            // modelBuilder.Entity<CartItem>();
        }


    }
}