using AutoMapper;
using AutoMapper.Collection;
using AutoMapper.EquivalencyExpression;
using AutoMapper.Internal;
using HomeAppliancesOnlineStore.Business.Models.Input;
using HomeAppliancesOnlineStore.Business.Models.Output;
using HomeAppliancesOnlineStore.Core.DTO;
using HomeAppliancesOnlineStore.Data.DTO;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace HomeAppliancesOnlineStore.Business.Configuration
{
    public class MappingProfile : Profile
    {
        private const string _yearDateFormat = "yyyy";
        private const string _shortDateFormat = "dd.MM.yyyy";
        private const string _longDateFormat = "dd.MM.yyyy HH:mm:ss";

        public MappingProfile()
        {
            CreateMap<ProductInputModel, ProductDto>();

            CreateMap<ProductDto, ProductOutputModel>()
                .ForPath(dest => dest.PublicationDate, o => o.MapFrom(src => src.PublicationDate.ToString(_shortDateFormat)))
                .ForPath(dest => dest.LastUpdate, o => o.MapFrom(src => src.LastUpdate.ToString(_shortDateFormat)))
                ;

            CreateMap<ProductInStoreInputModel, ProductStoreDto>();

            CreateMap<ProductStoreDto, ProductInStoreOutputModel>();
            
            CreateMap<ProductSearchInputModel, ProductSearchDto>()
              .ForPath(dest => dest.PublicationDateStart, o => o.MapFrom(src => src.PublicationDateStart != null ? (DateTime?)DateTime.
                ParseExact(src.PublicationDateStart, _shortDateFormat, CultureInfo.InvariantCulture) : null))
              .ForPath(dest => dest.PublicationDateEnd, o => o.MapFrom(src => src.PublicationDateEnd != null ? (DateTime?)DateTime.
                ParseExact(src.PublicationDateEnd, _shortDateFormat, CultureInfo.InvariantCulture) : null))
              .ForPath(dest => dest.LastUpdateStart, o => o.MapFrom(src => src.LastUpdateStart != null ? (DateTime?)DateTime.
                ParseExact(src.LastUpdateStart, _shortDateFormat, CultureInfo.InvariantCulture) : null))
              .ForPath(dest => dest.LastUpdateEnd, o => o.MapFrom(src => src.LastUpdateEnd != null ? (DateTime?)DateTime.
                ParseExact(src.LastUpdateEnd, _shortDateFormat, CultureInfo.InvariantCulture) : null))
              ;

            CreateMap<ProductInOrderInputModel, ProductStoreDto>();

            CreateMap<BuyerInputModel, BuyerDto>()
               .ForPath(dest => dest.Birthday, o => o.MapFrom(src => DateTime.ParseExact(src.Birthday, _shortDateFormat, CultureInfo.InvariantCulture)))
               .ForPath(dest => dest.City, o => o.MapFrom(src => new CityDto() { Id = (int)src.CityId }))
               .ForPath(dest => dest.BuyerStatus, o => o.MapFrom(src => src.BuyerStatusId != null ? (new BuyerStatusDto() { Id = (int)src.BuyerStatusId }) :
               (new BuyerStatusDto() {})))
               ;
                
            CreateMap<BuyerDto, BuyerOutputModel>()
             .ForPath(dest => dest.RegistrationDate, o => o.MapFrom(src => src.RegistrationDate.Value.ToString(_shortDateFormat)))
             .ForPath(dest => dest.LastUpdate, o => o.MapFrom(src => src.LastUpdate.Value.ToShortDateString()))
             .ForPath(dest => dest.Birthday, o => o.MapFrom(src => src.Birthday.Value.ToString(_shortDateFormat)))
             .ForPath(dest => dest.BuyerStatusName, o => o.MapFrom(src => src.BuyerStatus.Name))
             .ForPath(dest => dest.BuyerStatusDiscount, o => o.MapFrom(src => src.BuyerStatus.Dicscount))
             .ForPath(dest => dest.CityName, o => o.MapFrom(src => src.City.Name))
             ;

            CreateMap<OrderInputModel, OrderDto>()
                .ForPath(dest => dest.PaymentType, o => o.MapFrom(src => new PaymentTypeDto() { Id = src.PaymentType }))
                .ForPath(dest => dest.DeliveryType, o => o.MapFrom(src => new DeliveryTypeDto() { Id = src.DeliveryType }))
            ;

        }
    }
}
