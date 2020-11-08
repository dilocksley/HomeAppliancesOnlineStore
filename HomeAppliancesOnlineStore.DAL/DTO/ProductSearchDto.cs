using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Core.DTO
{
    public class ProductSearchDto
    {
		public long? Id { get; set; }
		public string Name { get; set; }
		public decimal? PriceStart { get; set; }
		public decimal? PriceEnd { get; set; }
		public string Manufacturer { get; set; }
		public int? ManufacturingYearStart { get; set; }
		public int? ManufacturingYearEnd { get; set; }
		public decimal? Depth { get; set; }
		public decimal? Width { get; set; }
		public decimal? Height { get; set; }
		public decimal? Weight { get; set; }
		public int? WattageStart { get; set; }
		public int? WattageEnd { get; set; }
		public int? VoltageStart { get; set; }
		public int? VoltageEnd { get; set; }
		public bool IsPublished { get; set; }
		public DateTime? PublicationDateStart { get; set; }
		public DateTime? PublicationDateEnd { get; set; }
		public DateTime? LastUpdateStart { get; set; }
		public DateTime? LastUpdateEnd { get; set; }
		public string RemovableBasket { get; set; }
		public string EspressoType { get; set; }
		public string SteamNozzle { get; set; }
		public string IntegratedTimer { get; set; }
		public string BarsOfPressure { get; set; }
		public string DetachableBlades { get; set; }
		public string PivotingHead { get; set; }
		public string ProtectiveBumpers { get; set; }
		public string AppControlled { get; set; }
		public string RoomByRoomNavigation { get; set; }
		public string CombinationNozzle { get; set; }
		public string DustCupCapacity { get; set; }
		public string AdjustableSuction { get; set; }
		public string WetCleaning { get; set; }
		public string RetractableCord { get; set; }
		public string NonStickSoleplate { get; set; }
		public string AntiDripSystem { get; set; }
		public string SpeedSetting { get; set; }
		public string CoolShotButton { get; set; }
		public string RemovableEndCap { get; set; }
		public string DiffuserNozzle { get; set; }
		public string BleachDispenser { get; set; }
		public string Defrost { get; set; }
		public string Grill { get; set; }
		public string ThirdRack { get; set; }
		public string CupClips { get; set; }
		public string SilverwareBasket { get; set; }
		public string StemwareHolders { get; set; }
		public string UtensilSeparator { get; set; }
		public string VibrationReduction { get; set; }
		public string QuickWashCycle { get; set; }
		public string CylinderCapacity { get; set; }
		public string IceMaker { get; set; }
		public string TemperatureAlarm { get; set; }
		public string Freezer { get; set; }
		public string RemovableTeaInfuser { get; set; }
		public string WaterLevelWindow { get; set; }
		public string FullCircleConnectorOnThePowerbase { get; set; }
		public string TravelBag { get; set; }
		public string Programmable { get; set; }

	}
}
