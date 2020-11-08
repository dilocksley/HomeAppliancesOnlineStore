using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HomeAppliancesOnlineStore.API.Services
{
    public class ResponseMessages
    {
        public const string ValueNotFound = "Object wasn't found.";
        public const string InvalidZeroOrNegativeValue = "Value cannot equal zero nor be negative.";
        
        public const string ProductIdFieldMissing = "Please provide Product Id value.";
        public const string NameFieldMissing = "Please provide Name value.";
        public const string PriceFieldMissing = "Please provide Price value.";
        public const string ManufacturerFieldMissing = "Please provide Manufacturer value.";
        public const string ManufacturingYearFieldMissing = "Please provide Manufacturing Year value.";
        public const string DepthFieldMissing = "Please provide Depth value.";
        public const string WidthFieldMissing = "Please provide Width value.";
        public const string HeightFieldMissing = "Please provide Height value.";
        public const string WeightFieldMissing = "Please provide Weight value.";
        public const string WattageFieldMissing = "Please provide Wattage value.";
        public const string VoltageFieldMissing = "Please provide Voltage value.";

        public const string StoreFieldMissing = "Please provide Store Id value.";
        public const string QuantityFieldMissing = "Please provide Quantity value.";
        public const string StoreIdOrQuantityFieldMustBeEmpty = "Please leave quantity or store id or both fields empty.";
        public const string ValidationError = "Couldn't validate records.";
        public const string ProductQuantityRecordAlreadyExists = "Record cannot be created." +
            "Product record quantity in this store already exist. Please use updating method.";

        public const string InvalidNameFieldContent = "Name is very short. Please provide meaningful product Name.";
        public const string InvalidYearValue = "Year must be later than 1800.";


        public const string StoreIdValue = "Such store doesn't exist.";
        public const string CetegoryValue = "Such category doesn't exist.";


    }
}
