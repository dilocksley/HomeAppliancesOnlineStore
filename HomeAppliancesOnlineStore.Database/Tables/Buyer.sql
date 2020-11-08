create table [dbo].[Buyer] (
	[Id] bigint not null primary key identity (1,1),
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[RegistrationDate] datetime2 not null,
	[LastUpdate] datetime2 not null,
	[ShippingAddress] nvarchar(50) not null,
	[Phone] nvarchar(20) not null,
	[Password] nvarchar(30) not null,
	[Email] nvarchar(50),
	[Birthday] datetime2,
	[BuyerStatusId] int not null,
	[CityId] int not null,
	[IsDeleted] bit default 0 not null
)
