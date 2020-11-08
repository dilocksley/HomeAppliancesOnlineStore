create procedure [dbo].[Product_AddToStore]
	@ProductId bigint,
	@StoreId int,
	@Quantity int
as
	begin 
		insert into [dbo].[Product_Store] 
			(
				[StoreId], 
				[ProductId], 
				[Quantity]
			)
		values (@StoreId, @ProductId, @Quantity)
		select SCOPE_IDENTITY() as [ProductInStore]
end