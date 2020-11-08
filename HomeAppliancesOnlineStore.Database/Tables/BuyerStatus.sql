create table [dbo].[BuyerStatus] (
	[Id] int not null primary key identity (1,1),
	[Name] nvarchar(20) not null,
	[Discount] int not null
)