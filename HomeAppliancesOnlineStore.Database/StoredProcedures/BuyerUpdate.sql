create procedure [dbo].[Buyer_Update]
	@Id bigint ,
	@FirstName nvarchar(50) = null,
	@LastName nvarchar(50) = null,
	@ShippingAddress nvarchar(50) = null,
	@Phone nvarchar(20) = null,
	@Password nvarchar (30) = null,
	@Email nvarchar(50) = null,
	@Birthday datetime2 = null,
	@CityId int = null,
	@BuyerStatusId int = null
as
begin
	declare @LastUpdate datetime2 = SYSUTCDATETIME()
	update [dbo].[Buyer] 
		 set
		 [FirstName] = case when @FirstName is not null then @FirstName else [FirstName] end,
		 [LastName] = case when @LastName is not null then @LastName else [LastName] end,
		 [ShippingAddress] = case when @ShippingAddress is not null then @ShippingAddress else [ShippingAddress] end,
		 [Phone] = case when @Phone is not null then @Phone else [Phone] end,
		 [Password] = case when @Password is not null then @Password else [Password] end,
		 [Email] = case when @Email is not null then @Email else [Email] end,
		 [Birthday] = case when @Birthday is not null then @Birthday else [Birthday] end,
		 [LastUpdate] = @LastUpdate,
		 [CityId] = case when @CityId is not null then @CityId else CityId end,
		 [BuyerStatusId] = case when @BuyerStatusId is not null then @BuyerStatusId else [BuyerStatusId] end
		 where
		[Id] = @Id
		select @Id
end