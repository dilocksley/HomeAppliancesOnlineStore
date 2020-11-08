create procedure [dbo].[Order_Update]
	@Id bigint,
	@Discount int = null,
	@DeliveryCost decimal (28, 10) = null,
	@TotalAmount decimal (28, 10) = null,
	@Details nvarchar(100) = null,
	@OrderStatusId int = null,
	@DeliveryTypeId int = null,
	@ShippingDate datetime2 = null,
	@DeliveryDate datetime2 = null,
	@ShippingCompany nvarchar (50) = null
as
begin
	declare 
	    @UpdateTime datetime2 = SYSUTCDATETIME()
	update [dbo].[Order] 
		 set
		 [Discount] = case when @Discount is not null then @Discount else [Discount] end,
		 [DeliveryCost] = case when @DeliveryCost is not null then @DeliveryCost else [DeliveryCost] end,
		 [TotalAmount] = case when @TotalAmount is not null then @TotalAmount else [TotalAmount] end,
		 [Details] = case when @Details is not null then @Details else [Details] end,
		 [OrderStatusId] = case when @OrderStatusId is not null then @OrderStatusId else [OrderStatusId] end,
		 [DeliveryTypeId] = case when @DeliveryTypeId is not null then @DeliveryTypeId else [DeliveryTypeId] end,
		 [ShippingDate] = case when @ShippingDate is not null then @ShippingDate else [ShippingDate] end,
		 [DeliveryDate] = case when @DeliveryDate is not null then @DeliveryDate else [DeliveryDate] end,
		 [ShippingCompany] = case when @ShippingCompany is not null then @ShippingCompany else [ShippingCompany] end,
		 [LastUpdate] = @UpdateTime
		 where
        [Id] = @Id
     select O.[Id]
	    from [dbo].[Order] AS O
	    where (@Id = O.Id)
end