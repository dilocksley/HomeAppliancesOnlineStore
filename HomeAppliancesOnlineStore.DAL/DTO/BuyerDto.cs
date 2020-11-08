using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.DTO
{
    public class BuyerDto
    {
		public long Id { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public DateTime? RegistrationDate { get; set; }
		public DateTime? LastUpdate { get; set; }
		public string ShippingAddress { get; set; }
		public string Phone { get; set; }
		public string Password { get; set; }
		public string Email { get; set; }
		public DateTime? Birthday { get; set; }
		public CityDto? City { get; set; }
		public BuyerStatusDto? BuyerStatus { get; set; }
		public bool IsDeleted { get; set; }

	}
}
