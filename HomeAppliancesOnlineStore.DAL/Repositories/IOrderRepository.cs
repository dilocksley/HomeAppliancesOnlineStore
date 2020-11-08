using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public interface IOrderRepository 
    {
        public DataAgent<long> Add(OrderDto input);
        public DataAgent<long> Update(OrderDto input);

        public DataAgent<List<OrderDto>> FindOrders();
        public DataAgent<OrderDto> GetOrder(long productId);
        public DataAgent<long> ProductInOrderCreate(ProductOrderDto input);
    }
}
