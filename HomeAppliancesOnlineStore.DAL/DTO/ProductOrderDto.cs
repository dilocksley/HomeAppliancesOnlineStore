using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Data.DTO
{
    public class ProductOrderDto
    {
        public int? Id { get; set; }
        public long ProductId { get; set; }
        public int Quantity { get; set; }
        public long? OrderId { get; set; }
    }
}
