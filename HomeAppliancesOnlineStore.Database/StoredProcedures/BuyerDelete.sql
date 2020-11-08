create procedure [dbo].[Buyer_Delete]
	@Id bigint
as
	begin
		update [dbo].[Buyer]
			set [IsDeleted] = 1, [LastUpdate] = SYSUTCDATETIME()
			where (@Id = Id)
			select @@rowcount
  end