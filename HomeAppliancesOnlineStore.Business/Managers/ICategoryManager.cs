using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public interface ICategoryManager
    {
        public List<ProductDto> GetAllProductsOfOneCategory(int category, List<ProductDto> products);
    }
}
