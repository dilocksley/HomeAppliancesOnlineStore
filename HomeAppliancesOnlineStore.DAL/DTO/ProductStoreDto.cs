using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.DTO
{
    public class ProductStoreDto
    {
        public long ProductId { get; set; }
        public int? StoreId { get; set; }
        public int? Quantity { get; set; }
    }
}
