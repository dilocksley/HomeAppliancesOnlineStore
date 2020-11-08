using HomeAppliancesOnlineStore.Business.Managers;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace HomeAppliancesOnlineStore.API.Services.Validation
{
    public class ProductValidation 
    {
        IProductManager _productManager;
        StoreValidation _storeValidation;
        public ProductValidation(IProductManager productManager, StoreValidation storeValidation)
        {
            _productManager = productManager;
            _storeValidation = storeValidation;
        }

        public string ValidateProductInputModelUponCreation(ProductInputModel model)
        {
            var validationResult = string.Empty;

            validationResult += model.Name == null ? $"{ResponseMessages.NameFieldMissing} \n" : ValidateName(model.Name);
            validationResult += model.Price == null ? $"{ResponseMessages.PriceFieldMissing} \n" : ValidatePrice((decimal)model.Price);
            validationResult += model.Manufacturer == null ? $"{ResponseMessages.ManufacturerFieldMissing} \n" : ValidateName(model.Manufacturer);
            validationResult += model.ManufacturingYear == null ? $"{ResponseMessages.ManufacturingYearFieldMissing} \n" :
                ValidateYear((int)model.ManufacturingYear);

            validationResult += model.Depth == null ? $"{ResponseMessages.DepthFieldMissing} \n" : ValidateValueNotZeroOrNegative((decimal)model.Depth);
            validationResult += model.Width == null ? $"{ResponseMessages.WidthFieldMissing} \n" : ValidateValueNotZeroOrNegative((decimal)model.Width);
            validationResult += model.Height == null ? $"{ResponseMessages.HeightFieldMissing} \n" : ValidateValueNotZeroOrNegative((decimal)model.Weight);
            validationResult += model.Weight == null ? $"{ResponseMessages.WeightFieldMissing} \n" : ValidateValueNotZeroOrNegative((decimal)model.Weight);
            validationResult += model.Wattage == null ? $"{ResponseMessages.WattageFieldMissing} \n" : ValidateValueNotZeroOrNegative((int)model.Wattage);
            validationResult += model.Voltage == null ? $"{ResponseMessages.VoltageFieldMissing} \n" : ValidateValueNotZeroOrNegative((int)model.Voltage);

            return validationResult;
        }
        public string ValidateProductInputModelUponUpdate(ProductInputModel model)
        {
            var validationResult = string.Empty;
            validationResult += model.Id == null ? $"{ResponseMessages.ProductIdFieldMissing} \n" : ValidateProductId((long)model.Id);
            if (!string.IsNullOrEmpty(model.Name))
            {
                validationResult += ValidateName(model.Name);
            }
            if (model.Price != null)
            {
                validationResult += ValidatePrice((decimal)model.Price);
            }
            if (!string.IsNullOrEmpty(model.Manufacturer))
            {
                validationResult += ValidateName(model.Manufacturer);
            }
            if (model.ManufacturingYear != null)
            {
                validationResult += ValidateYear((int)model.ManufacturingYear);
            }
            if (model.Depth != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Depth);
            }
            if (model.Width != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Width);
            }
            if (model.Height != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Height);
            }
            if (model.Weight != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Weight);
            }
            if (model.Wattage != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.Wattage);
            }
            if (model.Voltage != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.Voltage);
            }

            return validationResult;
        }
        public string ValidateProductSearchInputModel(ProductSearchInputModel model)
        {
            var validationResult = string.Empty;
            if (model.Id != null)
            {
                validationResult += ValidateProductId((long)model.Id);
            }
            if (model.PriceStart != null)
            {
                validationResult += ValidatePrice((decimal)model.PriceStart);
            }
            if (model.PriceEnd != null)
            {
                validationResult += ValidatePrice((decimal)model.PriceEnd);
            }
            if (model.ManufacturingYearStart != null)
            {
                validationResult += ValidateYear((int)model.ManufacturingYearStart);
            }
            if (model.ManufacturingYearEnd != null)
            {
                validationResult += ValidateYear((int)model.ManufacturingYearEnd);
            }
            if (model.Depth != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Depth);
            }
            if (model.Width != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Width);
            }
            if (model.Height != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Height);
            }
            if (model.Weight != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((decimal)model.Weight);
            }
            if (model.WattageStart != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.WattageStart);
            }
            if (model.WattageEnd != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.WattageEnd);
            }
            if (model.VoltageStart != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.VoltageStart);
            }
            if (model.VoltageEnd != null)
            {
                validationResult += ValidateValueNotZeroOrNegative((int)model.VoltageEnd);
            }

            return validationResult;
        }
        public string ValidateProductStoreInputModelUponCreationOrUpdate(ProductInStoreInputModel model)
        {
            var validationResult = string.Empty;
            validationResult += ValidateProductId(model.ProductId);

            validationResult += model.StoreId == null ? $"{ResponseMessages.StoreFieldMissing} \n" :
                _storeValidation.ValidateStoreId((int)model.StoreId);

            validationResult += model.Quantity == null ? $"{ResponseMessages.QuantityFieldMissing} \n" :
                _storeValidation.ValidateQuantityValue((int)model.Quantity);
            return validationResult;
        }
        public string ValidateExistingRecord(long productId, int storeId)
        {
            var validationResult = string.Empty;
            var result = _productManager.GetAvailabilityOfProductInStore(new ProductInStoreInputModel { ProductId = productId, StoreId = storeId });
            if (result.ContainsData)
            {
                validationResult += result.Data.Count > 0 ? $"{ResponseMessages.ProductQuantityRecordAlreadyExists} \n" :
                    $"{string.Empty}";
            }
            else
            {
                validationResult += $"{ResponseMessages.ValidationError} \n";
                validationResult += $"{result.ResponseMessage} \n";
            }
            return validationResult;
        }
        public string ValidateProductStoreInputModelUponGettingAvailability(ProductInStoreInputModel model)
        {
            var validationResult = string.Empty;

            if (model.StoreId != null & model.Quantity != null)
            {
                validationResult += $"{ResponseMessages.StoreIdOrQuantityFieldMustBeEmpty} \n";
            }
            else
            {
                validationResult += ValidateProductId(model.ProductId);
                validationResult += _storeValidation.ValidateStoreId((int)model.StoreId);
                validationResult += _storeValidation.ValidateQuantityValue(model.Quantity);
            }
            return validationResult;
        }
        public string ValidateProductId(long productId)
        {
            if (productId <= 0)
            {
                return ResponseMessages.InvalidZeroOrNegativeValue;
            }
            var result = _productManager.FindProducts(new ProductSearchInputModel { Id = productId });
            if (result.ContainsData)
            {
                if (result.Data.Count == 0)
                {
                    return ResponseMessages.ValueNotFound;
                }
            }
            return $"{string.Empty}";
        }
        private string ValidateValueNotZeroOrNegative(decimal value)
        {
            return value <= 0 ? $"{ResponseMessages.InvalidZeroOrNegativeValue} \n" : $"{string.Empty}";
        }
        private string ValidateValueNotZeroOrNegative(int value)
        {
            return value <= 0 ? $"{ResponseMessages.InvalidZeroOrNegativeValue} \n" : $"{string.Empty}";
        }
        private string ValidateName(string name)
        {
            int minimumNameLength = 2;
            var pattern = @"\s";
            var result = Regex.Replace(name, pattern, "");
            return result.Length < minimumNameLength ? $"{ResponseMessages.InvalidNameFieldContent} \n" : $"{string.Empty}";
        }
        private string ValidatePrice(decimal price)
        {
            return price <= 0 ? $"{ResponseMessages.InvalidZeroOrNegativeValue} \n" : $"{string.Empty}";
        }
        private string ValidateYear(int year)
        {
            if (year < 1800 || year > DateTime.UtcNow.Year)
            {
                return $"{ResponseMessages.InvalidYearValue} \n";
            }
            return year <= 0 ? $"{ResponseMessages.InvalidZeroOrNegativeValue} \n" : $"{string.Empty}";
        }

    }
}
