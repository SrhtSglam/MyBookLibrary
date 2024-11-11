using System.Linq;
using Microsoft.EntityFrameworkCore;
using mybooklibrary.Data.Abstract;
using mybooklibrary.Entities;

namespace mybooklibrary.Data.Concrete.EfCore
{
    public class EfCoreOrderRepository : EfCoreGenericRepository<Orders, ShopContext>, IOrderRepository
    {
        public void DeleteFromOrder(int orderId, int productId)
        {
           using(var context = new ShopContext())
           {
               var cmd = @"delete from OrderItems where OrderId=@p0 and ProductId=@p1";
               context.Database.ExecuteSqlRaw(cmd,orderId,productId);
           }
        }

        public Orders GetByUserId(string userId)
        {
            using(var context=new ShopContext())
            {
                return context.Orders
                            .Include(i=>i.OrderItems)
                            .ThenInclude(i=>i.Product)
                            .FirstOrDefault(i=>i.UserId==userId);
            }
        }

        public override void Update(Orders entity)
        {
            using (var context = new ShopContext())
            {
               context.Orders.Update(entity);
               context.SaveChanges();
            }
        } 
    }
}