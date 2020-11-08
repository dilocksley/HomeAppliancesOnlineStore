using Autofac;
using HomeAppliancesOnlineStore.API.Services.Validation;
using HomeAppliancesOnlineStore.Business.Managers;
using HomeAppliancesOnlineStore.Core.Repositories;
using SqlKata.Compilers;
using SqlKata.Execution;

namespace HomeAppliancesOnlineStore.API.Configuration
{
    public class AutofacConfig : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<ProductRepository>().As<IProductRepository>().SingleInstance();
            builder.RegisterType<BuyerRepository>().As<IBuyerRepository>().SingleInstance();
            builder.RegisterType<OrderRepository>().As<IOrderRepository>().SingleInstance();
            
            builder.RegisterType<ProductManager>().As<IProductManager>().SingleInstance();
            builder.RegisterType<BuyerManager>().As<IBuyerManager>().SingleInstance();
            builder.RegisterType<OrderManager>().As<IOrderManager>().SingleInstance();
            builder.RegisterType<ProductCategoryManager>().As<ICategoryManager>().SingleInstance();

            builder.RegisterType<ProductValidation>().SingleInstance();
            builder.RegisterType<StoreValidation>().SingleInstance();
            builder.RegisterType<CategoryValidation>().SingleInstance();


            //builder.RegisterType<QueryFactory>().SingleInstance();
            builder.RegisterType<SqlServerCompiler>().SingleInstance();
        }
    }
}
