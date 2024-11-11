using mybooklibrary.Entities;

namespace mybooklibrary.Business.Abstract
{
    public interface IOrderService
    {
        void InitializeOrder(string userId);
        Orders GetOrderByUserId(string userId);
        void AddToOrder(string userId,int productId,int quantity, double price, DateTime date, double shipmentPrice);
        void DeleteFromOrder(string userId, int productId);
    }
}