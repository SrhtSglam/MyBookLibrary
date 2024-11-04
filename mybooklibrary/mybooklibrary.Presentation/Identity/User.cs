using Microsoft.AspNetCore.Identity;
using mybooklibrary.Entities;

namespace mybooklibrary.Presentation.Identity
{
    public class User: IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}