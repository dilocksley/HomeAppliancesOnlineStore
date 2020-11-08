using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Models.Output
{
    public class ProductOutputModel
    {
		public long Id { get; set; }
		public string Name { get; set; }
		public decimal? Price { get; set; }
		public string Manufacturer { get; set; }
		public int? ManufacturingYear { get; set; }
		public decimal? Depth { get; set; }
		public decimal? Width { get; set; }
		public decimal? Height { get; set; }
		public decimal? Weight { get; set; }
		public int? Wattage { get; set; }
		public int? Voltage { get; set; }
		public bool IsPublished { get; set; }
		public string PublicationDate { get; set; }
		public string LastUpdate { get; set; }
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

        public override bool Equals(object obj)
        {
            return obj is ProductOutputModel model &&
                   Id == model.Id &&
                   Name == model.Name &&
                   Price == model.Price &&
                   Manufacturer == model.Manufacturer &&
                   ManufacturingYear == model.ManufacturingYear &&
                   Depth == model.Depth &&
                   Width == model.Width &&
                   Height == model.Height &&
                   Weight == model.Weight &&
                   Wattage == model.Wattage &&
                   Voltage == model.Voltage &&
                   IsPublished == model.IsPublished &&
                   PublicationDate == model.PublicationDate &&
                   LastUpdate == model.LastUpdate &&
                   RemovableBasket == model.RemovableBasket &&
                   EspressoType == model.EspressoType &&
                   SteamNozzle == model.SteamNozzle &&
                   IntegratedTimer == model.IntegratedTimer &&
                   BarsOfPressure == model.BarsOfPressure &&
                   DetachableBlades == model.DetachableBlades &&
                   PivotingHead == model.PivotingHead &&
                   ProtectiveBumpers == model.ProtectiveBumpers &&
                   AppControlled == model.AppControlled &&
                   RoomByRoomNavigation == model.RoomByRoomNavigation &&
                   CombinationNozzle == model.CombinationNozzle &&
                   DustCupCapacity == model.DustCupCapacity &&
                   AdjustableSuction == model.AdjustableSuction &&
                   WetCleaning == model.WetCleaning &&
                   RetractableCord == model.RetractableCord &&
                   NonStickSoleplate == model.NonStickSoleplate &&
                   AntiDripSystem == model.AntiDripSystem &&
                   SpeedSetting == model.SpeedSetting &&
                   CoolShotButton == model.CoolShotButton &&
                   RemovableEndCap == model.RemovableEndCap &&
                   DiffuserNozzle == model.DiffuserNozzle &&
                   BleachDispenser == model.BleachDispenser &&
                   Defrost == model.Defrost &&
                   Grill == model.Grill &&
                   ThirdRack == model.ThirdRack &&
                   CupClips == model.CupClips &&
                   SilverwareBasket == model.SilverwareBasket &&
                   StemwareHolders == model.StemwareHolders &&
                   UtensilSeparator == model.UtensilSeparator &&
                   VibrationReduction == model.VibrationReduction &&
                   QuickWashCycle == model.QuickWashCycle &&
                   CylinderCapacity == model.CylinderCapacity &&
                   IceMaker == model.IceMaker &&
                   TemperatureAlarm == model.TemperatureAlarm &&
                   Freezer == model.Freezer &&
                   RemovableTeaInfuser == model.RemovableTeaInfuser &&
                   WaterLevelWindow == model.WaterLevelWindow &&
                   FullCircleConnectorOnThePowerbase == model.FullCircleConnectorOnThePowerbase &&
                   TravelBag == model.TravelBag &&
                   Programmable == model.Programmable;
        }
    }
}
