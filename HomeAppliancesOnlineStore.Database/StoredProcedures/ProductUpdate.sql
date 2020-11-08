﻿create procedure [dbo].[Product_Update]
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
        @IsPublished bit = null,
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
	    [LastUpdate] = @UpdateTime,
		[RemovableBasket] = case when  @RemovableBasket is not null then @RemovableBasket else [RemovableBasket] end,
		[EspressoType] = case when @EspressoType is not null then @EspressoType else [EspressoType] end,
		[SteamNozzle] = case when @SteamNozzle is not null then @SteamNozzle else [SteamNozzle] end,
		[IntegratedTimer] = case when @IntegratedTimer is not null then @IntegratedTimer else [IntegratedTimer] end,
		[BarsOfPressure] = case when @BarsOfPressure is not null then @BarsOfPressure else [BarsOfPressure] end,
		[DetachableBlades] = case when @DetachableBlades is not null then @DetachableBlades else [DetachableBlades] end,
		[PivotingHead] = case when  @PivotingHead is not null then @PivotingHead else [PivotingHead] end,
		[ProtectiveBumpers] = case when @ProtectiveBumpers is not null then @ProtectiveBumpers else [ProtectiveBumpers] end,
		[AppControlled] = case when @AppControlled is not null then @AppControlled else [AppControlled] end,
		[RoomByRoomNavigation] = case when @RoomByRoomNavigation is not null then @RoomByRoomNavigation else [RoomByRoomNavigation] end,
		[CombinationNozzle] = case when @CombinationNozzle is not null then @CombinationNozzle else [CombinationNozzle] end,
		[DustCupCapacity] = case when @DustCupCapacity is not null then @DustCupCapacity else [DustCupCapacity] end,
		[AdjustableSuction] = case when @AdjustableSuction is not null then @AdjustableSuction else [AdjustableSuction] end,
		[WetCleaning] = case when  @WetCleaning is not null then @WetCleaning else [WetCleaning] end,
		[RetractableCord] = case when @RetractableCord is not null then @RetractableCord else [RetractableCord] end,
		[NonStickSoleplate] = case when  @NonStickSoleplate is not null then @NonStickSoleplate else [NonStickSoleplate] end,
		[AntiDripSystem] = case when @AntiDripSystem is not null then @AntiDripSystem else [AntiDripSystem] end,
		[SpeedSetting] = case when @SpeedSetting is not null then @SpeedSetting else [SpeedSetting] end,
		[RemovableEndCap] = case when @RemovableEndCap is not null then @RemovableEndCap else [RemovableEndCap] end,
		[DiffuserNozzle] = case when @DiffuserNozzle is not null then @DiffuserNozzle else [DiffuserNozzle] end,
		[BleachDispenser] = case when @BleachDispenser is not null then @BleachDispenser else [BleachDispenser] end,
		[Defrost] = case when @Defrost is not null then @Defrost else [Defrost] end,
		[Grill] = case when @Grill is not null then @Grill else [Grill] end,
		[ThirdRack] = case when @ThirdRack is not null then @ThirdRack else [ThirdRack] end,
		[CupClips] = case when @CupClips is not null then @CupClips else [CupClips] end,
		[SilverwareBasket] = case when @SilverwareBasket is not null then @SilverwareBasket else [SilverwareBasket] end,
		[StemwareHolders] = case when @StemwareHolders is not null then @StemwareHolders else [StemwareHolders] end,
		[UtensilSeparator] = case when @UtensilSeparator is not null then @UtensilSeparator else [UtensilSeparator] end,
		[VibrationReduction] = case when @VibrationReduction is not null then @VibrationReduction else [VibrationReduction] end,
		[QuickWashCycle] = case when @QuickWashCycle is not null then @QuickWashCycle else [QuickWashCycle] end,
		[CylinderCapacity] = case when @CylinderCapacity is not null then @CylinderCapacity else [CylinderCapacity] end,
		[IceMaker] = case when @IceMaker is not null then @IceMaker else [IceMaker] end,
		[TemperatureAlarm] = case when @TemperatureAlarm is not null then @TemperatureAlarm else [TemperatureAlarm] end,
		[Freezer] = case when @Freezer is not null then @Freezer else [Freezer] end,
		[RemovableTeaInfuser] = case when @RemovableTeaInfuser is not null then @RemovableTeaInfuser else [RemovableTeaInfuser] end,
		[WaterLevelWindow] = case when @WaterLevelWindow is not null then @WaterLevelWindow else [WaterLevelWindow] end,
		[FullCircleConnectorOnThePowerbase] = case when @FullCircleConnectorOnThePowerbase is not null then @FullCircleConnectorOnThePowerbase else [FullCircleConnectorOnThePowerbase] end,
		[TravelBag] = case when @TravelBag is not null then @TravelBag else [TravelBag] end,
		[Programmable] = case when @Programmable is not null then @Programmable else [Programmable] end
     where
        [Id] = @Id
     select P.[Id]
	    from [dbo].[Product] AS P
	    where (@Id = P.Id)
end