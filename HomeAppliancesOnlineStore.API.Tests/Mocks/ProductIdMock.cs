using HomeAppliancesOnlineStore.API.Services;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.API.Tests.Mocks
{
    public class ProductIdMock : IEnumerable
    {
        public IEnumerator GetEnumerator()
        {
            yield return new object[]
            {
                //new ProductSearchInputModel { Id = 41242L} ,
                41242L,
                new DataAgent<List<ProductOutputModel>>()
                {
                    Data = new List<ProductOutputModel>() { new ProductOutputModel() { Id = 37163, Name = "Roboto cleaner 5050"} }
                },
                $"{string.Empty}"
            };
            yield return new object[]
            {
                //new ProductSearchInputModel { Id = -39391L} ,
                -39391L,
                new DataAgent<List<ProductOutputModel>>()
                {
                    Data = new List<ProductOutputModel>() { new ProductOutputModel() }
                },
                ResponseMessages.InvalidZeroOrNegativeValue
            };
            yield return new object[]
            {
                //new ProductSearchInputModel { Id = 0L} ,
                0L,
                new DataAgent<List<ProductOutputModel>>()
                {
                    Data = new List<ProductOutputModel>() { new ProductOutputModel() { } }
                },
                ResponseMessages.InvalidZeroOrNegativeValue
            };
            yield return new object[]
            {
                //new ProductSearchInputModel { Id = -1491084941L } ,
                -1491084941L,
                new DataAgent<List<ProductOutputModel>>()
                {
                    Data = new List<ProductOutputModel>() { new ProductOutputModel() { } }
                },
                ResponseMessages.ValueNotFound
            };

        }
    }
}
