using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using HomeAppliancesOnlineStore.API.Services;
using HomeAppliancesOnlineStore.API.Services.Validation;
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
    public class ProductController : Controller
    {
        private IProductManager _productManager;
        private ProductValidation _productValidator;
        private CategoryValidation _categoryValidation;

        public ProductController(IProductManager productManager, ProductValidation productValidation, CategoryValidation categoryValidation)
        {
            _productManager = productManager;
            _productValidator = productValidation;
            _categoryValidation = categoryValidation;
        }

        /// <summary>
        /// Adds a new Product to the database which isn't published.
        /// </summary>
        /// <param name="productInputModel">All the mandatory properties of the Product must be filled.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the newly added Product.</returns>
        /// <response code="201">When the Product is successfully created.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        /// /// <example>
        /// <code>
        /// {
        ///      "Name" : "Vacuum Cleaner Roboto 7700",
        ///      "Price" : 15096,
        ///      "Manufacturer" : "Philips",
        ///      "ManufacturingYear": 2017,
        ///      "Depth" : 10,
        ///      "Width" : 15,
        ///      "Height" : 20,
        ///      "Weight" : 25,
        ///      "Wattage" : 30,
        ///      "Voltage" : 220,
        ///      "RoomByRoomNavigation" : "Yes",
        ///      "AppControlled" : "Yes",
        ///      "ProtectiveBumpers" : "Six Protective bumpers"
        ///  }
        /// </code>
        /// </example>
        [HttpPost("add/new")]
        public ActionResult<long> AddProduct([FromBody] ProductInputModel productInputModel)
        {
            var validationResult = _productValidator.ValidateProductInputModelUponCreation(productInputModel);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.AddProduct(productInputModel);
            if (!result.ContainsData)
            {
                return Problem(detail: result.ResponseMessage, statusCode: 520);
            }
            return Created($"id/{result.Data}", result.Data);
        }


        /// <summary>
        /// Updates an existing Product in the database.
        /// </summary>
        /// <param name="productInputModel">Any fields of the Product wished to be updated.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the updated Product.</returns>
        /// <response code="200">When the Product information is successfully updated.</response>
        /// <response code="404">If Product wasn't found.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        /// {
        ///      "Id" : 1,
        ///      "Name" : "Fridge",
        ///      "IsPublished" : false,
        ///      "IceMaker" : "Yes"
        ///  }
        /// </code>
        /// </example>
        [HttpPut("update")]
        public ActionResult<long> UpdateProductInfo([FromBody] ProductInputModel productInputModel)
        {
            var validationResult = _productValidator.ValidateProductInputModelUponUpdate(productInputModel);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.UpdateProductInfo(productInputModel);
            return MakeResponse<long, long>(result);
        }


        /// <summary>
        /// Soft deletes the existing product by making IsPublished field false.
        /// Also deleted all the records about the Product in all the stores.
        /// </summary>
        /// <param name="id">An Id of the Product wished to be not published.</param>
        /// <returns>ProductOutputModel including Product's Id, Name and IsPublished state.</returns>
        /// <response code="200">When the Product publication status is successfully changed to not published.</response>
        /// <response code="404">If Product wasn't found.</response>
        /// <response code="422">If id wasn't validated.</response>
        /// <response code="520">If problem occured.</response>
        [HttpDelete("delete/{id}")]
        public ActionResult<ProductOutputModel> DeleteProduct(long id)
        {
            var validationResult = _productValidator.ValidateProductId(id);
            if(!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.DeleteProduct(id);
            return MakeResponse<ProductOutputModel, ProductOutputModel>(result);
        }


        /// <summary>
        /// Adds Product record to store. Makes the Product published.
        /// </summary>
        /// <param name="productInStoreInputModel">Contains id of the Product and corressponding store id with quantity amount.</param>
        /// <returns>A 64-bit positive integer, representing the Id of the newly added record.</returns>
        /// <response code="201">When the record is successfully created.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        /// {
        ///     "ProductId" : 1,
        ///     "StoreId" : 2,
        ///     "Quantity" : 40
        ///  }
        /// </code>
        /// </example>
        [HttpPost("add/in/store")]
        public ActionResult<long> AddProductToStore([FromBody] ProductInStoreInputModel productInStoreInputModel)
        {
            var validationResult = _productValidator.ValidateProductStoreInputModelUponCreationOrUpdate(productInStoreInputModel);
            validationResult += _productValidator.ValidateExistingRecord(productInStoreInputModel.ProductId, (int)productInStoreInputModel.StoreId);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.AddProductToStore(productInStoreInputModel);
            if (!result.ContainsData)
            {
                return Problem(detail: result.ResponseMessage, statusCode: 520);
            }
            return Created($"id/{result.Data}", result.Data);
        }


        /// <summary>
        /// Gets the Product quantity in certain store.
        /// </summary>
        /// <param name="productInStore">Includes Product Id and Store Id.</param>
        /// <returns>A 32-bit positive integer, representing the amount of Prodcut in the store.</returns>
        /// <response code="200">When the amount is recieved successfully.</response>
        /// <response code="404">If no records were found.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        ///  {
        ///     "ProductId" : 1,
        ///     "StoreId" : 2
        ///  }
        /// </code>
        /// </example>
        [HttpGet("quantity")]
        public ActionResult<List<ProductInStoreOutputModel>> GetProductQuantityInStore(ProductInStoreInputModel productInStore)
        {
            var validationResult = _productValidator.ValidateProductStoreInputModelUponGettingAvailability(productInStore);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.GetAvailabilityOfProductInStore(productInStore);
            return MakeResponse<List<ProductInStoreOutputModel>, List<ProductInStoreOutputModel>>(result);
        }


        /// <summary>
        /// Changes Product quantity amount in specific store.
        /// </summary>
        /// <param name="productInStoreInputModel">Contains id of the Product, store id and new quantity amount.</param>
        /// <returns>A 32-bit positive integer, representing the number of affected records.</returns>
        /// <response code="201">When the record has been successfully updated.</response>
        /// <response code="404">If no records were found.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        /// {
        ///     "ProductId" : 1,
        ///     "StoreId" : 2,
        ///     "Quantity" : 35
        ///  }
        /// </code>
        /// </example>
        [HttpPut("quantity/in/store/change")]
        public ActionResult<int> ChangeProductQuantityInStore([FromBody] ProductInStoreInputModel productInStoreInputModel)
        {
            var validationResult = _productValidator.ValidateProductStoreInputModelUponCreationOrUpdate(productInStoreInputModel);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.ChangeProductQuantityInStore(productInStoreInputModel);
            return MakeResponse<int, int>(result);
        }


        /// <summary>
        /// Finds product by selected сriteria.
        /// </summary>
        /// <param name="productInputModel">Any searching fields of the Product.</param>
        /// <returns>A list of found Products with full information about it.</returns>
        /// <response code="200">When the search is successful and list is composed.</response>
        /// <response code="422">If input parameters weren't validated.</response>
        /// <response code="404">If no product was found.</response>
        /// <response code="520">If problem occured.</response>
        /// <example>
        /// <code>
        /// {
        ///      "name": "CoffeeMaker",
        ///      "isPublished": true,
        ///      "manufacturingYearEnd": 2019,
        ///      "PublicationDateStart": "01.01.2000",
        ///      "lastUpdateStart": "01.01.2020"
        ///  }
        /// </code>
        /// </example>
        [HttpGet("search")]
        public ActionResult<List<ProductOutputModel>> FindProducts([FromBody] ProductSearchInputModel productInputModel)
        {
            var validationResult = _productValidator.ValidateProductSearchInputModel(productInputModel);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.FindProducts(productInputModel);
            return MakeResponse<List<ProductOutputModel>, List<ProductOutputModel>>(result);
        }


        /// <summary>
        /// Gets all the Products of a provided category defined by a set of сriteria.
        /// </summary>
        /// <param name="productCategory">Sougth category.</param>
        /// <returns>A list of Products in the category.</returns>
        /// <response code="200">When the Product Category is established correctly and the list is composed.</response>
        /// <response code="422">If category parameter wasn't validated.</response>
        /// <response code="404">If no products were found.</response>
        /// <response code="520">If problem occured.</response>
        [HttpGet("all/in/category/{productCategory}")]
        public ActionResult<List<ProductOutputModel>> GetListOfProductsOfCertainCategory(int productCategory)
        {
            var validationResult = _categoryValidation.ValidateProductCategory(productCategory);
            if (!string.IsNullOrEmpty(validationResult))
            {
                return UnprocessableEntity(validationResult);
            }
            var result = _productManager.GetProductsOfOneCategory(productCategory);

            return MakeResponse<List<ProductOutputModel>, List<ProductOutputModel>>(result);
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
