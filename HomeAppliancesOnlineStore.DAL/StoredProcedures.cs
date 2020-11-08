using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core
{
    public class StoredProcedures
    {
        public const string ProductCreate = "Product_Create";
        public const string ProductSearch = "Product_Search";
        public const string ProductUpdate = "Product_Update";
        public const string ProductDelete = "Product_Delete";
        public const string ProductAddToStore = "Product_AddToStore";
        public const string ProductDeleteFromStore = "Product_DeleteFromStore";
        public const string ProductInStoreGetAvailability = "Product_Store_GetAvailability";
        public const string ProductInStoreChangeQuantity = "Product_Store_ChangeQuantity";
        public const string ProductOrderCreate = "Product_Order_Create";

        public const string OrderCreate = "Order_Create";
        public const string OrderSearch = "";
        public const string OrderUpdate = "Order_Update";

        public const string BuyerCreate = "Buyer_Create";
        public const string BuyerSearch = "";
        public const string BuyerUpdate = "Buyer_Update";
        public const string BuyerDelete = "Buyer_Delete";
    }
}
