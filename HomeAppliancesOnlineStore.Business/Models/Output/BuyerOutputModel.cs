using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Models.Output
{
    public class BuyerOutputModel
    {
		public long Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string RegistrationDate { get; set; }
		public string LastUpdate { get; set; }
		public string ShippingAddress { get; set; }
		public string Phone { get; set; }
		public string Password { get; set; }
		public string Email { get; set; }
		public string Birthday { get; set; }
		public string BuyerStatusName { get; set; }
		public int? BuyerStatusDiscount { get; set; }
		public string CityName { get; set; }
		public bool IsDeleted { get; set; }
	}
}
