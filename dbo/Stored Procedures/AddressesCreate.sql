
create proc AddressesCreate
	@CustomerId int,
	@AddressLine nvarchar(100),
	@AddressLine2 nvarchar(100),
	@AddressType nvarchar(8),
	@City nvarchar(50),
	@PostalCode nvarchar(6),
	@State nvarchar(20)
as begin
	insert into [dbo].[Address]
           ([CustomerId]
           ,[AddressLine]
           ,[AddressLine2]
           ,[AddressType]
           ,[City]
           ,[PostalCode]
           ,[State])
     values
           (@CustomerId,
           @AddressLine,
           @AddressLine2,
           @AddressType,
           @City,
           @PostalCode,
           @State)
	return scope_identity()
end