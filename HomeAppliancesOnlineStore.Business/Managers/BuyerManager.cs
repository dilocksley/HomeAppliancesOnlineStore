using AutoMapper;
using HomeAppliancesOnlineStore.Business.Configuration;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core;
using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Core.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Managers
{
    public class BuyerManager : IBuyerManager
    {

        private IBuyerRepository _buyerRepo;
        private IMapper _mapper;

        public BuyerManager(IBuyerRepository repository, IMapper mapper)
        {
            _buyerRepo = repository;
            _mapper = mapper;
        }

        public DataAgent<long> AddBuyer(BuyerInputModel buyerInputModel)
        {
            var dto = _mapper.Map<BuyerDto>(buyerInputModel);
            dto.BuyerStatus = new BuyerStatusDto { Id = (int)BuyerStatus.Regular };
            var creationResult = _buyerRepo.Add(dto);
            return creationResult;
        }

        public DataAgent<int> DeleteBuyer(long buyerId)
        {
            var dto = _buyerRepo.DeleteBuyer(buyerId);
            return dto;

        }

        public void GetAllBuyers()
        {
            throw new NotImplementedException();
        }

        public DataAgent<BuyerOutputModel> GetBuyer(long buyerId)
        {
            var dto = _buyerRepo.GetBuyer(buyerId);
            var result = new BuyerOutputModel();
            if (dto.ContainsData)
            {
                result = _mapper.Map<BuyerOutputModel>(dto);
            }
            return new DataAgent<BuyerOutputModel>
            {
                Data = result,
                ResponseMessage = dto.ResponseMessage
            };
        }

        public long GetBuyersCount()
        {
            throw new NotImplementedException();
        }

        public DataAgent<long> UpdateBuyer(BuyerInputModel buyerInputModel)
        {
            var dto = _mapper.Map<BuyerDto>(buyerInputModel);
            var updateResult = _buyerRepo.Update(dto);
            return updateResult;
        }
    }
}
