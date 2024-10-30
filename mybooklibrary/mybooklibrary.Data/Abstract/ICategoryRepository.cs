using System.Collections.Generic;
using mybooklibrary.Entities;

namespace mybooklibrary.Data.Abstract
{
    public interface ICategoryRepository: IRepository<Category>
    {
        Category GetByIdWithProducts(int categoryId);

        void DeleteFromCategory(int productId,int categoryId);
    }
}