using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Models.Input
{
    public class OrderInputModel
    {
		public int StoreId { get; set; }
		public long BuyerId { get; set; }
		public string Details { get; set; }
		public int PaymentType { get; set; }
		public int DeliveryType { get; set; }
	}
}
