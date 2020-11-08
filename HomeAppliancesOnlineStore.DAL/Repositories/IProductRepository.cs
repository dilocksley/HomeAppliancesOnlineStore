using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public interface IProductRepository
    {
        public DataAgent<long> Add(ProductDto input);
        public DataAgent<ProductDto> DeleteProduct(long Id);
        public DataAgent<long> AddProductToStore(ProductStoreDto productInStore);
        public DataAgent<int> DeleteProductFromStore(long productId);
        public DataAgent<List<ProductStoreDto>> GetAvailabilityOfProductInStore(ProductStoreDto productInStore);
        public DataAgent<int> ChangeProductQuantityInStore(ProductStoreDto productQuantityInStore);
        public DataAgent<List<ProductDto>> FindProducts(ProductSearchDto input);
        public DataAgent<long> Update(ProductDto input);
    }
}
