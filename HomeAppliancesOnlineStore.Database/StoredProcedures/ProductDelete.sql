create procedure [dbo].[Product_Delete]
	@Id bigint
as
	begin
		update [dbo].[Product]
			set [IsPublished] = 0, [LastUpdate] = SYSUTCDATETIME()
			where (@Id = Id)
		select P.[Id], P.[Name], P.[IsPublished]
			from [dbo].[Product] AS P
			where (@Id = P.Id)
  end
