using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HomeAppliancesOnlineStore.Business.Managers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAppliancesOnlineStore.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreController : Controller
    {
        private IStoreManager _storeManager;
        public StoreController(IStoreManager storeManager)
        {
            _storeManager = storeManager;
        }

        /// <summary>
        /// Checks products availability in the store.
        /// </summary>
        /// <param name="storeId">Store Id.</param>
        /// <param name="productId">Product Id.</param>
        /// <returns>A 64-bit positive integer of a Product count in the Store.</returns>
        /// <response code="201">When the count has been made.</response>
        [HttpGet("inventory/store/{storeId}/product/{productId}")]
        public ActionResult<long> CheckStock([FromBody] int storeId, long productId)
        {
            var result = _storeManager.CheckStock(storeId, productId);
            return Created($"count/{result}", result);
        }
    }
}
