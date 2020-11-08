using HomeAppliancesOnlineStore.API.Services.Validation;
using HomeAppliancesOnlineStore.API.Tests.Mocks;
using HomeAppliancesOnlineStore.Business.Managers;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using Moq;
using NUnit.Framework;
using System.Collections.Generic;


namespace HomeAppliancesOnlineStore.API.Tests.ValidationTests.ProductValidationTests
{
    [TestFixture]
    public class ProductIdValidationTest
    {
        private ProductValidation _validator;
        private StoreValidation _storeValidator;
        private Mock<IProductManager> _manager;
        public void Setup()
        {
            _manager = new Mock<IProductManager>();
            _storeValidator = new StoreValidation();
            _validator = new ProductValidation(_manager.Object, _storeValidator);
        }


        [TestCaseSource(typeof(ProductIdMock))]
        public void ProductIdtValidationIsCorrect(long product, DataAgent<List<ProductOutputModel>> model, string expected)
        {
            // Given

            _manager.Setup(m => m.FindProducts(new ProductSearchInputModel { Id = product })).Returns(model);
           // _manager.SetReturnsDefault(model);
            // When

            string actual = _validator.ValidateProductId(product);

            // Then
            Assert.IsTrue(model.ContainsData);
            Assert.AreEqual(expected, actual);
        }
    }
}
