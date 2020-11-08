create procedure [dbo].[Order_Create]
	@StoreId int,
	@BuyerId bigint,
	@Discount int,
	@DeliveryCost decimal (28, 10),
	@TotalAmount decimal (28, 10),
	@Details nvarchar(100) = null,
	@PaymenttypeId int,
	@DeliveryTypeId int,
	@ShippingDate datetime2 = null,
	@DeliveryDate datetime2 = null,
	@ShippingCompany nvarchar (50) = null
as
begin
	declare @CreationTime datetime2 = SYSUTCDATETIME()
	declare @OrderId bigint
	declare @OrderStatusId int = 1
	insert into [dbo].[Order] (
		[StoreId],
		[BuyerId],
		[CreationDate],
		[LastUpdate],
		[Discount],
		[DeliveryCost],
		[TotalAmount],
		[Details],
		[PaymenttypeId],
		[OrderStatusId],
		[DeliveryTypeId],
		[ShippingDate],
		[DeliveryDate],
		[ShippingCompany] 
		)
	values (
		@StoreId,
		@BuyerId,
		@CreationTime,
		@CreationTime,
		@Discount,
		@DeliveryCost,
		@TotalAmount,
		@Details,
		@PaymenttypeId,
		@OrderStatusId,
		@DeliveryTypeId,
		@ShippingDate,
		@DeliveryDate,
		@ShippingCompany
		)
	select SCOPE_IDENTITY() as [OrderId]
end
