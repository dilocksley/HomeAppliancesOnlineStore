using HomeAppliancesOnlineStore.Core.DTO;
using System;
using System.Collections.Generic;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Microsoft.Extensions.Options;

namespace HomeAppliancesOnlineStore.Core.Repositories
{
    public class BuyerRepository : BaseRepository, IBuyerRepository
    {
        public BuyerRepository(IOptions<DBSettings> options)
        {
            DbConnection = new SqlConnection(options.Value.ConnectionString);
        }


        public DataAgent<long> Add(BuyerDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<BuyerDto, CityDto, BuyerStatusDto, long>(
                    StoredProcedures.BuyerCreate,
                    (buyer, city, status) =>
                    {
                        buyer.City = city;
                        buyer.BuyerStatus = status;
                        return buyer.Id;
                    },
                    new
                    {
                        input.FirstName,
                        input.LastName,
                        input.ShippingAddress,
                        input.Phone,
                        input.Password,
                        input.Email,
                        input.Birthday,
                        CityId = input.City.Id,
                        BuyerStatusId = input.BuyerStatus.Id
                    },
                    splitOn: "Name",
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }

        public DataAgent<List<BuyerDto>> FindBuyers()
        {
            throw new NotImplementedException();
        }

        public DataAgent<BuyerDto> GetBuyer(long buyerId)
        {
            return new DataAgent<BuyerDto>();
        }

        public DataAgent<int> DeleteBuyer(long buyerId)
        {
            var result = new DataAgent<int>();
            try
            {
                result.Data = DbConnection.Query<int>(
                StoredProcedures.BuyerDelete,
                new { buyerId },
                commandType: CommandType.StoredProcedure).
                SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }

            return result;
        }

        //public DataAgent<BuyerDto> GetBuyerSqlKata(long buyerId)
        //{
        //    var result = new DataAgent<BuyerDto>();
        //    try
        //    {
        //        var query = DbConnectionFactory.Query("Buyer").
        //             Join("BuyerStatus", "BuyerStatus.Id", "Buyer.BuyerStatusId").
        //             Join("City", "City.Id", "Buyer.CityId").
        //             Select(
        //             "BuyerStatus.Name",
        //             "BuyerStatus.Discount",
        //             "City.Name",
        //             "Buyer.FirstName",
        //             "Buyer.LastName",
        //             "Buyer.RegistrationDate",
        //             "Buyer.LastUpdate",
        //             "Buyer.ShippingAddress",
        //             "Buyer.Phone",
        //             "Buyer.Password",
        //             "Buyer.Email",
        //             "Buyer.Birthday",
        //             "Buyer.IsDeleted"
        //             ).
        //             Where("id", buyerId).
        //             Get<BuyerDto>();
        //        result.Data = (BuyerDto)query;
        //    }
        //    catch(Exception ex)
        //    {
        //        result.ResponseMessage = ex.Message;
        //    }

        //    return result;
        //}

        public DataAgent<List<BuyerDto>> GetAllBuyers(long buyerId)
        {
            throw new Exception();
        }

        public DataAgent<long> Update(BuyerDto input)
        {
            var result = new DataAgent<long>();
            try
            {
                result.Data = DbConnection.Query<BuyerDto, CityDto, BuyerStatusDto, long>(
                    StoredProcedures.BuyerUpdate,
                    (buyer, city, status) =>
                    {
                        buyer.City = city;
                        buyer.BuyerStatus = status;
                        return buyer.Id;
                    },
                    new
                    {
                        input.Id,
                        input.FirstName,
                        input.LastName,
                        input.ShippingAddress,
                        input.Phone,
                        input.Password,
                        input.Email,
                        input.Birthday,
                        CityId = input.City.Id,
                        BuyerStatusId = input.BuyerStatus.Id
                    },
                    splitOn: "Name",
                    commandType: CommandType.StoredProcedure
                    ).SingleOrDefault();
            }
            catch (Exception ex)
            {
                result.ResponseMessage = ex.Message;
            }
            return result;
        }
    }
}
