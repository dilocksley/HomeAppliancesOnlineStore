using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Models.Output
{
    public class ProductInStoreOutputModel
    {
        public long ProductId { get; set; }
        public int StoreId { get; set; }
        public int Quantity { get; set; }
    }
}
