using mybooklibrary.Entities;

namespace mybooklibrary.Data.Abstract
{
    public interface IOrderRepository: IRepository<Orders>
    {
        Orders GetByUserId(string userId);
        void DeleteFromOrder(int orderId, int productId);
    }
}