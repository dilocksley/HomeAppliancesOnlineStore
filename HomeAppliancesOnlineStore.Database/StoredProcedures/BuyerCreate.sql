create procedure [dbo].[Buyer_Create]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@ShippingAddress nvarchar(50),
	@Phone nvarchar(20),
	@Password nvarchar (30),
	@Email nvarchar(50) = null,
	@Birthday datetime2 = null,
	@CityId int,
	@BuyerStatusId int
as
begin
	declare @RegistrationDate datetime2 = SYSUTCDATETIME()
	insert into [dbo].[Buyer] (
		[FirstName],
		[LastName],
		[RegistrationDate],
		[LastUpdate],
		[ShippingAddress],
		[Phone],
		[Password],
		[Email],
		[Birthday],
		[IsDeleted],
		[CityId],
		[BuyerStatusId]
	)
	values(
		@FirstName,
		@LastName,
		@RegistrationDate,
		@RegistrationDate,
		@ShippingAddress,
		@Phone,
		@Password,
		@Email,
		@Birthday,
		0,
		@CityId,
		@BuyerStatusId
		)
end
	select SCOPE_IDENTITY() 
