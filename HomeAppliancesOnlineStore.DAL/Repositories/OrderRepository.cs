using Dapper;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Data.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public class OrderRepository : BaseRepository, IOrderRepository
    {
        public OrderRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }

        public DataAgent<long> Add(OrderDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<long>(
                    StoredProcedures.OrderCreate,
                    new
                    { 
                        input.StoreId, input.BuyerId, input.CreationDate,
                        input.Discount, input.DeliveryCost, input.TotalAmount,
                        input.Details,
                        PaymentTypeId = input.PaymentType.Id,
                        OrderStatusId = input.OrderStatus.Id,
                        DeliveryId = input.DeliveryType.Id
                    },
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();

            }
            catch(Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<List<OrderDto>> FindOrders()
        {
            throw new NotImplementedException();
        }

        public DataAgent<OrderDto> GetOrder(long productId)
        {
            throw new NotImplementedException();
        }

        public DataAgent<long> Update(OrderDto input)
        {
            throw new NotImplementedException();
        }

        public DataAgent<long> ProductInOrderCreate(ProductOrderDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<long>(
                    StoredProcedures.ProductOrderCreate,
                    new
                    {
                        input.OrderId,
                        input.ProductId,
                        input.Quantity
                    },
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }
    }
}
