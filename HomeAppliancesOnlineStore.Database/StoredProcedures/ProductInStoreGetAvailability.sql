create procedure [dbo].[Product_Store_GetAvailability]
	@ProductId bigint,
	@StoreId int = null,
	@Quantity int = null
as
	begin
		if @Quantity is null and @StoreId is not null
			(select PS.[Id], PS.[StoreId], PS.[Quantity]
			from [dbo].[Product_Store] as PS
			where @ProductId = PS.[ProductId] AND @StoreId = PS.[StoreId])
		if  @StoreId is null and @Quantity is not null
			(select PS.[Id], PS.[StoreId], PS.[Quantity]
			from [dbo].[Product_Store] as PS
			where @ProductId = PS.[ProductId] AND @Quantity <= PS.[Quantity])
		if @Quantity is null and @StoreId is null
			(select PS.[Id], PS.[StoreId], PS.[Quantity]
			from [dbo].[Product_Store] as PS
			where @ProductId = PS.[ProductId])
	end

