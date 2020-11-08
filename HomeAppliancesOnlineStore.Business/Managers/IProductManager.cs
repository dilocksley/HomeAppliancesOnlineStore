using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public interface IProductManager
    {
        public DataAgent<long> AddProduct(ProductInputModel productInputModel);
        public DataAgent<long> UpdateProductInfo(ProductInputModel productInputModel);
        public DataAgent<ProductOutputModel> DeleteProduct(long Id);
        public DataAgent<long> AddProductToStore(ProductInStoreInputModel productInStore);
        public DataAgent<List<ProductInStoreOutputModel>> GetAvailabilityOfProductInStore(ProductInStoreInputModel productInStore);
        public DataAgent<int> ChangeProductQuantityInStore(ProductInStoreInputModel productQuantityInStore);
        public DataAgent<List<ProductOutputModel>> FindProducts(ProductSearchInputModel productSearchInputModel);
        public DataAgent<List<ProductOutputModel>> GetProductsOfOneCategory(int productCategory);
    }
}
