using Dapper;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public class ProductRepository : BaseRepository, IProductRepository
    {
        public ProductRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }

        public DataAgent<long> Add(ProductDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<long>(
                    StoredProcedures.ProductCreate,
                    new
                    {
                        input.Name, input.Price, input.Manufacturer, input.ManufacturingYear,
                        input.Depth, input.Width, input.Height, input.Weight, input.Wattage, input.Voltage,
                        input.RemovableBasket, input.EspressoType, input.SteamNozzle, input.IntegratedTimer, input.BarsOfPressure,
                        input.DetachableBlades, input.PivotingHead,
                        input.ProtectiveBumpers, input.AppControlled, input.RoomByRoomNavigation, input.CombinationNozzle,
                        input.DustCupCapacity, input.AdjustableSuction, input.WetCleaning, input.RetractableCord,
                        input.NonStickSoleplate, input.AntiDripSystem, input.SpeedSetting, input.CoolShotButton,
                        input.RemovableEndCap, input.DiffuserNozzle, input.BleachDispenser, input.Defrost, input.Grill,
                        input.ThirdRack, input.CupClips, input.SilverwareBasket, input.StemwareHolders, input.UtensilSeparator,
                        input.VibrationReduction, input.QuickWashCycle, input.CylinderCapacity,
                        input.IceMaker, input.TemperatureAlarm, input.Freezer,
                        input.RemovableTeaInfuser, input.WaterLevelWindow, input.FullCircleConnectorOnThePowerbase,
                        input.TravelBag,  input.Programmable
                    },
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch(Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<List<ProductDto>> FindProducts(ProductSearchDto input)
        {
            var result = new DataAgent<List<ProductDto>>();
            try
            {
                result.Data = DbConnection.Query<ProductDto>(
                    StoredProcedures.ProductSearch,
                    new
                    {
                        input.Id,
                        input.Name,
                        input.PriceStart,
                        input.PriceEnd,
                        input.Manufacturer,
                        input.ManufacturingYearStart,
                        input.ManufacturingYearEnd,
                        input.Depth,
                        input.Width,
                        input.Height,
                        input.Weight,
                        input.WattageStart,
                        input.WattageEnd,
                        input.VoltageStart,
                        input.VoltageEnd,
                        input.RemovableBasket,
                        input.EspressoType,
                        input.SteamNozzle,
                        input.IntegratedTimer,
                        input.BarsOfPressure,
                        input.DetachableBlades,
                        input.PivotingHead,
                        input.ProtectiveBumpers,
                        input.AppControlled,
                        input.RoomByRoomNavigation,
                        input.CombinationNozzle,
                        input.DustCupCapacity,
                        input.AdjustableSuction,
                        input.WetCleaning,
                        input.RetractableCord,
                        input.NonStickSoleplate,
                        input.AntiDripSystem,
                        input.SpeedSetting,
                        input.CoolShotButton,
                        input.RemovableEndCap,
                        input.DiffuserNozzle,
                        input.BleachDispenser,
                        input.Defrost,
                        input.Grill,
                        input.ThirdRack,
                        input.CupClips,
                        input.SilverwareBasket,
                        input.StemwareHolders,
                        input.UtensilSeparator,
                        input.VibrationReduction,
                        input.QuickWashCycle,
                        input.CylinderCapacity,
                        input.IceMaker,
                        input.TemperatureAlarm,
                        input.Freezer,
                        input.RemovableTeaInfuser,
                        input.WaterLevelWindow,
                        input.FullCircleConnectorOnThePowerbase,
                        input.TravelBag,
                        input.Programmable

                    },
                    commandType: CommandType.StoredProcedure
                    ).ToList();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<ProductDto> DeleteProduct(long id)
        {
            var result = new DataAgent<ProductDto>();
            try
            {
                result.Data = DbConnection.Query<ProductDto>(
                StoredProcedures.ProductDelete,
                new { id },
                commandType: CommandType.StoredProcedure).
                SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<long> Update(ProductDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<long>(
                    StoredProcedures.ProductUpdate,
                    new
                    {
                        input.Id,
                        input.Name,
                        input.Price,
                        input.Manufacturer,
                        input.ManufacturingYear,
                        input.Depth,
                        input.Width,
                        input.Height,
                        input.Weight,
                        input.Wattage,
                        input.Voltage,
                        input.IsPublished,
                        input.RemovableBasket,
                        input.EspressoType,
                        input.SteamNozzle,
                        input.IntegratedTimer,
                        input.BarsOfPressure,
                        input.DetachableBlades,
                        input.PivotingHead,
                        input.ProtectiveBumpers,
                        input.AppControlled,
                        input.RoomByRoomNavigation,
                        input.CombinationNozzle,
                        input.DustCupCapacity,
                        input.AdjustableSuction,
                        input.WetCleaning,
                        input.RetractableCord,
                        input.NonStickSoleplate,
                        input.AntiDripSystem,
                        input.SpeedSetting,
                        input.CoolShotButton,
                        input.RemovableEndCap,
                        input.DiffuserNozzle,
                        input.BleachDispenser,
                        input.Defrost,
                        input.Grill,
                        input.ThirdRack,
                        input.CupClips,
                        input.SilverwareBasket,
                        input.StemwareHolders,
                        input.UtensilSeparator,
                        input.VibrationReduction,
                        input.QuickWashCycle,
                        input.CylinderCapacity,
                        input.IceMaker,
                        input.TemperatureAlarm,
                        input.Freezer,
                        input.RemovableTeaInfuser,
                        input.WaterLevelWindow,
                        input.FullCircleConnectorOnThePowerbase,
                        input.TravelBag,
                        input.Programmable
                    },
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<long> AddProductToStore(ProductStoreDto productInStore)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<long>(
                StoredProcedures.ProductAddToStore,
                new 
                { 
                    productInStore.ProductId,
                    productInStore.StoreId,
                    productInStore.Quantity
                },
                commandType: CommandType.StoredProcedure).
                SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<int> DeleteProductFromStore(long productId)
        {
            var result = new DataAgent<int>();
            try
            {
                result.Data = DbConnection.Query<int>(
                StoredProcedures.ProductDeleteFromStore,
                new { productId },
                commandType: CommandType.StoredProcedure).
                SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<List<ProductStoreDto>> GetAvailabilityOfProductInStore(ProductStoreDto productInStore)
        {
            var result = new DataAgent<List<ProductStoreDto>>();
            try
            {
                result.Data = DbConnection.Query<ProductStoreDto>(
                StoredProcedures.ProductInStoreGetAvailability,
                new
                {
                    productInStore.ProductId,
                    productInStore.StoreId,
                    productInStore.Quantity
                },
                    commandType: CommandType.StoredProcedure
                    ).ToList();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<int> ChangeProductQuantityInStore(ProductStoreDto productInStore)
        {
            var result = new DataAgent<int>();
            try
            {
                result.Data = DbConnection.Query<int>(
                StoredProcedures.ProductInStoreChangeQuantity,
                new
                {
                    productInStore.ProductId,
                    productInStore.StoreId,
                    productInStore.Quantity
                },
                commandType: CommandType.StoredProcedure).
                SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }
    }
}
