using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HomeAppliancesOnlineStore.Business.Managers;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAppliancesOnlineStore.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : Controller
    {
        private IOrderManager _orderManager;

        public OrderController(IOrderManager orderManager)
        {
            _orderManager = orderManager;
        }

        /// <summary>
        /// Creates a new Order.
        /// </summary>
        /// <param name="orderInputModel">All the mandatory properties in the Order must be filled.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the newly created Order.</returns>
        /// <response code="201">When the Order is successfully created.</response>
        [HttpPost("add/new")]
        //public ActionResult<long> CreateOrder([FromBody] OrderInputModel orderInputModel, List<ProductInOrderInputModel> products)
        //{
        //    var result = _orderManager.CreateOrder(orderInputModel, products);
        //    return Created($"id/{result}", result);
        //}

        /// <summary>
        /// Updates an existing Order in the database.
        /// </summary>
        /// <param name="orderInputModel">Fields of the Order wished to be updated.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the updated Order.</returns>
        /// <response code="200">When the Order information is successfully updated.</response>
        [HttpPut("update")]
        public ActionResult<long> UpdateOrder([FromBody] OrderInputModel orderInputModel)
        {
            var result = _orderManager.UpdateOrder(orderInputModel);
            return Ok(result);
        }

        /// <summary>
        /// Gets all the info about a selected Order by its Id.
        /// </summary>
        /// <param name="orderId">Order Id.</param>
        /// <returns>Full information about the Order.</returns>
        /// <response code="200">When the Order is found in the database.</response>
        [HttpGet("{orderId}")]
        public ActionResult<OrderOutputModel> GetOrder(long orderId)
        {
            var result = _orderManager.GetOrder(orderId);
            return Ok(result);
        }

        /// <summary>
        /// Gets all the Orders by selected status.
        /// </summary>
        /// <param name="orderStatusId">Id of selected Order status.</param>
        /// <returns>Full information about all the Orders with selected status.</returns>
        /// <response code="200">When the search is completed successfully.</response>
        [HttpGet("all/with-status/{orderStatusId}")]
        public ActionResult<List<OrderOutputModel>> GetOrdersByStatus(int orderStatusId)
        {
            var result = _orderManager.GetOrdersByStatus(orderStatusId);
            return Ok(result);
        }
    }
}
