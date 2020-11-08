using HomeAppliancesOnlineStore.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.DTO
{
    public class OrderDto
    {
		public long Id { get; set; }
		public int StoreId { get; set; }
		public long BuyerId { get; set; }
		public DateTime? CreationDate { get; set; }
		public DateTime? LastUpdate { get; set; }
		public int Discount { get; set; }
		public decimal DeliveryCost { get; set; }
		public decimal TotalAmount { get; set; }
		public string Details { get; set; }
		public PaymentTypeDto PaymentType { get; set; }
		public OrderStatusDto? OrderStatus { get; set; }
		public DeliveryTypeDto DeliveryType { get; set; }
		public DateTime? ShippingDate { get; set; }
		public DateTime? DeliveryDate { get; set; }
		public string ShippingCompany { get; set; }
	}
}
