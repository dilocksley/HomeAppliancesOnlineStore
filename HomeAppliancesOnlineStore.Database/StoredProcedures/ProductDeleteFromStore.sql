create procedure [dbo].[Product_DeleteFromStore]
	@ProductId bigint
as
	delete 
	from [dbo].[Product_Store] 
	where [Product_Store].ProductId = @ProductId
	select @@ROWCOUNT
