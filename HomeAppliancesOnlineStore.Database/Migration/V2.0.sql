create table [dbo].[DbVersions] 
(
    [Id] int not null primary key identity (1,1),
    [CreationDate] datetime2 default sysutcdatetime(),
    [Version] decimal(28,10)  not null 
);

if (select top(1) Version from dbo.DbVersions) is null 
insert into [dbo].[DbVersion] values(sysutcdatetime(), 1.0)
declare @dbVersions int 
select top(1) @dbVersions = Version 
from [dbo].[DbVersions]
order by CreationDate desc
if @dbVersions >=2.0 set noexec on


create table [dbo].[Product_Category]
(
	[Id] bigint not null primary key identity (1,1),
	[ProductId] bigint not null,
	[CategoryId] int not null,
	[FeatureName] nvarchar(50) not null,
	[FeatureValue] nvarchar(50) not null
)
go


create table [dbo].[Category]
(
	[Id] int not null primary key identity (1,1),
	[Name] nvarchar(50) not null
)
go


insert into [dbo].[dbo].[Category]
values('KitchenAppliances'), ('Blender'), ('CoffeeMaker'), ('ElectricKettle'), ('Microwave'), ('PressureCooker'), ('Refrigerator'),
      ('WashingAppliances'), ('Dishwasher'), ('Washer'),
      ('FloorCleaningAppliances'), ('RobotVacuum'), ('VacuumCleaner'),
      ('PersonalCare'), ('BlowDryer'), ('ElectricShaver'), ('Iron')
go


exec sp_rename 'Product', 'ProductOld'	
go


create table [dbo].[Product] 
(
	[Id] bigint not null primary key identity (1,1),
	[Name] nvarchar (50) not null,
	[Price] decimal (28,10) not null,
	[Manufacturer] nvarchar(50) not null,
	[ManufacturingYear] int not null,
	[Depth] decimal (28,10) not null,
	[Width] decimal (28,10) not null,
	[Height] decimal (28,10) not null,
	[Weight] decimal (28,10) not null,
	[Wattage] int not null,
	[Voltage] int not null,
	[IsPublished] bit default 0 not null,
	[PublicationDate] datetime2 not null,
	[LastUpdate] datetime2 not null
)
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[DetachableBlades] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Blender')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'DetachableBlades', (select P.[DetachableBlades] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
   close cur
   deallocate cur
   go


   
declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[CoolShotButton] is not null and P.[RemovableEndCap] is not null and
		   P.[DiffuserNozzle] is not null and P.[SpeedSetting] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('BlowDryer')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'CoolShotButton', (select P.[CoolShotButton] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'RemovableEndCap', (select P.[RemovableEndCap] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'DiffuserNozzle', (select P.[DiffuserNozzle] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'SpeedSetting', (select P.[SpeedSetting] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
 close cur
 deallocate cur
 go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[EspressoType] is not null and P.[SteamNozzle] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('CoffeeMaker')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'EspressoType', (select P.[EspressoType] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'SteamNozzle', (select P.[SteamNozzle] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[ThirdRack] is not null and P.[CupClips] is not null and
		   P.[SilverwareBasket] is not null and P.[StemwareHolders] is not null and P.[UtensilSeparator] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Dishwasher')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'ThirdRack', (select P.[ThirdRack] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'CupClips', (select P.[CupClips] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'StemwareHolders', (select P.[StemwareHolders] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'SilverwareBasket', (select P.[SilverwareBasket] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'UtensilSeparator', (select P.[UtensilSeparator] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[WaterLevelWindow] is not null and P.[RemovableTeaInfuser] is not null and
		   P.[FullCircleConnectorOnThePowerbase] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('ElectricKettle')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'WaterLevelWindow', (select P.[WaterLevelWindow] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'RemovableTeaInfuser', (select P.[RemovableTeaInfuser] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'FullCircleConnectorOnThePowerbase', (select P.[FullCircleConnectorOnThePowerbase] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[PivotingHead] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('ElectricShaver')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'PivotingHead', (select P.[PivotingHead] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
 close cur
 deallocate cur
 go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[NonStickSoleplate] is not null and P.[AntiDripSystem] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Iron')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'NonStickSoleplate', (select P.[NonStickSoleplate] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'AntiDripSystem', (select P.[AntiDripSystem] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[Defrost] is not null and P.[Grill] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Microwave')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'Defrost', (select P.[Defrost] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'Grill', (select P.[Grill] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[RemovableBasket] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('PressureCooker')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'RemovableBasket', (select P.[RemovableBasket] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[IceMaker] is not null and P.[Freezer] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Refrigerator')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'IceMaker', (select P.[IceMaker] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'Freezer', (select P.[Freezer] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[ProtectiveBumpers] is not null and P.[RoomByRoomNavigation] is not null and
		   P.[AppControlled] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('RobotVacuum')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'ProtectiveBumpers', (select P.[ProtectiveBumpers] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'RoomByRoomNavigation', (select P.[RoomByRoomNavigation] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'AppControlled', (select P.[AppControlled] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[AdjustableSuction] is not null and P.[CombinationNozzle] is not null and
		   P.[RetractableCord] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('VacuumCleaner')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'AdjustableSuction', (select P.[AdjustableSuction] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'CombinationNozzle', (select P.[CombinationNozzle] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'RetractableCord', (select P.[RetractableCord] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[BleachDispenser] is not null and P.[VibrationReduction] is not null and
		   P.[CylinderCapacity] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Washer')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'BleachDispenser', (select P.[BleachDispenser] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'VibrationReduction', (select P.[VibrationReduction] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'CylinderCapacity', (select P.[CylinderCapacity] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
  close cur
  deallocate cur
  go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[BleachDispenser] is not null and P.[VibrationReduction] is not null and
		   P.[CylinderCapacity] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('Washer')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'BleachDispenser', (select P.[BleachDispenser] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'VibrationReduction', (select P.[VibrationReduction] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'CylinderCapacity', (select P.[CylinderCapacity] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[DustCupCapacity] is not null and P.[WetCleaning] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('FloorCleaningAppliances')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'DustCupCapacity', (select P.[DustCupCapacity] from [dbo].[ProductOld] as P where P.[Id] = @Id)),
			(@ProductId, @CategoryId, 'WetCleaning', (select P.[WetCleaning] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[QuickWashCycle] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('WashingAppliances')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'QuickWashCycle', (select P.[QuickWashCycle] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go



declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[TravelBag] is not null
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('PersonalCare')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'TravelBag', (select P.[TravelBag] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


declare @ProductId bigint
declare @CategoryId bigint
declare @Id bigint 
declare cur cursor for 
     select P.[Id]
     from [dbo].[ProductOld] as P
	 where P.[Programmable] is not null 
   open cur  
   fetch next from cur into @Id  
   while @@fetch_status = 0
   begin
    insert into dbo.[Product]
		values( 
			(select P.[Name] from [dbo].[ProductOld] as P where P.[Id] = @Id), 
			(select P.[Price] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[Manufacturer] from [dbo].[ProductOld] as P where P.[Id] = @Id),
			(select P.[ManufacturingYear] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Depth] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Width] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Height] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Weight] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Wattage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[Voltage] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[PublicationDate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[LastUpdate] from [dbo].[ProductOld] as P where P.[Id] = @Id),	
			(select P.[IsPublished] from [dbo].[ProductOld] as P where P.[Id] = @Id))			
			set @ProductId = scope_identity();
	insert into [dbo].[Category]
		values ('KitchenAppliances')
		set @CategoryId = scope_identity();
	insert into [dbo].[Product_Category]
		values
			(@ProductId, @CategoryId, 'Programmable', (select P.[Programmable] from [dbo].[ProductOld] as P where P.[Id] = @Id))
	fetch next from cur into @Id
   end   
close cur
deallocate cur
go


drop table  [dbo].[ProductOld] 


exec sp_rename 'Product_Create', 'Product_Create_Old'	
go


create procedure [dbo].[Product_Create]
	@Name nvarchar (50),
	@Price decimal (28,10),
	@Manufacturer nvarchar(50),
	@ManufacturingYear int,
	@Depth decimal (28,10),
	@Width decimal (28,10),
	@Height decimal (28,10),
	@Weight decimal (28,10),
	@Wattage int,
	@Voltage int
as
begin
	declare 
	@PublicationTime datetime2 = SYSUTCDATETIME()
	insert into [dbo].[Product] (
		[Name],
		[Price],
		[Manufacturer],
		[ManufacturingYear],
		[Depth],
		[Width],
		[Height],
		[Weight],
		[Wattage],
		[Voltage],
	    [PublicationDate],
	    [LastUpdate]
		)
	values (
		@Name,
		@Price,
		@Manufacturer,
		@ManufacturingYear,
		@Depth,
		@Width,
		@Height,
		@Weight,
		@Wattage,
		@Voltage,
		@PublicationTime,
		@PublicationTime
	)
	select scope_identity() as [ProductId]
end
go

drop procedure [dbo].[Product_Create_Old]
go


exec sp_rename 'Product_Update', 'Product_Update_Old'	
go

create procedure [dbo].[Product_Update]
        @Id bigint,
        @Name nvarchar (50) = null,
        @Price decimal (28,10) = null,
        @Manufacturer nvarchar(50) = null,
        @ManufacturingYear int = null,
        @Depth decimal (28,10) = null,
        @Width decimal (28,10) = null,
        @Height decimal (28,10) = null,
        @Weight decimal (28,10) = null,
        @Wattage int = null,
        @Voltage int = null,
        @IsPublished bit = null
  as
begin
     declare 
	    @UpdateTime datetime2 = SYSUTCDATETIME()
     update [dbo].[Product] 
	 set
        [Name] = case when @Name is not null then @Name else [Name] end,
		[Price] = case when @Price is not null then @Price else [Price] end,
		[Manufacturer] = case when @Manufacturer is not null then @Manufacturer else [Manufacturer] end,
		[ManufacturingYear] = case when @ManufacturingYear is not null then @ManufacturingYear else [ManufacturingYear] end,
		[Depth] = case when @Depth is not null then @Depth else [Depth] end,
		[Width] = case when @Width is not null then @Width else [Width] end,
		[Height] = case when @Height is not null then @Height else [Height] end,
		[Weight] = case when @Weight is not null then @Weight else [Weight] end,
		[Wattage] = case when @Wattage is not null then @Wattage else [Wattage] end,
		[Voltage] = case when @Voltage is not null then @Voltage else [Voltage] end,
        [IsPublished] = case when @IsPublished is not null then @IsPublished else [IsPublished] end,
	    [LastUpdate] = @UpdateTime
     where
        [Id] = @Id
     select P.[Id]
	    from [dbo].[Product] AS P
	    where (@Id = P.Id)
end
go

drop procedure [dbo].[Product_Update_Old]
go


exec sp_rename 'Product_Search', 'Product_Search_Old'	
go


create procedure [dbo].[Product_Search]
	@Id bigint = null,
	@Name nvarchar (50) = null,
	@PriceStart decimal (28,10) = null,
	@PriceEnd decimal (28,10) = null,
	@Manufacturer nvarchar(50) = null,
	@ManufacturingYearStart int = null,
	@ManufacturingYearEnd int = null,
	@Depth decimal (28,10) = null,
	@Width decimal (28,10) = null,
	@Height decimal (28,10) = null,
	@Weight decimal (28,10) = null,
	@WattageStart int = null,
	@WattageEnd int = null,
	@VoltageStart int = null,
	@VoltageEnd int = null,
	@IsPublished bit = null,
	@PublicationDateStart datetime2 = null,
	@PublicationDateEnd datetime2 = null,
	@LastUpdateStart datetime2 = null,
	@LastUpdateEnd datetime2 = null
as
begin
	declare @result nvarchar (max) = '
	SELECT 
		P.[Id],	
		P.[Name],	
		P.[Price],	
		P.[Manufacturer],	
		P.[ManufacturingYear],	
		P.[Depth],
		P.[Width],		
		P.[Height],		
		P.[Weight],
		P.[Wattage],
		P.[Voltage],
		P.[IsPublished],
		P.[PublicationDate],
	    P.[LastUpdate]
    FROM    [dbo].[Product] as P
    WHERE   (1=1)'
	
	if(@Id is not null)
		begin 
			set @result += ' and P.[Id] = ' + CONVERT(nvarchar, @Id)
		end
	if(@Name is not null)
		begin      
			set @result += ' and P.[Name] = ' + '''' + @Name + ''''
		end 
	if(@PriceStart is not null)
		begin
			if(@PriceEnd is not null)
				set @result += ' and (P.[Price] BETWEEN ' + '''' 
				+ CONVERT(nvarchar(50), @PriceStart)  + ''' AND ' + '''' 
				+ CONVERT(nvarchar(50), @PriceEnd) + ''')'
			else set @result += ' and P.[Price] >= ' + CONVERT(nvarchar(50), @PriceStart)   
		end
	if(@PriceEnd is not null and @PriceStart is null)
		begin
			 set @result += ' and P.[Price] <= ' + CONVERT(nvarchar(50), @PriceEnd)   
		end
	if(@Manufacturer is not null)
		begin      
			set @result += ' and P.[Manufacturer] = ' + '''' + @Manufacturer + ''''
    end 
	if(@ManufacturingYearStart is not null)
		begin
			if(@ManufacturingYearEnd is not null)
				set @result += ' and (P.[ManufacturingYear] BETWEEN ' + '''' 
				+ CONVERT(nvarchar(50), @ManufacturingYearStart)  + ''' AND ' + '''' 
				+ CONVERT(nvarchar(50), @ManufacturingYearEnd) + ''')'
			else set @result += ' and P.[ManufacturingYear] >= ' + CONVERT(nvarchar(50), @ManufacturingYearStart)   
		end
	if(@ManufacturingYearEnd is not null and @ManufacturingYearStart is null)
		begin
			 set @result += ' and P.[ManufacturingYear] <= ' + CONVERT(nvarchar(50), @ManufacturingYearEnd)   
		end
    if(@Depth is not null)
		begin     
			set @result += ' and P.[Depth] = ' + CONVERT(nvarchar(50), @Depth)     
		end
	if(@Width is not null)
		begin
			set @result += ' and P.[Width] = ' + CONVERT(nvarchar(50), @Width)
		end
	if(@Height is not null)
		begin
			set @result += ' and P.[Height] = ' + CONVERT(nvarchar(50), @Height)
		end
	if(@Weight is not null)
		begin
			set @result += ' and P.[Weight] = ' + CONVERT(nvarchar(50), @Weight)
		end
	if(@WattageStart is not null)
		begin
			if(@WattageEnd is not null)
				set @result += ' and (P.[Wattage] BETWEEN '+ '''' 
				+ CONVERT(nvarchar, @WattageStart)  + ''' AND ' + '''' 
				+ CONVERT(nvarchar, @WattageEnd) + ''')'
			else set @result += ' and P.[Wattage] >= ' + CONVERT(nvarchar(50), @WattageStart)   
		end
	if(@WattageEnd is not null and @WattageStart is null)
		begin
			 set @result += ' and P.[Wattage] <= ' + CONVERT(nvarchar(50), @WattageEnd)   
		end
	if(@VoltageStart is not null)
		begin
			if(@VoltageEnd is not null)
				set @result += ' and (P.[Voltage] BETWEEN '+ '''' 
				+ CONVERT(nvarchar, @VoltageStart)  + ''' AND ' + ''''  
				+ CONVERT(nvarchar, @VoltageEnd) + ''')'
			else set @result += ' and P.[Voltage] >= ' + CONVERT(nvarchar(50), @VoltageStart)  
		end
	if(@VoltageEnd is not null and @VoltageStart is null)
		begin
			 set @result += ' and P.[Voltage] <= ' + CONVERT(nvarchar(50), @VoltageEnd)   
		end
	if(@IsPublished is not null)
		begin
			set @result += ' and P.[IsPublished] = ' + CONVERT(nvarchar(50), @IsPublished)
		end
	if(@PublicationDateStart is not null)
		begin
			if(@PublicationDateEnd is not null)
				set @result += ' and (P.[PublicationDate] BETWEEN '+ '''' 
				+ CONVERT(nvarchar, @PublicationDateStart)  + ''' AND ' + '''' 
				+ CONVERT(nvarchar, @PublicationDateEnd) + ''')'
			else set @result += ' and P.[PublicationDate] >= ' + CONVERT(nvarchar(50), @PublicationDateStart)  
		end
	if(@PublicationDateEnd is not null and @PublicationDateStart is null)
		begin
			 set @result += ' and P.[PublicationDate] <= ' + CONVERT(nvarchar(50), @PublicationDateEnd)   
		end
	if(@LastUpdateStart is not null)
		begin
			if(@LastUpdateEnd is not null)
				set @result += ' and (P.[LastUpdate] BETWEEN '+ '''' 
				+ CONVERT(nvarchar, @LastUpdateStart)  + ''' AND ' + '''' 
				+ CONVERT(nvarchar, @LastUpdateEnd) + ''')'
			else set @result += ' and P.[LastUpdate] >= ' + CONVERT(nvarchar(50), @LastUpdateStart)  
		end
	if(@LastUpdateEnd is not null and @LastUpdateStart is null)
		begin
			 set @result += ' and P.[LastUpdate] <= ' + CONVERT(nvarchar(50), @LastUpdateEnd)   
		end	
		 set @result += ' OPTION (RECOMPILE) '
	 print @result
	 exec sp_executesql @result
end
go


drop procedure [dbo].[Product_Search_Old]
go


create procedure [dbo].[Product_Category_Search]
	@CategoryId int 
as
begin
	select 
	C.[Name],
	PC.[FeatureName], PC.[FeatureValue],
	P.[Name], P.[Price], P.[Manufacturer], P.[ManufacturingYear], P.[Depth], P.[Width], P.[Height], P.[Weight], P.[Wattage], P.[Voltage], P.[PublicationDate], P.[LastUpdate]
	from [dbo].[Category] as C
	join  [dbo].[Product_Category] as PC on PC.[CategoryId] = C.[Id]
	join  [dbo].[Product] as P on P.[Id] = PC.[ProductId]
	where @CategoryId = C.Id and P.[IsPublished] = 1
end
go


insert into [dbo].[DbVersion] 
values(sysutcdatetime(), 2.0)
set noexec off
