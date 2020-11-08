create procedure [Products_Data_Fill]
as
	begin
	declare 
	@PublicationTime datetime2 = SYSUTCDATETIME()
	--Blender
		insert into [dbo].[Product]
			([Name],[Price],[Manufacturer],[ManufacturingYear],[Depth],[Width],[Height],[Weight],[Wattage],[Voltage],[DetachableBlades],[Programmable],
			[PublicationDate], [LastUpdate], [IsPublished])
		values
           ('Old-Fashioned Blender', 1500, 'Philips', 2010, 25, 15, 25, 10, 1000, 220, 'Set of 6 metal baldes' , '3 regimes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name],[Price],[Manufacturer],[ManufacturingYear],[Depth],[Width],[Height],[Weight],[Wattage],[Voltage],[DetachableBlades],[Programmable],
			[PublicationDate], [LastUpdate], [IsPublished])
		values
           ('Classic Blender', 3200, 'Philips', 2017, 30, 30, 30, 11, 1000, 220, 'Set of 6 metal baldes' , '3 regimes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name],[Price],[Manufacturer],[ManufacturingYear],[Depth],[Width],[Height],[Weight],[Wattage],[Voltage],[DetachableBlades],[Programmable],
			[PublicationDate], [LastUpdate], [IsPublished])
		values
           ('SuperNova Blender', 6421, 'Philips', 2020, 19, 32, 30, 15, 1000, 220, 'Set of 6 metal baldes' , '3 regimes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name],[Price],[Manufacturer],[ManufacturingYear],[Depth],[Width],[Height],[Weight],[Wattage],[Voltage],[DetachableBlades],[Programmable],
			[PublicationDate], [LastUpdate], [IsPublished])
		values
           ('Ultra powerful Blender', 7809, 'Philips', 2019, 30, 45, 30, 25, 2500, 220, 'Set of 12 sharp metal baldes','7 regimes' , @PublicationTime, @PublicationTime, 1)
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage], [DetachableBlades],[Programmable],
			[PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Mini blender', 4213, 'Philips', 2018, 15, 15, 15, 4, 1000, 220, 'Set of 6 metal baldes' , '3 regimes', @PublicationTime, @PublicationTime, 1 )
		--Coffee makers
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[EspressoType], [SteamNozzle], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Coffee maker', 24552, 'DeLonghi', 2018, 42, 31, 15, 5, 1200, 220,
		   'Coffee beans' , 'White nozzle', '7 built in regimes',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[EspressoType], [SteamNozzle], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Coffee machine 2000 Gold', 36781, 'DeLonghi', 2020, 42, 31, 21, 11, 1600, 220,
		   'Capsule' , 'Grey nozzle', '5 built in regimes',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[EspressoType], [SteamNozzle], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Coffee maker Essential', 30192, 'DeLonghi', 2019, 21, 45, 23, 6, 1970, 220,
		   'Coffee beans' , 'Capuccinator nozzle', '9 built in regimes',  @PublicationTime, @PublicationTime, 1 )
	end
go
