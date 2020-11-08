create table [dbo].[Order] (
	[Id] bigint not null primary key identity (1,1),
	[StoreId] int not null,
	[BuyerId] bigint not null,
	[CreationDate] datetime2 not null,
	[LastUpdate] datetime2 not null,
	[Discount] int not null,
	[DeliveryCost] decimal (28, 10) not null,
	[TotalAmount] decimal (28, 10) not null,
	[Details] nvarchar(100),
	[PaymenttypeId] int not null,
	[OrderStatusId] int not null,
	[DeliveryTypeId] int not null,
	[ShippingDate] datetime2 default null,
	[DeliveryDate] datetime2 default null,
	[ShippingCompany] nvarchar(30) 
) 

