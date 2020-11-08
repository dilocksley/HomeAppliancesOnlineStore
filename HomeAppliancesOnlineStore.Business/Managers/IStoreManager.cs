using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public interface IStoreManager
    {
        public int CheckStock(int storeId, long productId);
    }
}
