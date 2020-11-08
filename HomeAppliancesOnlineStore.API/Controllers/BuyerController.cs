using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HomeAppliancesOnlineStore.API.Services;
using HomeAppliancesOnlineStore.Business.Managers;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAppliancesOnlineStore.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuyerController : Controller
    {
        private IBuyerManager _buyerManager;

        public BuyerController(IBuyerManager buyerManager)
        {
            _buyerManager = buyerManager;
        }

        /// <summary>
        /// Adds a new Buyer to the database.
        /// </summary>
        /// <param name="buyerInputModel">All the mandatory properties of the Buyer must be filled.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the newly added Buyer.</returns>
        /// <response code="201">When the Buyer is successfully registered.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        /// {
        ///      "FirstName" : "Mark",
        ///      "LastName" : "Bond",
        ///      "ShippingAddress" : "Spb nevskky 44",
        ///      "Phone" : "88125967484",
        ///      "Password" : "bigBond",
        ///      "Email" : "karlaB@mail.ru",
        ///      "CityId" : 1
        ///  }
        /// </code>
        /// </example>
        [HttpPost("add/new")]
        public ActionResult<long> AddBuyer([FromBody] BuyerInputModel buyerInputModel)
        {
            var result = _buyerManager.AddBuyer(buyerInputModel);
            if (!result.ContainsData)
            {
                return Problem(detail: result.ResponseMessage, statusCode: 520);
            }
            return Created($"id/{result.Data}", result.Data);
        }

        /// <summary>
        /// Updates an existing Buyer in the database.
        /// </summary>
        /// <param name="buyerInputModel">Any fields of the Buyer wished to be updated.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the updated Buyer.</returns>
        /// <response code="200">When the Buyer information is successfully updated.</response>
        [HttpPut("update")]
        public ActionResult<long> UpdateBuyerInfo([FromBody] BuyerInputModel buyerInputModel)
        {
            var result = _buyerManager.UpdateBuyer(buyerInputModel);
            return MakeResponse<long, long>(result);
        }

        /// <summary>
        /// Soft deletes the Buyer.
        /// </summary>
        /// <param name="buyerId">Buyer Id.</param>
        /// <response code="200">When Buyer is deleted successfully.</response>
        [HttpDelete("delete/{buyerId}")]
        public ActionResult<int> DeleteBuyer(long buyerId)
        {
            var result = _buyerManager.DeleteBuyer(buyerId);
            return MakeResponse<int, int>(result);
        }



        /// <summary>
        /// Gets all the info about a selected Buyer by its Id.
        /// </summary>
        /// <param name="buyerId">Buyer Id.</param>
        /// <returns>Full information about the Buyer.</returns>
        /// <response code="200">When the Buyer is found in the database.</response>
        [HttpGet("{buyerId}")]
        public ActionResult<BuyerOutputModel> GetBuyer(long buyerId)
        {
            var result = _buyerManager.GetBuyer(buyerId);
            return Ok(result);
        }

        /// <summary>
        /// Gets all the info about all the Buyers.
        /// </summary>
        /// <returns>Full information about all the Buyers.</returns>
        /// <response code="200">When the search is completed successfully.</response>
        [HttpGet("all")]
        public ActionResult<List<BuyerOutputModel>> GetAllBuyers()
        {
            _buyerManager.GetAllBuyers();
            return Ok();
        }


        /// <summary>
        /// Gets a count of all of the Buyer accounts in the store.
        /// </summary>
        /// <returns>A number of total Buyers' count.</returns>
        /// <response code="200">When the count is finished successfully.</response>
        [HttpGet("all/count")]
        public ActionResult<long> GetBuyersCount()
        {
            var result = _buyerManager.GetBuyersCount();
            return Ok(result);
        }


        private ActionResult<K> MakeResponse<T, K>(DataAgent<T> result)
        {
            if (result.ContainsData)
            {
                if (result.Data == null)
                {
                    return NotFound(ResponseMessages.ValueNotFound);
                }
                return Ok(result.Data);
            }
            return Problem(detail: result.ResponseMessage, statusCode: 520);
        }
    }
}
