using System.Collections.Generic;
using mybooklibrary.Entities;

namespace mybooklibrary.Business.Abstract
{
    public interface ICategoryService: IValidator<Category>
    {
        Category GetById(int id);

        Category GetByIdWithProducts(int categoryId);

        List<Category> GetAll();

        void Create(Category entity);

        void Update(Category entity);
        void Delete(Category entity);
        void DeleteFromCategory(int productId,int categoryId);
    }
}