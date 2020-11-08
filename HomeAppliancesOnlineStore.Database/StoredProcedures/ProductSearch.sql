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
	@LastUpdateEnd datetime2 = null,
	@RemovableBasket nvarchar(30) = null,
	@EspressoType nvarchar(30) = null,
	@SteamNozzle nvarchar(30) = null,
	@IntegratedTimer nvarchar(30) = null,
	@BarsOfPressure nvarchar(30) = null,
	@DetachableBlades nvarchar(30) = null,
	@PivotingHead nvarchar(30) = null,
	@ProtectiveBumpers nvarchar(30) = null,
	@AppControlled nvarchar(30) = null,
	@RoomByRoomNavigation nvarchar(30) = null,
	@CombinationNozzle nvarchar(30) = null,
	@DustCupCapacity nvarchar(30) = null,
	@AdjustableSuction nvarchar(30) = null,
	@WetCleaning nvarchar(30) = null,
	@RetractableCord nvarchar(30) = null,
	@NonStickSoleplate nvarchar(30) = null,
	@AntiDripSystem nvarchar(30) = null,
	@SpeedSetting nvarchar(30) = null,
	@CoolShotButton nvarchar(30) = null,
	@RemovableEndCap nvarchar(30) = null,
	@DiffuserNozzle nvarchar(30) = null,
	@BleachDispenser nvarchar(30) = null,
	@Defrost nvarchar(30) = null,
	@Grill nvarchar(30) = null,
	@ThirdRack nvarchar(30) = null,
	@CupClips nvarchar(30) = null,
	@SilverwareBasket nvarchar(30) = null,
	@StemwareHolders nvarchar(30) = null,
	@UtensilSeparator nvarchar(30) = null,
	@VibrationReduction nvarchar(30) = null,
	@QuickWashCycle nvarchar(30) = null,
	@CylinderCapacity nvarchar(30) = null,
	@IceMaker nvarchar(30) = null,
	@TemperatureAlarm nvarchar(30) = null,
	@Freezer nvarchar(30) = null,
	@RemovableTeaInfuser nvarchar(30) = null,
	@WaterLevelWindow nvarchar(30) = null,
	@FullCircleConnectorOnThePowerbase nvarchar(30) = null,
	@TravelBag nvarchar(30) = null,
	@Programmable nvarchar(30) = null

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
	    P.[LastUpdate],
		P.[RemovableBasket],
		P.[EspressoType],
		P.[SteamNozzle],
		P.[IntegratedTimer],
		P.[BarsOfPressure],
		P.[DetachableBlades],
		P.[PivotingHead],
		P.[ProtectiveBumpers],
		P.[AppControlled],
		P.[RoomByRoomNavigation],
		P.[CombinationNozzle],
		P.[DustCupCapacity],
		P.[AdjustableSuction],
		P.[WetCleaning],
		P.[RetractableCord],
		P.[NonStickSoleplate],
		P.[AntiDripSystem],
		P.[SpeedSetting],
		P.[CoolShotButton],
		P.[RemovableEndCap],
		P.[DiffuserNozzle],
		P.[BleachDispenser],
		P.[Defrost],
		P.[Grill],
		P.[ThirdRack],
		P.[CupClips],
		P.[SilverwareBasket],
		P.[StemwareHolders],
		P.[UtensilSeparator],
		P.[VibrationReduction],
		P.[QuickWashCycle],
		P.[CylinderCapacity],
		P.[IceMaker],
		P.[TemperatureAlarm],
		P.[Freezer],
		P.[RemovableTeaInfuser],
		P.[WaterLevelWindow],
		P.[FullCircleConnectorOnThePowerbase],
		P.[TravelBag],
		P.[Programmable]
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
	if(@RemovableBasket is not null)
		begin
			set @result += ' and P.[RemovableBasket] = ' + '''' + @RemovableBasket + ''''
		end
	if(@EspressoType is not null)
		begin
			set @result += ' and P.[EspressoType] = ' + '''' + @EspressoType + ''''
		end
	if(@SteamNozzle is not null)
		begin
			set @result += ' and P.[SteamNozzle] = ' + '''' + @SteamNozzle + ''''
		end
	if(@IntegratedTimer is not null)
		begin
			set @result += ' and P.[IntegratedTimer] = ' + '''' + @IntegratedTimer + ''''
		end
	if(@BarsOfPressure is not null)
		begin
			set @result += ' and P.[BarsOfPressure] = ' + '''' + @BarsOfPressure + ''''
		end
	if(@DetachableBlades is not null)
		begin
			set @result += ' and P.[DetachableBlades] = ' + '''' + @DetachableBlades + ''''
		end
	if(@PivotingHead is not null)
		begin
			set @result += ' and P.[PivotingHead] = ' + '''' + @PivotingHead + ''''
		end
	if(@ProtectiveBumpers is not null)
		begin
			set @result += ' and P.[ProtectiveBumpers] = ' + '''' + @ProtectiveBumpers + ''''
		end
	if(@AppControlled is not null)
		begin
			set @result += ' and P.[AppControlled] = ' + '''' + @AppControlled + ''''
		end
	if(@RoomByRoomNavigation is not null)
		begin
			set @result += ' and P.[RoomByRoomNavigation] = ' + '''' + @RoomByRoomNavigation + ''''
		end
	if(@CombinationNozzle is not null)
		begin
			set @result += ' and P.[CombinationNozzle] = ' + '''' + @CombinationNozzle + ''''
		end
	if(@DustCupCapacity is not null)
		begin
			set @result += ' and P.[DustCupCapacity] = ' + '''' + @DustCupCapacity + ''''
		end
	if(@AdjustableSuction is not null)
		begin
			set @result += ' and P.[AdjustableSuction] = ' + '''' + @AdjustableSuction + ''''
		end
	if(@WetCleaning is not null)
		begin
			set @result += ' and P.[WetCleaning] = ' + '''' + @WetCleaning + ''''
		end
	if(@RetractableCord is not null)
		begin
			set @result += ' and P.[RetractableCord] = ' + '''' + @RetractableCord + ''''
		end
	if(@NonStickSoleplate is not null)
		begin
			set @result += ' and P.[NonStickSoleplate] = ' + '''' + @NonStickSoleplate + ''''
		end
	if(@AntiDripSystem is not null)
		begin
			set @result += ' and P.[AntiDripSystem] = ' + '''' + @AntiDripSystem + ''''
		end
	if(@SpeedSetting is not null)
		begin
			set @result += ' and P.[SpeedSetting] = ' + '''' + @SpeedSetting + ''''
		end
	if(@CoolShotButton is not null)
		begin
			set @result += ' and P.[CoolShotButton] = ' + '''' + @CoolShotButton + ''''
		end
	if(@RemovableEndCap is not null)
		begin
			set @result += ' and P.[RemovableEndCap] = ' + '''' + @RemovableEndCap + ''''
		end
	if(@DiffuserNozzle is not null)
		begin
			set @result += ' and P.[DiffuserNozzle] = ' + '''' + @DiffuserNozzle + ''''
		end
	if(@BleachDispenser is not null)
		begin
			set @result += ' and P.[BleachDispenser] = ' + '''' + @BleachDispenser + ''''
		end
	if(@Defrost is not null)
		begin
			set @result += ' and P.[Defrost] = ' + '''' + @Defrost + ''''
		end
	if(@Grill is not null)
		begin
			set @result += ' and P.[Grill] = ' + '''' + @Grill + ''''
		end
	if(@ThirdRack is not null)
		begin
			set @result += ' and P.[ThirdRack] = ' + '''' + @ThirdRack + ''''
		end
	if(@CupClips is not null)
		begin
			set @result += ' and P.[CupClips] = ' + '''' + @CupClips + ''''
		end
	if(@SilverwareBasket is not null)
		begin
			set @result += ' and P.[SilverwareBasket] = ' + '''' + @SilverwareBasket + ''''
		end
	if(@StemwareHolders is not null)
		begin
			set @result += ' and P.[StemwareHolders] = ' + '''' + @StemwareHolders + ''''
		end
	if(@UtensilSeparator is not null)
		begin
			set @result += ' and P.[UtensilSeparator] = ' + '''' + @UtensilSeparator + ''''
		end
	if(@VibrationReduction is not null)
		begin
			set @result += ' and P.[VibrationReduction] = ' + '''' + @VibrationReduction + ''''
		end
	if(@QuickWashCycle is not null)
		begin
			set @result += ' and P.[QuickWashCycle] = ' + '''' + @QuickWashCycle + ''''
		end
	if(@CylinderCapacity is not null)
		begin
			set @result += ' and P.[CylinderCapacity] = ' + '''' + @CylinderCapacity + ''''
		end
	if(@IceMaker is not null)
		begin
			set @result += ' and P.[IceMaker] = ' + '''' + @IceMaker + ''''
		end
	if(@TemperatureAlarm is not null)
		begin
			set @result += ' and P.[TemperatureAlarm] = ' + '''' + @TemperatureAlarm + ''''
		end
	if(@Freezer is not null)
		begin
			set @result += ' and P.[Freezer] = ' + '''' + @Freezer + ''''
		end
	if(@RemovableTeaInfuser is not null)
		begin
			set @result += ' and P.[RemovableTeaInfuser] = ' + '''' + @RemovableTeaInfuser + ''''
		end
	if(@WaterLevelWindow is not null)
		begin
			set @result += ' and P.[WaterLevelWindow] = ' + '''' + @WaterLevelWindow + ''''
		end
	if(@FullCircleConnectorOnThePowerbase is not null)
		begin
			set @result += ' and P.[FullCircleConnectorOnThePowerbase] = ' + '''' + @FullCircleConnectorOnThePowerbase + ''''
		end
	if(@TravelBag is not null)
		begin
			set @result += ' and P.[TravelBag] = ' + '''' + @TravelBag + ''''
		end
	if(@Programmable is not null)
		begin
			set @result += ' and P.[Programmable] = ' + '''' + @Programmable + ''''
		end

		 set @result += ' OPTION (RECOMPILE) '
	 print @result
	 exec sp_executesql @result
end