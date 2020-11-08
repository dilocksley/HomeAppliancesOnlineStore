using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public interface IOrderManager
    {
        public DataAgent<long> CreateOrder(OrderInputModel orderInputModel, List<ProductInOrderInputModel> products);


        public DataAgent<long> UpdateOrder(OrderInputModel orderInputModel);
        public DataAgent<OrderOutputModel> GetOrder(long orderId);
        public DataAgent<List<OrderOutputModel>> GetOrdersByStatus(int orderStatusId);
    }
}
