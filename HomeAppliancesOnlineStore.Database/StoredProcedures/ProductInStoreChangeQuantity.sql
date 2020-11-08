create procedure [dbo].[Product_Store_ChangeQuantity]
	@ProductId bigint,
	@StoreId int,
	@Quantity int
as
	begin
	update [dbo].[Product_Store] 
	set
		[Quantity] = @Quantity
	where [Product_Store].[StoreId] = @StoreId and [Product_Store].[ProductId] = @ProductId
	select @@ROWCOUNT
	end