using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public interface IBuyerRepository 
    {
        public DataAgent<long> Add(BuyerDto input);
        public DataAgent<int> DeleteBuyer(long buyerId);
        public DataAgent<long> Update(BuyerDto input);


        public DataAgent<List<BuyerDto>> FindBuyers();
        public DataAgent<BuyerDto> GetBuyer(long buyerId);

    }
}
