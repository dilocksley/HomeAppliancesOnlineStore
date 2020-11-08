using AutoMapper;
using HomeAppliancesOnlineStore.Business.Configuration;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public class ProductManager : IProductManager
    {
        private IProductRepository _productRepo;
        private IMapper _mapper;
        private ICategoryManager _categoryManager;

        public ProductManager(IProductRepository repository, IMapper mapper, ICategoryManager categoryManager)
        {
            _productRepo = repository;
            _mapper = mapper;
            _categoryManager = categoryManager;
        }
        public DataAgent<long> AddProduct(ProductInputModel productInputModel)
        {
            var dto = _mapper.Map<ProductDto>(productInputModel);
            var result = _productRepo.Add(dto);
            return new DataAgent<long>
            {
                Data = result.Data,
                ResponseMessage = result.ResponseMessage
            };
        }

        public DataAgent<long> AddProductToStore(ProductInStoreInputModel productInStore)
        {
            var dto = _mapper.Map<ProductStoreDto>(productInStore);
            var result = _productRepo.AddProductToStore(dto);
            if (result.ContainsData)
            {
                //Добавить проверку на статус публикации товаара
                var productUpdate = _productRepo.Update(new ProductDto
                {
                    Id = productInStore.ProductId,
                    IsPublished = true
                });
                if (!productUpdate.ContainsData)
                {
                    return new DataAgent<long>
                    {
                        Data = productUpdate.Data,
                        ResponseMessage = productUpdate.ResponseMessage
                    };
                }
            }
            return new DataAgent<long>
            {
                Data = result.Data,
                ResponseMessage = result.ResponseMessage
            };
        }

        public DataAgent<ProductOutputModel> DeleteProduct(long productId)
        {
            var dto = _productRepo.DeleteProduct(productId);
            var result = new ProductOutputModel();
            if (dto.ContainsData)
            {
                result = _mapper.Map<ProductOutputModel>(dto.Data);
                var productInStoresDeleted = _productRepo.DeleteProductFromStore(productId);
                if (!productInStoresDeleted.ContainsData)
                {
                    return new DataAgent<ProductOutputModel> { ResponseMessage = productInStoresDeleted.ResponseMessage };
                }
            }
            return new DataAgent<ProductOutputModel> { Data = result, ResponseMessage = dto.ResponseMessage };

        }
        public DataAgent<long> UpdateProductInfo(ProductInputModel productInputModel)
        {
            var dto = _mapper.Map<ProductDto>(productInputModel);
            var result = _productRepo.Update(dto);
            return new DataAgent<long>
            {
                Data = result.Data,
                ResponseMessage = result.ResponseMessage
            };
        }

        public DataAgent<List<ProductInStoreOutputModel>> GetAvailabilityOfProductInStore(ProductInStoreInputModel productInStore)
        {
            var dto = _mapper.Map<ProductStoreDto>(productInStore);
            var availability = _productRepo.GetAvailabilityOfProductInStore(dto);
            var result = new List<ProductInStoreOutputModel>();
            if (availability.ContainsData)
            {
                result = _mapper.Map<List<ProductInStoreOutputModel>>(availability.Data);
            }
            return new DataAgent<List<ProductInStoreOutputModel>> { Data = result, ResponseMessage = availability.ResponseMessage };
        }

        public DataAgent<int> ChangeProductQuantityInStore(ProductInStoreInputModel productQuantityInStore)
        {
            var dto = _mapper.Map<ProductStoreDto>(productQuantityInStore);
            var result = _productRepo.ChangeProductQuantityInStore(dto);
            return new DataAgent<int> { Data = result.Data, ResponseMessage = result.ResponseMessage };
        }

        public DataAgent<List<ProductOutputModel>> FindProducts(ProductSearchInputModel productSearchInputModel)
        {
            var dto = _mapper.Map<ProductSearchDto>(productSearchInputModel);
            var searchResult = _productRepo.FindProducts(dto);
            var result = new List<ProductOutputModel>();
            if (searchResult.ContainsData)
            {
                foreach(ProductDto product in searchResult.Data)
                {
                    result.Add(_mapper.Map<ProductOutputModel>(product));
                }
            }
            return new DataAgent<List<ProductOutputModel>> { Data = result, ResponseMessage = searchResult.ResponseMessage };

        }
        public DataAgent<List<ProductOutputModel>> GetProductsOfOneCategory(int productCategory)
        {
            var result = new List<ProductOutputModel>();
            var allProducts = _productRepo.FindProducts(new ProductSearchDto { IsPublished = true});
            if (allProducts.ContainsData)
            {
                var productsOfOneCategory = _categoryManager.GetAllProductsOfOneCategory(productCategory, allProducts.Data);
                result = _mapper.Map<List<ProductOutputModel>>(productsOfOneCategory);
            }
            return new DataAgent<List<ProductOutputModel>> { Data = result, ResponseMessage = allProducts.ResponseMessage };
        }
    }
}
