using HomeAppliancesOnlineStore.Business.Configuration;
using HomeAppliancesOnlineStore.Business.Models.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HomeAppliancesOnlineStore.API.Services.Validation
{
    public class StoreValidation 
    {
        public string ValidateStoreId(int storeId)
        {
            if (storeId <= 0)
            {
                return ResponseMessages.InvalidZeroOrNegativeValue;
            }
            foreach (Stores id in (Stores[])Enum.GetValues(typeof(Stores)))
            {
                if (Convert.ToInt32(id) == storeId) return $"{string.Empty}";
            }

            return ResponseMessages.StoreIdValue;
        }
        public string ValidateQuantityValue(int? quantity)
        {
            if (quantity <= 0)
            {
                return ResponseMessages.InvalidZeroOrNegativeValue;
            }
            return $"{string.Empty}";
        }
    }
}
