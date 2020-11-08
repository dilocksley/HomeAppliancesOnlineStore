using AutoMapper;
using HomeAppliancesOnlineStore.Business.Configuration;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Core.Repositories;
using HomeAppliancesOnlineStore.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public class OrderManager : IOrderManager
    {
        private IProductRepository _productRepo;
        private IOrderRepository _orderRepo;
        private IBuyerRepository _buyerRepository;
        private IMapper _mapper;

        public OrderManager(IProductRepository ProductRepository, IMapper mapper, IOrderRepository orderRepo, IBuyerRepository buyerRepository)
        {
            _productRepo = ProductRepository;
            _mapper = mapper;
            _buyerRepository = buyerRepository;
            _orderRepo = orderRepo;
        }
        public DataAgent<long> CreateOrder(OrderInputModel orderInputModel, List<ProductInOrderInputModel> products)
        {
            var orderCreationResult = new DataAgent<long>();
            var productInOrderResult = new DataAgent<long>();

            var availavilityCheck = CheckProductAvailabilityForOrder(products, orderInputModel.StoreId);
            var costCount = CountTotalOrderBalance(products, orderInputModel.BuyerId);
            if (!costCount.ContainsData)
            {
                return new DataAgent<long> { ResponseMessage = costCount.ResponseMessage };
            }
            if (availavilityCheck.ContainsData)
            {
                var dto = _mapper.Map<OrderDto>(orderInputModel);
                dto.TotalAmount = costCount.Data;
                orderCreationResult = _orderRepo.Add(dto);
                if (orderCreationResult.ContainsData)
                {
                    foreach (var product in products)
                    {
                        var productOrderDto = _mapper.Map<ProductOrderDto>(product);
                        productOrderDto.OrderId = orderCreationResult.Data;
                        productInOrderResult = _orderRepo.ProductInOrderCreate(productOrderDto);
                        if (!productInOrderResult.ContainsData)
                        {
                            dto.OrderStatus.Id = (int)OrderStatus.Cancelled;
                            _orderRepo.Update(dto);
                            return productInOrderResult;
                        }
                    }
                }
            }
            return orderCreationResult;
        }

        private DataAgent<List<ProductStoreDto>> CheckProductAvailabilityForOrder(List<ProductInOrderInputModel> products, int storeid)
        {
            var availavilityCheck = new DataAgent<List<ProductStoreDto>>();
            foreach (var product in products)
            {
                availavilityCheck = _productRepo.GetAvailabilityOfProductInStore(
                    new ProductStoreDto() { ProductId = product.ProductId, StoreId = storeid });
                if (availavilityCheck.ContainsData)
                {
                    if (availavilityCheck.Data[0].Quantity < product.Quantity)
                    {
                        return new DataAgent<List<ProductStoreDto>>
                        {
                            ResponseMessage
                            = $"{nameof(product.ProductId)}" + $"{ResponseMessages.NotEnoughAmountInStorageOrderError}"
                        };
                    }
                }
            }
            return availavilityCheck;
        }

        private DataAgent<decimal> CountTotalOrderBalance(List<ProductInOrderInputModel> products, long buyerId)
        {
            decimal totalCost = 0;

            var productSearchResult = new DataAgent<List<ProductDto>>();
            foreach (var product in products)
            {
                productSearchResult = _productRepo.FindProducts(new ProductSearchDto { Id = product.ProductId });
                if (!productSearchResult.ContainsData)
                {
                    return new DataAgent<decimal> { ResponseMessage = productSearchResult.ResponseMessage };
                }
                totalCost += (decimal)productSearchResult.Data[0].Price;
            }
            var buyerDto = _buyerRepository.GetBuyer(buyerId);
            if (!buyerDto.ContainsData)
            {
                return new DataAgent<decimal> { ResponseMessage = buyerDto.ResponseMessage };
            }
            totalCost = totalCost - ((totalCost / 100) * (buyerDto.Data.BuyerStatus.Dicscount));

            return new DataAgent<decimal> { Data = totalCost };
        }



        public DataAgent<OrderOutputModel> GetOrder(long orderId)
        {
            throw new NotImplementedException();
        }

        public DataAgent<List<OrderOutputModel>> GetOrdersByStatus(int orderStatusId)
        {
            throw new NotImplementedException();
        }

        public DataAgent<long> UpdateOrder(OrderInputModel orderInputModel)
        {
            throw new NotImplementedException();
        }
    }
}
