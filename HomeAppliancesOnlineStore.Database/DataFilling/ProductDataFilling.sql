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
	--BlowDryer
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[CoolShotButton], [RemovableEndCap], [DiffuserNozzle], [SpeedSetting], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Super blow', 1702, 'Energy', 2018, 10, 41, 10, 1, 1200, 220,
		   'Yes' , 'plastic end cup', '2 changable nozzles', '2 speeds', 'acrylic travel bag',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[CoolShotButton], [RemovableEndCap], [DiffuserNozzle], [SpeedSetting], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Glossy hair', 3500, 'Babyliss', 2020, 10, 31, 10, 1, 1500, 220,
		   'Yes' , 'metal end cup', '7 pro changable nozzles', '3 speeds', 'plastic travel bag',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[CoolShotButton], [RemovableEndCap], [DiffuserNozzle], [SpeedSetting], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Compactable dryer', 1402, 'Marta', 2019, 15, 45, 10, 1, 1300, 220,
		   'Yes' , 'plastic end cup', '1 changable nozzle', '1 speeds', 'cotton travel bag',  @PublicationTime, @PublicationTime, 1 )
	--Coffee makers
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[EspressoType], [SteamNozzle], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Coffee maker Classico', 24552, 'DeLonghi', 2018, 42, 31, 15, 5, 1200, 220,
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
	--Dishwasher
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[ThirdRack], [CupClips], [SilverwareBasket], [StemwareHolders], [UtensilSeparator], [QuickWashCycle], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Super clean', 10200, 'Panasonic', 2018, 50, 41, 60, 7, 1700, 220,
		   'One', 'Not available', 'Removable', 'At additional cost', 'Yes', 'Quick wash for 45 min', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[ThirdRack], [CupClips], [SilverwareBasket], [StemwareHolders], [UtensilSeparator], [QuickWashCycle], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Glossy plates', 15094, 'Bosh', 2020, 38, 31, 50, 10, 2000, 220,
		   'Two', '15 cup clips', 'Built in', 'Plastic', 'No', 'Quick wash for 35 min',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[ThirdRack], [CupClips], [SilverwareBasket], [StemwareHolders], [UtensilSeparator], [QuickWashCycle], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Universal dishwasher', 13290, 'Gorenjie', 2019, 55, 45, 65, 11, 2500, 220,
		   'One', '7 cup clips', 'Built in', 'Metal', 'Yes', 'Quick wash for 55 min', @PublicationTime, @PublicationTime, 1 )
	--ElectricKettle
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[WaterLevelWindow], [RemovableTeaInfuser], [FullCircleConnectorOnThePowerbase], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Classic teapot', 920, 'Marta', 2018, 20, 10, 22, 1, 1000, 220,
		   '10 cm window', 'No tea infuser', '360 degrees plastic connector', '1 built in program',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[WaterLevelWindow], [RemovableTeaInfuser], [FullCircleConnectorOnThePowerbase], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Glass kettle', 1390, 'Vitek', 2019, 20, 10, 22, 1, 1100, 220,
		   'Full glass window', '1 tea infuser', '360 degrees plastic connector', '2 tempreratures for 100 and 75 degrees',  @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[WaterLevelWindow], [RemovableTeaInfuser], [FullCircleConnectorOnThePowerbase], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Smart tea kettle', 2700, 'Toshiba', 2020, 20, 10, 22, 1, 1200, 220,
		   '15 cm window', '2 tea infusers', '360 degrees metallic connector', '3 programs for 75/85/95 temperatures',  @PublicationTime, @PublicationTime, 1 )
	--ElectricShaver
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[PivotingHead], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Classic teapot', 920, 'Venus', 2018, 5, 7, 22, 1, 800, 220,
		   'Sensetive pivoting head', 'Compact plastic bag', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[PivotingHead], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Classic teapot', 920, 'Razor', 2019, 5, 7, 22, 1, 1000, 220,
		   '360 degrees turnable head', 'Soft velvet bag', @PublicationTime, @PublicationTime, 1 )
	--Iron
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[NonStickSoleplate], [AntiDripSystem], [TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Ultra Power Iron 2000', 1920, 'Vitek', 2018, 7, 22, 14, 1, 800, 220,
		   'Keramic plate', 'Full cover system', 'Compact plastic bag', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[NonStickSoleplate], [AntiDripSystem],[TravelBag], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Steamy friend', 3780, 'Panasonic', 2019, 7, 11, 35, 2, 1400, 220,
		   'Titan', 'All soleplate system', 'Carton bag', @PublicationTime, @PublicationTime, 1 )
	--Microwave
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[Defrost], [Grill], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Microwave 5000', 11920, 'Gorenjie', 2019, 25, 32, 22, 5, 1200, 220,
		   '3 types', 'universal regime', '7 programs', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[Defrost], [Grill], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Microwave 7800', 15920, 'Bosh', 2019, 25, 32, 22, 5, 1200, 220,
		   '2 types', 'one regime', '11 programs', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[Defrost], [Grill], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Ultra power', 21920, 'Samsung', 2020, 25, 32, 22, 5, 2000, 220,
		   '3 types', 'Different regimes for meat and fish', '17 programs', @PublicationTime, @PublicationTime, 1 )
	--PressureCooker
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[RemovableBasket], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Ultra cooker', 11920, 'Gorenjie', 2019, 25, 32, 22, 5, 1200, 220,
		   '2 baskets', '9 cooking programs', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[RemovableBasket], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Multi cooker', 15920, 'Bosh', 2019, 25, 32, 22, 5, 1200, 220,
		   '3 baskets', '15 cooking programs', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[RemovableBasket], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Multi Pressure Cooker', 21920, 'Samsung', 2020, 25, 32, 22, 5, 2000, 220,
		   '5 baskets', '17 cooking  programs', @PublicationTime, @PublicationTime, 1 )
	--Refrigerator
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[IceMaker], [Freezer], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Compact studio fridge', 5920, 'Bosh', 2019, 40, 60, 80, 7, 1200, 220,
		   'Manual', 'One section', '3 temperatures regimes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[IceMaker], [Freezer], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Kitchen fridge Homy', 12120, 'Stinol', 2018, 60, 50, 110, 10, 1800, 220,
		   'Manual', 'Two sections', '4 temperatures regimes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[IceMaker], [Freezer], [Programmable], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Pro Keeper', 17700, 'Libher', 2020, 55, 60, 120, 12, 2000, 220,
		   'Automatic', '4 sections', '6 temperatures regimes, defrost program available', @PublicationTime, @PublicationTime, 1 )
	--RobotVacuum
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[ProtectiveBumpers], [AppControlled], [RoomByRoomNavigation], [DustCupCapacity], [WetCleaning], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Roboto friend', 15920, 'Huawei', 2019, 40, 40, 13, 5, 1200, 220,
		   'Four bumpers', 'Yes', 'Program up to 4 rooms', '1.2 dry quarts, HEPA filter', 'Yes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[ProtectiveBumpers], [AppControlled], [RoomByRoomNavigation], [DustCupCapacity], [WetCleaning], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Smart roboto cleaner', 14920, 'Xiomi', 2020, 35, 35, 15, 7, 1200, 220,
		   'Four bumpers', 'Yes', 'Program up to 4 rooms', '1 dry quarts, Miele filter', 'Yes', @PublicationTime, @PublicationTime, 1 )
	--VacuumCleaner
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[AdjustableSuction], [CombinationNozzle], [RetractableCord], [DustCupCapacity], [WetCleaning], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Power suction 5700', 5612, 'Samsung', 2019, 40, 40, 80, 5, 1200, 220,
		   '2 regimes', '3 nozzles', '3 m cord', '1.5 dry quarts, HEPA filter', 'Yes', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[AdjustableSuction], [CombinationNozzle], [RetractableCord], [DustCupCapacity], [WetCleaning], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Ultra cleaner', 9758, 'Miele', 2020, 35, 35, 76, 7, 1200, 220,
		   '3 regimes', '5 nozzles', '5 m cord', '2 dry quarts, Miele filter', 'No', @PublicationTime, @PublicationTime, 1 )
	--Washer
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[BleachDispenser], [VibrationReduction], [CylinderCapacity], [QuickWashCycle], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Super washer', 5612, 'Indesit', 2019, 40, 40, 80, 5, 1800, 220,
		   '1 section', 'Yes', '1500cc', '35 min', @PublicationTime, @PublicationTime, 1 )
		insert into [dbo].[Product]
			([Name], [Price], [Manufacturer], [ManufacturingYear], [Depth], [Width], [Height], [Weight], [Wattage], [Voltage],
			[BleachDispenser], [VibrationReduction], [CylinderCapacity], [QuickWashCycle], [PublicationDate], [LastUpdate], [IsPublished])
		values 
           ('Ultra washer', 9612, 'Bosh', 2020, 50, 50, 85, 5, 2000, 220,
		   '1 section', 'Yes', '200cc', '30 min', @PublicationTime, @PublicationTime, 1 )
	end
go
