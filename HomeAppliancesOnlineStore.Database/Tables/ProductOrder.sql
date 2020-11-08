create table [dbo].[Product_Order] (
	[Id] bigint not null primary key identity (1,1),
	[OrderId] bigint not null,
	[ProductId] bigint not null,
	[Quantity] int not null
)