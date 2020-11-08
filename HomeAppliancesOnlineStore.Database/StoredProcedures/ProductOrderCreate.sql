create procedure [dbo].[Product_Order_Create]
	@OrderId bigint,
	@ProductId bigint,
	@Quantity int
as
begin
	insert into [dbo].[Product_Order] (
		[OrderId],
		[ProductId],
		[Quantity])
	values (	@OrderId, @ProductId, @Quantity)
	select scope_identity()
end
