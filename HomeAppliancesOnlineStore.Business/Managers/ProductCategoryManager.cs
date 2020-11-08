using HomeAppliancesOnlineStore.Business.Configuration;
using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public class ProductCategoryManager : ICategoryManager
    {
        public List<ProductDto> GetAllProductsOfOneCategory(int category, List<ProductDto> products)
        {
            var result = new List<ProductDto>();

            switch (category)
            {
                case (int)ProductCategories.Blender:
                    foreach(ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.DetachableBlades) && !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.BlowDryer:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.CoolShotButton) && !string.IsNullOrEmpty(product.RemovableEndCap) &&
                            !string.IsNullOrEmpty(product.DiffuserNozzle) && !string.IsNullOrEmpty(product.SpeedSetting) &&
                            !string.IsNullOrEmpty(product.TravelBag))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.CleaningAppliances:
                    foreach (ProductDto product in products)
                    {
                        if ((!string.IsNullOrEmpty(product.DustCupCapacity) && !string.IsNullOrEmpty(product.WetCleaning)) ||
                             !string.IsNullOrEmpty(product.QuickWashCycle))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.CoffeeMaker:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.EspressoType) && !string.IsNullOrEmpty(product.SteamNozzle) &&
                            !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.Dishwasher:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.ThirdRack) && !string.IsNullOrEmpty(product.CupClips) &&
                            !string.IsNullOrEmpty(product.SilverwareBasket) && !string.IsNullOrEmpty(product.StemwareHolders) &&
                            !string.IsNullOrEmpty(product.UtensilSeparator) && !string.IsNullOrEmpty(product.QuickWashCycle))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.ElectricKettle:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.WaterLevelWindow) && !string.IsNullOrEmpty(product.RemovableTeaInfuser) &&
                            !string.IsNullOrEmpty(product.FullCircleConnectorOnThePowerbase) && !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product); 
                        }
                    }
                    break;
                case (int)ProductCategories.ElectricShaver:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.PivotingHead) && !string.IsNullOrEmpty(product.TravelBag))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.Iron:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.NonStickSoleplate) && !string.IsNullOrEmpty(product.AntiDripSystem)
                            && !string.IsNullOrEmpty(product.TravelBag))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.KitchenAppliances:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.Microwave:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.Defrost) && !string.IsNullOrEmpty(product.Grill) &&
                            !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.PersonalCare:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.TravelBag))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.PressureCooker:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.RemovableBasket) && !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.Refrigerator:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.IceMaker) && !string.IsNullOrEmpty(product.Freezer) &&
                            !string.IsNullOrEmpty(product.Programmable))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.RobotVacuum:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.ProtectiveBumpers) && !string.IsNullOrEmpty(product.AppControlled) &&
                            !string.IsNullOrEmpty(product.RoomByRoomNavigation) && !string.IsNullOrEmpty(product.DustCupCapacity) &&
                            !string.IsNullOrEmpty(product.WetCleaning))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.VacuumCleaner:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.AdjustableSuction) && !string.IsNullOrEmpty(product.CombinationNozzle) &&
                            !string.IsNullOrEmpty(product.RetractableCord) && !string.IsNullOrEmpty(product.DustCupCapacity) &&
                            !string.IsNullOrEmpty(product.WetCleaning))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                case (int)ProductCategories.Washer:
                    foreach (ProductDto product in products)
                    {
                        if (!string.IsNullOrEmpty(product.BleachDispenser) && !string.IsNullOrEmpty(product.VibrationReduction) &&
                            !string.IsNullOrEmpty(product.CylinderCapacity) && !string.IsNullOrEmpty(product.QuickWashCycle))
                        {
                            result.Add(product);
                        }
                    }
                    break;
                default:
                    return products;
            }
            return result;
        }
    }
}
