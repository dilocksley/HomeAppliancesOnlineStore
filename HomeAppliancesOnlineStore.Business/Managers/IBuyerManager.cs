using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public interface IBuyerManager
    {
        public DataAgent<BuyerOutputModel> GetBuyer(long buyerId);
        public DataAgent<long> AddBuyer(BuyerInputModel buyerInputModel);
        public DataAgent<int> DeleteBuyer(long buyerId);
        public DataAgent<long> UpdateBuyer(BuyerInputModel buyerInputModel);



        public void GetAllBuyers();
        public long GetBuyersCount();
    }
}
