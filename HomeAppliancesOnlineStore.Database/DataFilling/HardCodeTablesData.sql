create procedure [HardCode_Tables_Data]
as
	begin
		insert into [dbo].[PaymentType] ( [Name]) values ('Cash upon delivery')
		insert into [dbo].[PaymentType]  ( [Name]) values ('Credit card online') 
		insert into [dbo].[PaymentType]  ( [Name]) values ('Credit card upon delivery')

		insert into [dbo].[OrderStatus] ([Name]) values ('Created')
		insert into [dbo].[OrderStatus] ([Name]) values ('Packing')
		insert into [dbo].[OrderStatus] ([Name]) values ('In delivery')
		insert into [dbo].[OrderStatus] ([Name]) values ('Completed')
		insert into [dbo].[OrderStatus] ([Name]) values ('Cancelled')

		insert into [dbo].[DeliveryType] ([Name]) values ('Customer pick up')
		insert into [dbo].[DeliveryType] ([Name]) values ('Delivery')

		insert into [dbo].[BuyerStatus] ([Name], [Discount]) values ('Regular', 0)
		insert into [dbo].[BuyerStatus] ([Name], [Discount]) values ('Bronze', 3)
		insert into [dbo].[BuyerStatus] ([Name], [Discount]) values ('Silver', 7)
		insert into [dbo].[BuyerStatus] ([Name], [Discount]) values ('Gold', 10)
		insert into [dbo].[BuyerStatus] ([Name], [Discount]) values ('Diamond', 15)
		
		insert into [dbo].[City] ([Name]) values ('Saint-Petersburg')
		insert into [dbo].[City] ([Name]) values ('Moscow')
		insert into [dbo].[City] ([Name]) values ('Minsk')
		insert into [dbo].[City] ([Name]) values ('Kiev')
		insert into [dbo].[City] ([Name]) values ('Smolensk')

		insert into [dbo].[Position] ([Name]) values ('Manager')
		insert into [dbo].[Position] ([Name]) values ('Salesman')
		insert into [dbo].[Position] ([Name]) values ('Courier')

		insert into [dbo].[Currency] ([Code], [Name]) values ('RUB', 'Russian ruble')
		insert into [dbo].[Currency] ([Code], [Name]) values ('BYR', 'Belarusian ruble')
		insert into [dbo].[Currency] ([Code], [Name]) values ('UAH', 'Ukrainian hryvnia')

		insert into [dbo].[Store] ([Name], [Address], [Phone], [Email], [CurrencyCode], [CityId]) 
			values ('Home Appliances Spb', 'Nevsky pr. 25', '78121597562', 'homeappliances.spb@mail.ru', 'RUB', 1)
		insert into [dbo].[Store] ([Name], [Address], [Phone], [Email], [CurrencyCode], [CityId]) 
			values ('Home Appliances Moscow', 'Chistyie prudi 14', '74951296748', 'homeappliances.moscow@mail.ru', 'RUB', 2)
		insert into [dbo].[Store] ([Name], [Address], [Phone], [Email], [CurrencyCode], [CityId]) 
			values ('Home Appliances Minsk', 'Lenina st. 5', '3751632489', 'homeappliances.minsk@rambler.ru', 'BYR', 3)
		insert into [dbo].[Store] ([Name], [Address], [Phone], [Email], [CurrencyCode], [CityId]) 
			values ('Home Appliances Kiev', 'Khretschatil st. 14', '3804569763', 'homeappliances.kiev@gmail.com', 'UAH', 4)
		insert into [dbo].[Store] ([Name], [Address], [Phone], [Email], [CurrencyCode], [CityId]) 
			values ('Storage', 'Smolensk, Mira st. 21', '468875962', 'homeappliances.storage@mail.ru', 'RUB', 5)
	end