using HomeAppliancesOnlineStore.Business.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HomeAppliancesOnlineStore.API.Services.Validation
{
    public class CategoryValidation
    {
        public string ValidateProductCategory(int productCategory)
        {
            foreach (ProductCategories category in (ProductCategories[])Enum.GetValues(typeof(ProductCategories)))
            {
                if ((int)category == productCategory) return string.Empty;
            }


            return ResponseMessages.CetegoryValue;
        }
    }
}
