create table [dbo].[Store] (
	[Id] int not null primary key identity (1,1),
	[Name] nvarchar(50) not null,
	[Address] nvarchar(50) not null,
	[Phone] nvarchar(20) not null,
	[Email] nvarchar(50) not null,
	[CurrencyCode] nvarchar(3) not null,
	[CityId] int not null
)
