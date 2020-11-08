using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Models.Input
{
    public class ProductInStoreInputModel
    {
        public long ProductId { get; set; }
        public int? StoreId { get; set; }
        public int? Quantity { get; set; }
    }
}
