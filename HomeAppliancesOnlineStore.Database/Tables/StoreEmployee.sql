create table [dbo].[Store_Employee] (
	[Id] int not null primary key identity (1,1),
	[StoreId] int not null,
	[EmployeeId] int not null,
)
