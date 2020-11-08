create table [dbo].[Product_Store] (
	[Id] bigint not null primary key identity (1,1),
	[StoreId] int not null,
	[ProductId] bigint not null,
	[Quantity] int not null
)
