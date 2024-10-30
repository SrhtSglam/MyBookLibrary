using System;
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using mybooklibrary.Business.Abstract;
using mybooklibrary.Business.Concrete;
using mybooklibrary.Data.Abstract;
using mybooklibrary.Data.Concrete.EfCore;
using mybooklibrary.Presentation.EmailServices;
using mybooklibrary.Presentation.Identity;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<ApplicationContext>(options => options.UseSqlite("Data Source=shopDb"));
builder.Services.AddIdentity<User, IdentityRole>()
    .AddEntityFrameworkStores<ApplicationContext>()
    .AddDefaultTokenProviders();

// Configure Identity options
builder.Services.Configure<IdentityOptions>(options =>
{
    options.Password.RequireDigit = true;
    options.Password.RequireLowercase = true;
    options.Password.RequireUppercase = true;
    options.Password.RequiredLength = 6;
    options.Password.RequireNonAlphanumeric = true;

    options.Lockout.MaxFailedAccessAttempts = 5;
    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5);
    options.Lockout.AllowedForNewUsers = true;

    options.User.RequireUniqueEmail = true;
    options.SignIn.RequireConfirmedEmail = true;
    options.SignIn.RequireConfirmedPhoneNumber = false;
});

// Configure application cookie
builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = "/account/login";
    options.LogoutPath = "/account/logout";
    options.AccessDeniedPath = "/account/accessdenied";
    options.SlidingExpiration = true;
    options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    options.Cookie = new CookieBuilder
    {
        HttpOnly = true,
        Name = ".MyBookLibrary.Security.Cookie",
        SameSite = SameSiteMode.Strict
    };
});

// Add services for repositories and managers
builder.Services.AddScoped<ICategoryRepository, EfCoreCategoryRepository>();
builder.Services.AddScoped<IProductRepository, EfCoreProductRepository>();
builder.Services.AddScoped<ICartRepository, EfCoreCartRepository>();

builder.Services.AddScoped<IProductService, ProductManager>();
builder.Services.AddScoped<ICategoryService, CategoryManager>();
builder.Services.AddScoped<ICartService, CartManager>();

builder.Services.AddScoped<IEmailSender, SmtpEmailSender>(i =>
    new SmtpEmailSender(
        builder.Configuration["EmailSender:Host"],
        builder.Configuration.GetValue<int>("EmailSender:Port"),
        builder.Configuration.GetValue<bool>("EmailSender:EnableSSL"),
        builder.Configuration["EmailSender:UserName"],
        builder.Configuration["EmailSender:Password"]));

// Add MVC services
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    SeedDatabase.Seed();
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

// Static file options for node_modules
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
        Path.Combine(Directory.GetCurrentDirectory(), "node_modules")),
    RequestPath = "/modules"
});

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();

// Define routes
app.MapControllerRoute(
    name: "cart",
    pattern: "cart",
    defaults: new { controller = "Cart", action = "Index" }
);

app.MapControllerRoute(
    name: "accountmanage",
    pattern: "account/manage",
    defaults: new { controller = "Account", action = "Manage" }
);

app.MapControllerRoute(
    name: "adminuseredit",
    pattern: "admin/user/{id?}",
    defaults: new { controller = "Admin", action = "UserEdit" }
);

app.MapControllerRoute(
    name: "adminusers",
    pattern: "admin/user/list",
    defaults: new { controller = "Admin", action = "UserList" }
);

app.MapControllerRoute(
    name: "adminroles",
    pattern: "admin/role/list",
    defaults: new { controller = "Admin", action = "RoleList" }
);

app.MapControllerRoute(
    name: "adminrolecreate",
    pattern: "admin/role/create",
    defaults: new { controller = "Admin", action = "RoleCreate" }
);

app.MapControllerRoute(
    name: "adminroleedit",
    pattern: "admin/role/{id?}",
    defaults: new { controller = "Admin", action = "RoleEdit" }
);

app.MapControllerRoute(
    name: "adminproducts",
    pattern: "admin/products",
    defaults: new { controller = "Admin", action = "ProductList" }
);

app.MapControllerRoute(
    name: "adminproductcreate",
    pattern: "admin/products/create",
    defaults: new { controller = "Admin", action = "ProductCreate" }
);

app.MapControllerRoute(
    name: "adminproductedit",
    pattern: "admin/products/{id?}",
    defaults: new { controller = "Admin", action = "ProductEdit" }
);

app.MapControllerRoute(
    name: "admincategories",
    pattern: "admin/categories",
    defaults: new { controller = "Admin", action = "CategoryList" }
);

app.MapControllerRoute(
    name: "admincategorycreate",
    pattern: "admin/categories/create",
    defaults: new { controller = "Admin", action = "CategoryCreate" }
);

app.MapControllerRoute(
    name: "admincategoryedit",
    pattern: "admin/categories/{id?}",
    defaults: new { controller = "Admin", action = "CategoryEdit" }
);

// localhost/search
app.MapControllerRoute(
    name: "search",
    pattern: "search",
    defaults: new { controller = "Shop", action = "search" }
);

app.MapControllerRoute(
    name: "productdetails",
    pattern: "{url}",
    defaults: new { controller = "Shop", action = "details" }
);

app.MapControllerRoute(
    name: "products",
    pattern: "products/{category?}",
    defaults: new { controller = "Shop", action = "list" }
);

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}"
);

// Seed identity data
using (var scope = app.Services.CreateScope())
{
    var userManager = scope.ServiceProvider.GetRequiredService<UserManager<User>>();
    var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<IdentityRole>>();
    var configuration = app.Configuration;
    SeedIdentity.Seed(userManager, roleManager, configuration).Wait();
}

app.Run();
