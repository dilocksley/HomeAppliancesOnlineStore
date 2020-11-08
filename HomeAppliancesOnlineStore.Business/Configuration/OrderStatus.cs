using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Configuration
{
    public enum OrderStatus
    {
        Created = 1,
        Packing,
        InDelivery,
        Completed,
        Cancelled
    }
}
